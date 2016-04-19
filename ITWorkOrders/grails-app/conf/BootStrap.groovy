import itworkorders.*
import itworkorders.auth.*

class BootStrap {

    def init = { servletContext ->

    	def wg = new Workgroup(workgroupName: "Default")
    	wg.save(flush:true)

		//def adminRole = SecRole.findOrSaveWhere(authority: 'ROLE_ADMIN')
		def adminRole = SecRole.findByAuthority('ROLE_ADMIN') ?: new SecRole(authority: 'ROLE_ADMIN').save(failOnError: true)
		def techRole = SecRole.findByAuthority('ROLE_TECH') ?: new SecRole(authority: 'ROLE_TECH').save(failOnError: true)
		def userRole = SecRole.findByAuthority('ROLE_USER') ?: new SecRole(authority: 'ROLE_USER').save(failOnError: true)


		def adminUser = User.findOrSaveWhere(username: 'admin@gcsu.edu', password:'abcd1234', firstName: "admin", lastName: "account", workgroup:wg,
				accountLocked: false, passwordExpired: false, accountExpired: false, enabled:true)
		def techUser = User.findOrSaveWhere(username: 'matt.gaines@gcsu.edu', password:'abcd1234', firstName:"Matt",lastName:"Gaines", workgroup:wg,
				accountLocked:false, passwordExpired:false, accountExpired:false, enabled: true)
		def user = User.findOrSaveWhere(username:'user@gcsu.edu', password:'abcd1234', firstName:"Regular", lastName:"User", workgroup:wg,
				accountLocked:false, passwordExpired: false, accountExpired: false, enabled: true)



		//Creating an admin account for the user above.
		if(!adminUser.authorities.contains(adminRole)){
			SecUserSecRole.create(adminUser,adminRole, true)
		}
		//Creating tech account for the user above.
		if(!techUser.authorities.contains(techRole)){
			SecUserSecRole.create(techUser,techRole,true)
		}
		//Creating normal user account for user above.
		if(!user.authorities.contains(userRole)){
			SecUserSecRole.create(user,userRole, true)
		}


    	/*new User(userName: "admin@gcsu.edu",password:"abcd1234",firstName:"Admin",lastName:"Test", role:"admin", workgroup: wg).save(flush:true)
		new User(userName: "tech@gcsu.edu", password:"abcd1234",firstName:"Tech",lastName:"Test", role:"technician", workgroup: wg).save(flush:true)
		new User(userName: "user@gcsu.edu", password:"abcd1234",firstName:"User",lastName:"Test", role:"user", workgroup:wg).save(flush:true)
		new User(userName: "alexander.heavner@bobcats.gcsu.edu",password:"abcd1234",firstName:"Alex",lastName:"Test", role:"admin", workgroup: wg).save(flush:true)
*/
    	def s = new Status(status:"Open")
    	s.save(flush:true)
    	new Status(status:"Closed").save(flush:true)
    	new Status(status:"On Hold").save(flush:true)

    	new Department(departmentName:"Computer Science", departmentAddress: "123 CS St.").save(flush:true)

    	new Building(buildingName: "Atkinson", buildingAddress: "123 CS St.").save(flush:true)

    	new Ticket(email:"meow@mewo.com", subject:"Cats", description: "meow", workgroup: wg, ticketStatus: s).save(flush:true)
    	new Ticket(email:"cats@cats.com", subject:"Meow", description: "cats", workgroup: wg, ticketStatus: s).save(flush:true)

        new Workgroup(workgroupName: "Test").save(flush:true)

    }
    def destroy = {
    }
}
