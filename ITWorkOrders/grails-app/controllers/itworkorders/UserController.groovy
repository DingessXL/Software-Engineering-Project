/*
User Controller

Developer: Matt Gaines, Alexander Heavner, Daniel Dingess
Last Update: 5/1/2016

Purpose: used to create, edit/update, or delete users by admin only

-Secured: ROLE_ADMIN

*/
package itworkorders
import itworkorders.auth.*
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.security.core.Authentication
import org.springframework.security.core.context.SecurityContextHolder

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
@Secured(['ROLE_ADMIN'])
class UserController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {

        params.max = Math.min(max ?: 10, 100)
        respond User.list(params), model:[userInstanceCount: User.count()]
    }
    @Secured(['ROLE_ADMIN'])
    def show(User userInstance) {
        respond userInstance
    }

    def create() {
        respond new User(params)
    }

    def addTechRole(User userInstance){
        userInstance.userRole = "Tech"

        Role patronRole = Role.findByAuthority('ROLE_USER')
        UserRole.remove userInstance, patronRole //REMOVE PATRON ROLE

        def techRole = Role.findByAuthority('ROLE_TECH')
        UserRole.create userInstance, techRole, true

        userInstance.save flush:true
        redirect(controller: "user", action: "index")

    }

    def addAdminRole(User userInstance){
        userInstance.userRole = "Admin"

        Role techRole = Role.findByAuthority('ROLE_TECH')
        UserRole.remove userInstance, techRole //REMOVE TECH ROLE

        def adminRole = Role.findByAuthority('ROLE_ADMIN')
        UserRole.create userInstance, adminRole, true

        userInstance.save flush:true
        redirect(controller: "user", action: "index")
    }

    @Transactional
    def save(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view:'create'
            return
        }

        userInstance.save flush:true

        userInstance.userRole = "Patron"
        def userRole = Role.findByAuthority('ROLE_USER')
        UserRole.create userInstance, userRole, true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
                redirect userInstance
            }
            '*' { respond userInstance, [status: CREATED] }
        }
    }

    def edit(User userInstance) {
        respond userInstance
    }

    @Transactional
    def update(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view:'edit'
            return
        }

        userInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect userInstance
            }
            '*'{ respond userInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(User userInstance) {

        if (userInstance == null) {
            notFound()
            return
        }
        //Must delete all roles before deleting user.  Suggest disabling user instead of delete.
        Role patronRole = Role.findByAuthority('ROLE_USER')
        try{
            UserRole.remove userInstance, patronRole
        } //REMOVE PATRON ROL
        catch(Exception e){
            println "User does not have user role"
        }
       Role techRole = Role.findByAuthority('ROLE_TECH')
        try{
            UserRole.remove userInstance, techRole
        } //REMOVE TECH ROLE
        catch(Exception e){
            println "User does not have tech role"
        }
        Role adminRole = Role.findByAuthority('ROLE_ADMIN')
        try {
            UserRole.remove userInstance, adminRole
        } //REMOVE TECH ROLE
        catch(Exception e){
            println "User does not have admin role"
        }
        userInstance.delete flush:true


        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
