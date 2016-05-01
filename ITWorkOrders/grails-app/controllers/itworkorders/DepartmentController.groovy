/*
Department Controller

Developer: Matt Gaines, Alexander Heavner, Daniel Dingess
Last Update: 5/1/2016

Purpose: Used to create, edit/update, and delete departments.  Handles the data between the department views, ticket forms,
and the database.

- Secured: Only available for ROLE_ADMIN

*/

package itworkorders

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
@Secured(['ROLE_ADMIN'])
class DepartmentController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Department.list(params), model:[departmentInstanceCount: Department.count()]
    }

    def show(Department departmentInstance) {
        respond departmentInstance
    }

    def create() {
        respond new Department(params)
    }

    @Transactional
    def save(Department departmentInstance) {
        if (departmentInstance == null) {
            notFound()
            return
        }

        if (departmentInstance.hasErrors()) {
            respond departmentInstance.errors, view:'create'
            return
        }

        departmentInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'department.label', default: 'Department'), departmentInstance.id])
                redirect departmentInstance
            }
            '*' { respond departmentInstance, [status: CREATED] }
        }
    }

    def edit(Department departmentInstance) {
        respond departmentInstance
    }

    @Transactional
    def update(Department departmentInstance) {
        if (departmentInstance == null) {
            notFound()
            return
        }

        if (departmentInstance.hasErrors()) {
            respond departmentInstance.errors, view:'edit'
            return
        }

        departmentInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Department.label', default: 'Department'), departmentInstance.id])
                redirect departmentInstance
            }
            '*'{ respond departmentInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Department departmentInstance) {

        if (departmentInstance == null) {
            notFound()
            return
        }

        departmentInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Department.label', default: 'Department'), departmentInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'department.label', default: 'Department'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
