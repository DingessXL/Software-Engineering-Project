/*
Department Domain Class

Developer: Matt Gaines, Alexander Heavner, Daniel Dingess
Last Update: 5/1/2016

Purpose: Used in tickets for Patrons Department.  Ticket has one department, departments have many tickets.

- Only admins are allowed to add or remove departments
- Departments cannot be deleted once a ticket has been assigned to them.
- Departments cannot be names the same name.
- Viewable in Ascending order.

Required Fields:
- departmentName is required and must be unique.

 */

package itworkorders

class Department {
    String departmentName
    String departmentAddress

    //Belongs to prevents deletion of a ticket that points to this object: Referential Integrity Check
    static belongsTo =[ticket: Ticket]
    static hasMany = [ticket:Ticket]
    static constraints = {
        departmentName blank:false, unique:true
        departmentAddress blank:true, nullable:true
        ticket  nullable:true, display:false
    }

    //Sort in database by departmentName
    static mapping={
        sort "departmentName"
    }
    String toString (){"$departmentName"}
}
