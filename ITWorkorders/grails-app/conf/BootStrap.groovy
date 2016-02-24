import com.general.*
import com.auth.*

class BootStrap {

    def init = { servletContext ->
    	/*
        def myAppRole = new SecRole(authority:"ROLE_USER").save(flush:true)

      def will = new SecUser(
              username:"will.smith@gcsu.edu", 
              password:"password",
              enabled:true,
              accountExpired:false,
              accountLocked:false,
              passwordExpired:false
          ).save(flush:true)
        def david = new SecUser(
                username:"david.smith@gcsu.edu", 
                password:"password",
                enabled:true,
                accountExpired:false,
                accountLocked:false,
                passwordExpired:false
            ).save(flush:true)
        def nick = new SecUser(
                username:"nick_morelli@gcsu.edu", 
                password:"password",
                enabled:true,
                accountExpired:false,
                accountLocked:false,
                passwordExpired:false
            ).save(flush:true)
        SecUserSecRole.create will, myAppRole
        SecUserSecRole.create david, myAppRole
        SecUserSecRole.create nick, myAppRole

       */
       
        
    }
    def destroy = {
    }
}
