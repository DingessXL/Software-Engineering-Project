package itworkorders

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)

@Secured(['ROLE_ADMIN', 'ROLE_TECH', 'ROLE_USER'])

class TicketController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]


    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Ticket.list(params), model:[ticketInstanceCount: Ticket.count()]
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

        //Add to history of ticket
        def user = getAuthenticatedUser()
        ticketInstance.history.add "Ticket updated by " + user.firstName + " " + user.lastName + " on " + new Date()

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
