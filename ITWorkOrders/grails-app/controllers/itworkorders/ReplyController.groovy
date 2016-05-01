/*
Reply Controller

Developer: Matt Gaines, Alexander Heavner, Daniel Dingess
Last Update: 5/1/2016

Purpose: Used to create, edit/update, and delete replies.

- Must not be able to create notes if ticket has not been created, this is handles using different forms in ticekt.
- Secured: ROLE_TECH and ROLE_ADMIN.

*/
package itworkorders

import grails.plugin.springsecurity.annotation.Secured

//Required to get user role
import org.springframework.security.core.Authentication
import org.springframework.security.core.context.SecurityContextHolder

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional


@Transactional(readOnly = true)
@Secured(['ROLE_ADMIN', 'ROLE_TECH', 'ROLE_USER'])
class ReplyController {

    //Required to get currentUser
    def springSecurityService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Reply.list(params), model:[replyInstanceCount: Reply.count()]
    }

    def show(Reply replyInstance) {

        //Set ticket as session variable to reference in the edit action
        Ticket ticketInstance = session['ticket']

        //Get logged in user and user role
        def user = springSecurityService.currentUser
        Authentication auth = SecurityContextHolder.getContext().getAuthentication()
        String role = auth.getAuthorities()

        //Add history item of reply to ticket
        ticketInstance.history.add "" + new Date() + ": " + user.firstName + " " + user.lastName+" replied to this ticket."

        //Email notification for new ticket

        // --- EMAIL PATRON --- ///
        //Check to make sure that current logged in user is technician or admin
        if(role.equals("[ROLE_ADMIN]") || role.equals("[ROLE_TECH]")) {
            sendMail {
                to ticketInstance.email
                subject "Your ticket (ID: " + ticketInstance.id + ") has a new reply from " + user.firstName + " " + user.lastName + "."
                html g.render(template: "/grails-app/views/email/replyTech", model: [ticketInstance: ticketInstance])
            }
        }
        //  --- EMAIL TECHNICIAN ---  //
        //First check to make sure that the current logged in user is a Patron ROLE_USER
        else if(role.equals("[ROLE_USER]")) {
            //Next check to make sure that the ticket has an assigned technician
            if (ticketInstance.technician) {
                sendMail {
                    to ticketInstance.technician.username
                    subject "A Patron has replied to a ticket."
                    html g.render(template: "/grails-app/views/email/replyUser", model: [ticketInstance: ticketInstance])
                }
            }
        }
        respond replyInstance
    }

    def create() {
        respond new Reply(params)
    }

    def createCloseReply() {
        respond new Reply(params)
    }

    @Transactional
    def save(Reply replyInstance) {
        if (replyInstance == null) {
            notFound()
            return
        }

        if (replyInstance.hasErrors()) {
            respond replyInstance.errors, view:'create'
            return
        }


        replyInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'reply.label', default: 'Reply'), replyInstance.id])
                redirect replyInstance
            }
            '*' { respond replyInstance, [status: CREATED] }
        }
    }

    def saveClose(Reply replyInstance) {
        if (replyInstance == null) {
            notFound()
            return
        }

        if (replyInstance.hasErrors()) {
            respond replyInstance.errors, view:'create'
            return
        }

        replyInstance.save flush:true
        redirect(controller: 'ticket', action:'close')
        /*
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'reply.label', default: 'Reply'), replyInstance.id])
            }
            '*' { respond replyInstance, [status: CREATED] }
        }*/
    }


    def edit(Reply replyInstance) {
        respond replyInstance
    }

    @Transactional
    def update(Reply replyInstance) {
        if (replyInstance == null) {
            notFound()
            return
        }

        if (replyInstance.hasErrors()) {
            respond replyInstance.errors, view:'edit'
            return
        }

        replyInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Reply.label', default: 'Reply'), replyInstance.id])
                redirect replyInstance
            }
            '*'{ respond replyInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Reply replyInstance) {

        if (replyInstance == null) {
            notFound()
            return
        }

        replyInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Reply.label', default: 'Reply'), replyInstance.id])
                redirect(controller:"Ticket", action:"index")
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'reply.label', default: 'Reply'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
