import itworkorders.*
import itworkorders.auth.*

class BootStrap {

    def init = { servletContext ->

    	def wg = new Workgroup(workgroupName: "Serve Help Desk")
    	wg.save(flush:true)

		//def adminRole = SecRole.findOrSaveWhere(authority: 'ROLE_ADMIN')
		def adminRole = SecRole.findByAuthority('ROLE_ADMIN') ?: new SecRole(authority: 'ROLE_ADMIN').save(failOnError: true)
		def techRole = SecRole.findByAuthority('ROLE_TECH') ?: new SecRole(authority: 'ROLE_TECH').save(failOnError: true)
		def userRole = SecRole.findByAuthority('ROLE_USER') ?: new SecRole(authority: 'ROLE_USER').save(failOnError: true)


		def adminUser = User.findOrSaveWhere(username: 'admin@gcsu.edu', password:'abcd1234', firstName: "admin", lastName: "account", workgroup:wg,
				accountLocked: false, passwordExpired: false, accountExpired: false, enabled:true)
		def techUser = User.findOrSaveWhere(username: 'tech@gcsu.edu', password:'abcd1234', firstName:"Matt",lastName:"Gaines", workgroup:wg,
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

    	def s = new Status(status:"Open")
    	s.save(flush:true)
    	new Status(status:"Closed").save(flush:true)
    	new Status(status:"On Hold").save(flush:true)

    	new Department(departmentName:"Computer Science", departmentAddress: "123 CS St.").save(flush:true)

    	new Building(buildingName: "Atkinson", buildingAddress: "123 CS St.").save(flush:true)

    	new Ticket(email:"user@gcsu.edu", subject:"Computer Issue", description: "Computer will not boot", workgroup: wg, ticketStatus: s).save(flush:true)
    	new Ticket(email:"user@gcsu.edu", subject:"Network Issue", description: "Can not get to network drive.", workgroup: wg, ticketStatus: s).save(flush:true)
		new Ticket(email:"user@gcsu.edu", subject:"Display Issue", description: "Display will not turn on", workgroup: wg, ticketStatus: s).save(flush:true)
		new Ticket(email:"user@gcsu.edu", subject:"Printer Issue", description: "Printer will not print", workgroup: wg, ticketStatus: s).save(flush:true)




		new Workgroup(workgroupName: "Technology Support Services").save(flush:true)
		new Workgroup(workgroupName: "System Administration").save(flush:true)
		new Workgroup(workgroupName: "Enterprise Applications").save(flush:true)
		new Workgroup(workgroupName: "Network Services").save(flush:true)




	}
    def destroy = {
    }
}
