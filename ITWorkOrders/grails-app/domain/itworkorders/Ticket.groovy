package itworkorders

class Ticket {
    String email

    //Default names to empty for easier logic in view
    String firstName = ""
    String lastName = ""

    String phoneNumber
    String roomNumber
    String priority = "low"
    String subject
    String description

    Date dateCreated
    Date lastUpdated


    //This may have cascading delete 
    static belongsTo = [workgroup:Workgroup, technician:User, workgroup:Workgroup, buildingName:Building, departmentName:Department, ticketStatus:Status]

    static hasMany = [reply:Reply, note:Note, history:String]

    static constraints = {
        /* Required Fields:
            email
            subject
            description
            workgroup - default needs to be Serve
            status - default needs to be Open
         */ //mg

        /*
        First element that is displayed is the link to the ticket, so it must be
        required if you want to be able to select the ticket
         */ //mg

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
        priority inList:["low","medium","high"], nullable:false
        //We need technician to check to see s isTechnician is true in the user table.  Display only technicians from user table.
        technician blank:true, nullable:true

        //workgroup needs to be set to Serve Help Desk by default and hidden from view if the current logged in user is not a technician.
        workgroup blank:false, nullable:false

        //ticketStatus needs to be set to Open by default and hidden from view if the current logged in user is not a technician.
        ticketStatus blank:false;

        //Reply needs to be hidden from view on the create page only.
        reply blank:true, nullable:true

        //Notes should be hidden from view to create or view notes if the user is not a technician.
        note blank:true, nullable:true

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
        return "Ticket ID: ${id}  Subject: ${subject}"
    }
}
