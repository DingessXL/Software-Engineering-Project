import itworkorders.*
import itworkorders.auth.*

class BootStrap {

    def init = { servletContext ->

		//Creating Serve Help Desk Workgroup
    	def wg = Workgroup.findByWorkgroupName("Serve Help Desk") ?: new Workgroup(workgroupName: "Serve Help Desk").save(flush:true)

		//Creating admin, tech, and user roles
		def adminRole = SecRole.findByAuthority('ROLE_ADMIN') ?: new SecRole(authority: 'ROLE_ADMIN').save(failOnError: true)
		def techRole = SecRole.findByAuthority('ROLE_TECH') ?: new SecRole(authority: 'ROLE_TECH').save(failOnError: true)
		def userRole = SecRole.findByAuthority('ROLE_USER') ?: new SecRole(authority: 'ROLE_USER').save(failOnError: true)

		//Unassigned added first so it is the first in the list to assign.  Unassigned is a disabled account: no login allowed.
		def unassignedTech = User.findOrSaveWhere(username: 'unassigned@gcsu.edu', password:'abcd1234', firstName:"Unassigned",lastName:"", workgroup:wg,
				accountLocked:false, passwordExpired:false, accountExpired:false, enabled: false)
		def adminUser = User.findOrSaveWhere(username: 'admin@gcsu.edu', password:'abcd1234', firstName: "Admin", lastName: "Account", workgroup:wg,
				accountLocked: false, passwordExpired: false, accountExpired: false, enabled:true)
		def techUser = User.findOrSaveWhere(username: 'tech@gcsu.edu', password:'abcd1234', firstName:"Tech",lastName:"Account", workgroup:wg,
				accountLocked:false, passwordExpired:false, accountExpired:false, enabled: true)
		def user1 = User.findOrSaveWhere(username:'user@gcsu.edu', password:'abcd1234', firstName:"User", lastName:"Account",
				accountLocked:false, passwordExpired: false, accountExpired: false, enabled: true)
		def user2 = User.findOrSaveWhere(username:'rachel.noles@gcsu.edu', password:'abcd1234', firstName:"Rachel", lastName:"Noles",
				accountLocked:false, passwordExpired: false, accountExpired: false, enabled: true)

		//Adding unassigned to techRole
		if(!unassignedTech.authorities.contains(techRole)){
			SecUserSecRole.create(unassignedTech,techRole,true)
		}
		//Creating an admin account for the user above.
		if(!adminUser.authorities.contains(adminRole)){
			SecUserSecRole.create(adminUser,adminRole, true)
		}
		//Creating tech account for the user above.
		if(!techUser.authorities.contains(techRole)){
			SecUserSecRole.create(techUser,techRole,true)
		}
		//Creating normal user account for user above.
		if(!user1.authorities.contains(userRole)){
			SecUserSecRole.create(user1,userRole, true)
		}

		//Createing normal user account for Rachel Noles
		if(!user2.authorities.contains(userRole)){
			SecUserSecRole.create(user2,userRole, true)
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
