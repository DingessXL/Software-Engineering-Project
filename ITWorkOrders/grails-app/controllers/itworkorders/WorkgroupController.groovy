package itworkorders
import grails.plugin.springsecurity.annotation.Secured


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

//Security for entire class.  Each method is locked down further based on user roles.
@Secured(['ROLE_ADMIN', 'ROLE_TECH', 'ROLE_USER'])

@Transactional(readOnly = true)
class WorkgroupController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    @Secured(['ROLE_ADMIN', 'ROLE_TECH'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Workgroup.list(params), model:[workgroupInstanceCount: Workgroup.count()]
    }
    @Secured(['ROLE_ADMIN', 'ROLE_TECH'])
    def show(Workgroup workgroupInstance) {
        respond workgroupInstance
    }
    @Secured(['ROLE_ADMIN'])
    def create() {
        respond new Workgroup(params)
    }

    @Transactional
    @Secured(['ROLE_ADMIN'])
    def save(Workgroup workgroupInstance) {
        if (workgroupInstance == null) {
            notFound()
            return
        }

        if (workgroupInstance.hasErrors()) {
            respond workgroupInstance.errors, view:'create'
            return
        }

        workgroupInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'workgroup.label', default: 'Workgroup'), workgroupInstance.id])
                redirect workgroupInstance
            }
            '*' { respond workgroupInstance, [status: CREATED] }
        }
    }
    @Secured(['ROLE_ADMIN'])
    def edit(Workgroup workgroupInstance) {
        respond workgroupInstance
    }

    @Transactional
    @Secured(['ROLE_ADMIN'])
    def update(Workgroup workgroupInstance) {
        if (workgroupInstance == null) {
            notFound()
            return
        }

        if (workgroupInstance.hasErrors()) {
            respond workgroupInstance.errors, view:'edit'
            return
        }

        workgroupInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Workgroup.label', default: 'Workgroup'), workgroupInstance.id])
                redirect workgroupInstance
            }
            '*'{ respond workgroupInstance, [status: OK] }
        }
    }

    @Transactional
    @Secured(['ROLE_ADMIN'])
    def delete(Workgroup workgroupInstance) {

        if (workgroupInstance == null) {
            notFound()
            return
        }

        workgroupInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Workgroup.label', default: 'Workgroup'), workgroupInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'workgroup.label', default: 'Workgroup'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
