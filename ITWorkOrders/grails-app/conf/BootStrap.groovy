import itworkorders.*

class BootStrap {

    def init = { servletContext ->

    	def wg = new Workgroup(workgroupName: "Default")
    	wg.save(flush:true)


    	new User(email: "default@gcsu.edu", firstName: "Default", lastName: "Test", isTechnician: true, isAdmin: true, workgroup: wg).save(flush:true)

    	def s = new Status(status:"Open")
    	s.save(flush:true)
    	new Status(status:"Closed").save(flush:true)
    	new Status(status:"On Hold").save(flush:true)

    	new Department(departmentName:"Computer Science", departmentAddress: "123 CS St.").save(flush:true)

    	new Building(buildingName: "Atkinson", buildingAddress: "123 CS St.").save(flush:true)

    	new Ticket(email:"meow@mewo.com", subject:"Cats", description: "meow", workgroup: wg, ticketStatus: s).save(flush:true)
    	new Ticket(email:"cats@cats.com", subject:"Meow", description: "cats", workgroup: wg, ticketStatus: s).save(flush:true)
    }
    def destroy = {
    }
}
