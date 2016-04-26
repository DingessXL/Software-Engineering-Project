package itworkorders



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TechnicianController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Technician.list(params), model:[technicianInstanceCount: Technician.count()]
    }

    def show(Technician technicianInstance) {
        respond technicianInstance
    }

    def create() {
        respond new Technician(params)
    }

    @Transactional
    def save(Technician technicianInstance) {
        if (technicianInstance == null) {
            notFound()
            return
        }

        if (technicianInstance.hasErrors()) {
            respond technicianInstance.errors, view:'create'
            return
        }

        technicianInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'technician.label', default: 'Technician'), technicianInstance.id])
                redirect technicianInstance
            }
            '*' { respond technicianInstance, [status: CREATED] }
        }
    }

    def edit(Technician technicianInstance) {
        respond technicianInstance
    }

    @Transactional
    def update(Technician technicianInstance) {
        if (technicianInstance == null) {
            notFound()
            return
        }

        if (technicianInstance.hasErrors()) {
            respond technicianInstance.errors, view:'edit'
            return
        }

        technicianInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Technician.label', default: 'Technician'), technicianInstance.id])
                redirect technicianInstance
            }
            '*'{ respond technicianInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Technician technicianInstance) {

        if (technicianInstance == null) {
            notFound()
            return
        }

        technicianInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Technician.label', default: 'Technician'), technicianInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'technician.label', default: 'Technician'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
