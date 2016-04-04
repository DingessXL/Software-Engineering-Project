package itworkorders



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PriorityController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Priority.list(params), model:[priorityInstanceCount: Priority.count()]
    }

    def show(Priority priorityInstance) {
        respond priorityInstance
    }

    def create() {
        respond new Priority(params)
    }

    @Transactional
    def save(Priority priorityInstance) {
        if (priorityInstance == null) {
            notFound()
            return
        }

        if (priorityInstance.hasErrors()) {
            respond priorityInstance.errors, view:'create'
            return
        }

        priorityInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'priority.label', default: 'Priority'), priorityInstance.id])
                redirect priorityInstance
            }
            '*' { respond priorityInstance, [status: CREATED] }
        }
    }

    def edit(Priority priorityInstance) {
        respond priorityInstance
    }

    @Transactional
    def update(Priority priorityInstance) {
        if (priorityInstance == null) {
            notFound()
            return
        }

        if (priorityInstance.hasErrors()) {
            respond priorityInstance.errors, view:'edit'
            return
        }

        priorityInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Priority.label', default: 'Priority'), priorityInstance.id])
                redirect priorityInstance
            }
            '*'{ respond priorityInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Priority priorityInstance) {

        if (priorityInstance == null) {
            notFound()
            return
        }

        priorityInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Priority.label', default: 'Priority'), priorityInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'priority.label', default: 'Priority'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
