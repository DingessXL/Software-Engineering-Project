/*
Ticket Domain Class

Developer: Matt Gaines, Alexander Heavner, Daniel Dingess
Last Update: 5/1/2016

Purpose: The ticket object is the most important object in the system.  Tickets are created by Patrons ("ROLE_USER"),
technicians ("ROLE_TECH"), and administrators ("ROLE_ADMIN").  Depending on your role, you will see different forms.
- Patrons do not have the ability to assign/edit workgroup, priority, techncians, or view notes.
- No user has the ability to create replies or notes for a ticket that has not already been created (Edit form only).
- Only admins are allowed to delete tickets (No Referential integrity check).

Required Fields:
- email, must be email
- subject
- description
- workgroup, default is Serve Help Desk
- status, default is Open
*/

package itworkorders


class Ticket {
    String email
    String firstName = "" //Default names to empty for easier logic in view
    String lastName = ""
    String phoneNumber
    String roomNumber
    String priority = "normal" //Priority defaults to "normal"
    String subject
    String description
    String status
    User technician
    Building buildingName
    Department departmentName
    Workgroup workgroup

    //dateCreated and lastUpdated are handled automatically by grails
    Date dateCreated
    Date lastUpdated

    static hasMany = [reply:Reply, note:Note, history:String]

    List history

    static constraints = {
        /*
        Note: It's important to link on the ticket view to the ticket using a required field.  If you
        link to an nullable field, and the field is not populated by a user, then you will not be able
        to link to the ticket.
         */

        email email: true
        firstName blank:true, nullable:true
        lastName blank:true, nullable:true
        phoneNumber blank:true, nullable:true
        departmentName blank:false, nullable:true
        buildingName blank:false, nullable:true
        roomNumber blank:true, nullable:true
        roomNumber blank:true, nullable:true
        subject blank:false
        description blank:false, maxSize:2500
        priority inList:["low","normal","high","critical"], nullable:false
        //Displays only technicians from user table.
        technician blank:true, nullable:true

        //Serve Help Desk by default and hidden from view if the current logged in user is not a technician.
        workgroup blank:false, nullable:false

        //Open by default in the create form, and hidden from view from any normal user
        status blank:false, nullable:false, inList: ["Open", "Closed", "On Hold"]

        //Reply hidden from view on the create page only.
        reply blank:true, nullable:true

        //Notes hidden from view to create or view notes if the user is not a technician.
        note blank:true, nullable:true

        //Autocreated when users open, close, update, reassign, switch workgroup, reply.
        history nullable:true, display:false

    }

    static mapping = {

        /*
        This is so that these items are stored in the database in ascending order according
        to the date created.  This keeps us from having to manually edit the views when using
        the g:each tags.
        */

        reply sort: 'dateCreated', order: 'asc'
        note sort: 'dateCreated', order: 'asc'
        history sort: 'dateCreated', order: 'asc'
    }

    String toString(){
        return "Ticket ID: ${id}  \n  Subject: ${subject}"
    }
}
