package itworkorders



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class HistoryController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond History.list(params), model:[historyInstanceCount: History.count()]
    }

    def show(History historyInstance) {
        respond historyInstance
    }

    def create() {
        respond new History(params)
    }

    @Transactional
    def save(History historyInstance) {
        if (historyInstance == null) {
            notFound()
            return
        }

        if (historyInstance.hasErrors()) {
            respond historyInstance.errors, view:'create'
            return
        }

        historyInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'history.label', default: 'History'), historyInstance.id])
                redirect historyInstance
            }
            '*' { respond historyInstance, [status: CREATED] }
        }
    }

    def edit(History historyInstance) {
        respond historyInstance
    }

    @Transactional
    def update(History historyInstance) {
        if (historyInstance == null) {
            notFound()
            return
        }

        if (historyInstance.hasErrors()) {
            respond historyInstance.errors, view:'edit'
            return
        }

        historyInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'History.label', default: 'History'), historyInstance.id])
                redirect historyInstance
            }
            '*'{ respond historyInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(History historyInstance) {

        if (historyInstance == null) {
            notFound()
            return
        }

        historyInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'History.label', default: 'History'), historyInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'history.label', default: 'History'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
