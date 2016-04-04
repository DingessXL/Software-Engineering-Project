package itworkorders



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ReplyController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Reply.list(params), model:[replyInstanceCount: Reply.count()]
    }

    def show(Reply replyInstance) {
        respond replyInstance
    }

    def create() {
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
                redirect action:"index", method:"GET"
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
