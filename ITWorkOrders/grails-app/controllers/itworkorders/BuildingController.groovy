package itworkorders



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class BuildingController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Building.list(params), model:[buildingInstanceCount: Building.count()]
    }

    def show(Building buildingInstance) {
        respond buildingInstance
    }

    def create() {
        respond new Building(params)
    }

    @Transactional
    def save(Building buildingInstance) {
        if (buildingInstance == null) {
            notFound()
            return
        }

        if (buildingInstance.hasErrors()) {
            respond buildingInstance.errors, view:'create'
            return
        }

        buildingInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'building.label', default: 'Building'), buildingInstance.id])
                redirect buildingInstance
            }
            '*' { respond buildingInstance, [status: CREATED] }
        }
    }

    def edit(Building buildingInstance) {
        respond buildingInstance
    }

    @Transactional
    def update(Building buildingInstance) {
        if (buildingInstance == null) {
            notFound()
            return
        }

        if (buildingInstance.hasErrors()) {
            respond buildingInstance.errors, view:'edit'
            return
        }

        buildingInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Building.label', default: 'Building'), buildingInstance.id])
                redirect buildingInstance
            }
            '*'{ respond buildingInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Building buildingInstance) {

        if (buildingInstance == null) {
            notFound()
            return
        }

        buildingInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Building.label', default: 'Building'), buildingInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'building.label', default: 'Building'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
