package itworkorders



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class WorkGroupController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond WorkGroup.list(params), model:[workGroupInstanceCount: WorkGroup.count()]
    }

    def show(WorkGroup workGroupInstance) {
        respond workGroupInstance
    }

    def create() {
        respond new WorkGroup(params)
    }

    @Transactional
    def save(WorkGroup workGroupInstance) {
        if (workGroupInstance == null) {
            notFound()
            return
        }

        if (workGroupInstance.hasErrors()) {
            respond workGroupInstance.errors, view:'create'
            return
        }

        workGroupInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'workGroup.label', default: 'WorkGroup'), workGroupInstance.id])
                redirect workGroupInstance
            }
            '*' { respond workGroupInstance, [status: CREATED] }
        }
    }

    def edit(WorkGroup workGroupInstance) {
        respond workGroupInstance
    }

    @Transactional
    def update(WorkGroup workGroupInstance) {
        if (workGroupInstance == null) {
            notFound()
            return
        }

        if (workGroupInstance.hasErrors()) {
            respond workGroupInstance.errors, view:'edit'
            return
        }

        workGroupInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'WorkGroup.label', default: 'WorkGroup'), workGroupInstance.id])
                redirect workGroupInstance
            }
            '*'{ respond workGroupInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(WorkGroup workGroupInstance) {

        if (workGroupInstance == null) {
            notFound()
            return
        }

        workGroupInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'WorkGroup.label', default: 'WorkGroup'), workGroupInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'workGroup.label', default: 'WorkGroup'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
