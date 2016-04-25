package itworkorders
import org.springframework.security.core.Authentication
import org.springframework.security.core.context.SecurityContextHolder
import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityService

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
@Secured(['ROLE_ADMIN', 'ROLE_TECH', 'ROLE_USER'])
class TicketController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def viewStatus = "Open"
    def workgroupID
    def techID

    //To get current logged in user
    def springSecurityService
    def index(Integer max) {

        //Get current logged in user authentication information
        Authentication auth = SecurityContextHolder.getContext().getAuthentication()
        def user = springSecurityService.currentUser
        String role = auth.getAuthorities()

        //If user is a tech or admin, display all tickets.  Filter list based on tech workgroup id in view.
        if(role.equals("[ROLE_ADMIN]") || role.equals("[ROLE_TECH]")){

            //If workgroupID has not been set, set it to current logged in user workgroupID.
            if(workgroupID==null) {
                workgroupID = user.workgroup.id
            }

            params.max = Math.min(params.max ? params.int('max') :5, 100)
            def ticketList = Ticket.createCriteria().list(params){

                //Search Email
                if(params.queryEmail){
                    respond Ticket.executeQuery("from Ticket where email like '%${params.queryEmail}%'")
                }
                //Search by Ticket ID
                else if(params.queryID) {
                    respond Ticket.executeQuery("from Ticket where id = '$params.queryID'")
                }
                //Search by First Name
                else if(params.queryFirstName){
                    respond Ticket.executeQuery("from Ticket where lower(firstName) like lower('%${params.queryFirstName}%')")
                }
                //Search by Last Name
                else if(params.queryLastName){
                    respond Ticket.executeQuery("from Ticket where lower(firstName) like lower('%${params.queryLastName}%')")
                }
                //Search by Subject
                else if(params.querySubject){
                    respond Ticket.executeQuery("from Ticket where lower(subject) like lower('%${params.querySubject}%')")
                }
                else if(techID!=null) {
                    respond Ticket.executeQuery("from Ticket where technician.id = ${techID}")
                }
                //Display All Open tickets
                else{

                    //Show all tickets for the users workgroup id and $viewStatus.
                    respond Ticket.executeQuery("from Ticket where lower(status) like lower('%${viewStatus}%') and workgroup.id = $workgroupID")

                    //Currently showing all tickets, open and closed, until filter is implemented.
                    //respond Ticket.list(params), model: [ticketInstanceCount: Ticket.count()]
                }
            }
        }
        //else if regular user, just display the tickets for that user by username=ticketInstance.email
        else {
            params.max = Math.min(params.max ? params.int('max') :5, 100)
            def ticketList = Ticket.createCriteria().list(params){
                //Search by Ticket ID
                if(params.queryID) {
                    respond Ticket.executeQuery("from Ticket where id = '$params.queryID'")
                }
                else{
                    //Query database for users tickets -- Show only users tickets that are open.
                    //Add offset to change amount: , [offset: 0, max: 50]
                    respond Ticket.executeQuery("from Ticket where lower(status) like lower('%${viewStatus}%') and lower(email) = lower('$user.username')")
                }
            }
        }
    }
    def show(Ticket ticketInstance) {
        //Save ticket in session for use in the replies
        session['ticket'] = ticketInstance
        respond ticketInstance
    }

    def create() {
        respond new Ticket(params)
    }

    @Transactional
    def save(Ticket ticketInstance) {
        if (ticketInstance == null) {
            notFound()
            return
        }

        if (ticketInstance.hasErrors()) {
            respond ticketInstance.errors, view:'create'
            return
        }

        //Add to history of ticket

        def user = springSecurityService.currentUser
        if(ticketInstance.history)
        {
            ticketInstance.history.add "Ticket created by " + user.firstName + " " + user.lastName + " on " + new Date()
        }
        else
        {
            ticketInstance.history = ["Ticket created by " + user.firstName + " " + user.lastName + " on " + new Date()]
        }

        ticketInstance.save flush:true

        //NEEDED FOR DOCUMENT UPLOAD TO SERVER
        /* Cannot find a good solution for this
        if(ticketInstance.save(flush:true)){
            def documentUpload = request.getFile('document')
            if(!documentUpload.isEmpty()){
               if(ticketInstance.document){
                   ticketInstance.document.add FileUploadService.uploadFile(documentUpload, "${ticketInstance.id}.png", "uploadedDocuments")
               }
            }
        } */

        //Email notification for new ticket
        //Email owner of ticket
        sendMail {
            to ticketInstance.email
            subject "A New Ticket Has Been Created"
            html g.render(template:"/grails-app/views/email/ticketcreate", model:[ticketInstance:ticketInstance])
        }

        //Email technician if one is assigned
        if(ticketInstance.technician)
        {
            sendMail {
                to ticketInstance.technician.username
                subject "A Ticket Has Been Updated"
                html g.render(template:"/grails-app/views/email/ticketupdate", model:[ticketInstance:ticketInstance])
            }
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'ticket.label', default: 'Ticket'), ticketInstance.id])
                redirect ticketInstance
            }
            '*' { respond ticketInstance, [status: CREATED] }
        }
    }

    def edit(Ticket ticketInstance) {
        respond ticketInstance
    }

    //ONLY ADMINS AND TECH SHOULD BE ABLE TO ASSIGN TECHS
    //the button is hidden from regular users, this prevents users from accessing controller manually.
    @Secured(['ROLE_ADMIN', 'ROLE_TECH'])
    def editTech(Ticket ticketInstance) {
        respond ticketInstance
    }

    def editWorkgroup(Ticket ticketInstance){
        respond ticketInstance
    }
    @Secured(['ROLE_ADMIN', 'ROLE_TECH', 'ROLE_USER'])
    def openTickets() {
        viewStatus = "Open"
        redirect(action: "index")
    }
    @Secured(['ROLE_ADMIN', 'ROLE_TECH', 'ROLE_USER'])
    def closedTickets(){
        viewStatus = "Closed"
        redirect(action: "index")
    }
    @Secured(['ROLE_ADMIN','ROLE_TECH'])
    def showAssignedTickets(){
        def user = springSecurityService.currentUser
        techID = user.id
        redirect(action: "index")
    }
    def showAllTickets(){
        techID = null
        redirect(action: "index")
    }
    @Secured(['ROLE_ADMIN','ROLE_TECH'])
    def showWorkgroupTickets(){
        workgroupID = params.workgroup
        redirect(action:"index")
    }

    @Transactional
    def update(Ticket ticketInstance) {
        if (ticketInstance == null) {
            notFound()
            return
        }

        if (ticketInstance.hasErrors()) {
            respond ticketInstance.errors, view:'edit'
            return
        }

        //Add to history of ticket
        def user = springSecurityService.currentUser
        def size = ticketInstance.history.size()
        ticketInstance.history.add "" + new Date() + ":  Ticket updated by " + user.firstName + " " + user.lastName+"."

        ticketInstance.save flush:true

        //Email notification for new ticket
        //Email owner of ticket
        sendMail {
            to ticketInstance.email
            subject "A Ticket Has Been Updated"
            html g.render(template:"/grails-app/views/email/ticketupdate", model:[ticketInstance:ticketInstance])
        }

        //Email technician if one is assigned
        if(ticketInstance.technician)
        {
            sendMail {
                to ticketInstance.technician.username
                subject "A Ticket Has Been Updated"
                html g.render(template:"/grails-app/views/email/ticketupdate", model:[ticketInstance:ticketInstance])
            }
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Ticket.label', default: 'Ticket'), ticketInstance.id])
                redirect ticketInstance
            }
            '*'{ respond ticketInstance, [status: OK] }
        }
    }
    def workgroupSelect(){

    }

    @Transactional
    @Secured(['ROLE_ADMIN'])
    def delete(Ticket ticketInstance) {

        if (ticketInstance == null) {
            notFound()
            return
        }

        ticketInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Ticket.label', default: 'Ticket'), ticketInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    def close(){
        Ticket ticketInstance = session['ticket']

        if (ticketInstance == null){
            notFound()
            return
        }

        //Add History
        def user = springSecurityService.currentUser
        ticketInstance.history.add "" + new Date() + ":  Ticket closed by " + user.firstName + " " + user.lastName+"."

        //set ticket status to closed

        ticketInstance.status = "Closed"
        ticketInstance.save flush:true

        //Email notification for new ticket
        //Email owner of ticket
        sendMail {
            to ticketInstance.email
            subject "A Ticket Has Been Closed"
            html g.render(template:"/grails-app/views/email/ticketclose", model:[ticketInstance:ticketInstance])
        }

        //Email technician if one is assigned
        if(ticketInstance.technician)
        {
            sendMail {
                to ticketInstance.technician.username
                subject "A Ticket Has Been Closed"
                html g.render(template:"/grails-app/views/email/ticketclose", model:[ticketInstance:ticketInstance])
            }
        }

        redirect(controller: "ticket", action: "index")

    }

    def open(Ticket ticketInstance){
        if (ticketInstance == null){
            notFound()
            return
        }

        //Update History
        def user = springSecurityService.currentUser
        ticketInstance.history.add "" + new Date() + ":  Ticket reopened by " + user.firstName + " " + user.lastName+"."

        //set ticket status to Open
        ticketInstance.status = "Open"
        ticketInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Ticket.label', default: 'Ticket'), ticketInstance.id])
                redirect ticketInstance
            }
            '*'{ respond ticketInstance, [status: OK] }
        }

    }

    //Controller for assigning tech.
    def assignTech(Ticket ticketInstance){
        if (ticketInstance == null) {
            notFound()
            return
        }

        if (ticketInstance.hasErrors()) {
            respond ticketInstance.errors, view:'edit'
            return
        }

        //Add to history of ticket
        def user = springSecurityService.currentUser
        def size = ticketInstance.history.size()
        ticketInstance.history.add "" + new Date() + ":  Ticket assigned to " + ticketInstance.technician + " by " + user.firstName + " " + user.lastName+"."

        ticketInstance.save flush:true

        //Email notification for new ticket
        //Email owner of ticket
        sendMail {
            to ticketInstance.email
            subject "Your ticket (ID: "+ticketInstance.id+") has been assigned to a technician."
            html g.render(template:"/grails-app/views/email/ticketAssignedUser", model:[ticketInstance:ticketInstance])
        }

        //Email technician if one is assigned
        if(ticketInstance.technician)
        {
            sendMail {
                to ticketInstance.technician.username
                subject "A ticket has been assigned to you."
                html g.render(template:"/grails-app/views/email/ticketAssignedTech", model:[ticketInstance:ticketInstance])
            }
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Ticket.label', default: 'Ticket'), ticketInstance.id])
                redirect ticketInstance
            }
            '*'{ respond ticketInstance, [status: OK] }
        }

    }

    //Controller for assigning tech.
    def assignWorkgroup(Ticket ticketInstance){
        if (ticketInstance == null) {
            notFound()
            return
        }

        if (ticketInstance.hasErrors()) {
            respond ticketInstance.errors, view:'edit'
            return
        }

        //Add to history of ticket
        def user = springSecurityService.currentUser
        def size = ticketInstance.history.size()
        ticketInstance.history.add "" + new Date() + ":  Ticket workgroup switched to " + ticketInstance.workgroup + " by " + user.firstName + " " + user.lastName+"."

        //Assign to unassigned technician
        def unassigned = User.get(1)
        ticketInstance.technician = unassigned

        ticketInstance.save flush:true

        //Email notification for new ticket
        //Email owner of ticket
        sendMail {
            to ticketInstance.email
            subject "Your ticket (ID: "+ticketInstance.id+") has been switched to another workgroup."
            html g.render(template:"/grails-app/views/email/ticketWorkgroupUser", model:[ticketInstance:ticketInstance])
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Ticket.label', default: 'Ticket'), ticketInstance.id])
                redirect ticketInstance
            }
            '*'{ respond ticketInstance, [status: OK] }
        }

    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'ticket.label', default: 'Ticket'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}