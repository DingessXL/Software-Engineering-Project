package itworkorders



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class QueueController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Queue.list(params), model:[queueInstanceCount: Queue.count()]
    }

    def show(Queue queueInstance) {
        respond queueInstance
    }

    def create() {
        respond new Queue(params)
    }

    @Transactional
    def save(Queue queueInstance) {
        if (queueInstance == null) {
            notFound()
            return
        }

        if (queueInstance.hasErrors()) {
            respond queueInstance.errors, view:'create'
            return
        }

        queueInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'queue.label', default: 'Queue'), queueInstance.id])
                redirect queueInstance
            }
            '*' { respond queueInstance, [status: CREATED] }
        }
    }

    def edit(Queue queueInstance) {
        respond queueInstance
    }

    @Transactional
    def update(Queue queueInstance) {
        if (queueInstance == null) {
            notFound()
            return
        }

        if (queueInstance.hasErrors()) {
            respond queueInstance.errors, view:'edit'
            return
        }

        queueInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Queue.label', default: 'Queue'), queueInstance.id])
                redirect queueInstance
            }
            '*'{ respond queueInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Queue queueInstance) {

        if (queueInstance == null) {
            notFound()
            return
        }

        queueInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Queue.label', default: 'Queue'), queueInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'queue.label', default: 'Queue'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
