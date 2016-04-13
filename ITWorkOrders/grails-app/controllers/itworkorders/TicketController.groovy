package itworkorders



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TicketController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]


    //Email function to sen email notifications to users on ticket changes
    def email() {
        sendMail {
            to "alexander.heavner@bobcats.gcsu.edu"
            subject "This is a cool kid test"
            body 'Kush did 4/20'
        }
    }

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

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Ticket.label', default: 'Ticket'), ticketInstance.id])
                redirect ticketInstance
            }
            '*'{ respond ticketInstance, [status: OK] }
        }
    }

    @Transactional
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
