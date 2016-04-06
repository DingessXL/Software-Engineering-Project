package itworkorders

class Ticket {
    String email

    //Default names to empty for easier logic in view
    String firstName = ""
    String lastName = ""

    
    String phoneNumber
    String roomNumber
    final Date creationDate = new Date()  //must not be changed after creation
    //Status ticketStatus
    String subject
    String description

    //we need to find some way of limiting the list of users to only technicians for this field
    //User technician
    //Department departmentName
    //Building buildingName
    //Workgroup workgroup


    //This may have cascading delete 
    static belongsTo = [workgroup:Workgroup, technician:User, workgroup:Workgroup, buildingName:Building, departmentName:Department, ticketStatus:Status]

    static hasMany = [reply:Reply, note:Note]

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
        technician blank:true, nullable:true
        workgroup blank:false, nullable:false
        ticketStatus blank:false;
        reply blank:true, nullable:true
        note blank:true, nullable:true
    }

    String toString(){
        return "${firstName} ${lastName} ${subject} ${technician} ${ticketStatus}"
    }
}
