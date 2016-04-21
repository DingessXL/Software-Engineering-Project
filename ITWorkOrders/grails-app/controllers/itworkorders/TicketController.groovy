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

    //To get current logged in user
    def springSecurityService
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
            // Original Code for Index after generate-all script: respond Ticket.list(params), model: [ticketInstanceCount: Ticket.count()]

        //Get current logged in user authentication information
        Authentication auth = SecurityContextHolder.getContext().getAuthentication()
        String name = auth.getName() //Get login username

            //Query database for users tickets -- Doing all tickets including closed tickets.
            //Currently set to only show most recent tickets.
            respond Ticket.executeQuery("from Ticket where email = '$name'", [offset:0, max:50])

    }

    def show(Ticket ticketInstance) {
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


        def user = getAuthenticatedUser()
        if(ticketInstance.history)
        {
            ticketInstance.history.add "Ticket created by " + user.firstName + " " + user.lastName + " on " + new Date()
        }
        else
        {
            ticketInstance.history = ["Ticket created by " + user.firstName + " " + user.lastName + " on " + new Date()]
        }


        ticketInstance.save flush:true

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
        def user = getAuthenticatedUser()
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

    def close(Ticket ticketInstance){
        if (ticketInstance == null){
            notFound()
            return
        }

        //Add History
        def user = getAuthenticatedUser()
        ticketInstance.history.add "" + new Date() + ":  Ticket closed by " + user.firstName + " " + user.lastName+"."

        //set ticketStatus to id=2 (closed)
        def newStatus = Status.get(2)
        ticketInstance.ticketStatus = newStatus
        ticketInstance.save flush:true



        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Ticket.label', default: 'Ticket'), ticketInstance.id])
                redirect ticketInstance
            }
            '*'{ respond ticketInstance, [status: OK] }
        }

    }

    def open(Ticket ticketInstance){
        if (ticketInstance == null){
            notFound()
            return
        }

        //Update History
        def user = getAuthenticatedUser()
        ticketInstance.history.add "" + new Date() + ":  Ticket reopened by " + user.firstName + " " + user.lastName+"."

        //set ticketStatus to id=1 (open)
        def newStatus = Status.get(1)
        ticketInstance.ticketStatus = newStatus
        ticketInstance.save flush:true



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