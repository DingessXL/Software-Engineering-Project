/*
Workgroup Domain Class

Developer: Matt Gaines, Alexander Heavner, Daniel Dingess
Last Update: 5/1/2016

Purpose: Workgroups are used for each department that is assigned tickets, like Serve Help Desk or Technology Support Services.
Technicians and admins are assigned to workgroups and their default ticket view is their workgroup tickets.

- Admins can create workgroups in the workgroup controller.
- Admins cannot delete workgroups if users are assigned to that workgroup.
- Admins can delete workgroups if ticekts are assigned to that workgroup, and all tickets will be deleted as well.

Required Fields:
- workgroupName is not nullable and must also be unique

*/

package itworkorders


class Workgroup {
    String workgroupName

    //Has many tickets, and has many technciains (which are users).
    static hasMany = [ticket:Ticket, user:User]

    static constraints = {
        workgroupName blank:false, unique: true
        user blank:true, display:false
        ticket blank:true, nullable:true, display:false
    }

    static mapping = {
        ticket sort: 'status', order: 'dsc'
        ticket sort: 'dateCreated', order: 'asc'
   	}

    String toString(){"$workgroupName"}
}
