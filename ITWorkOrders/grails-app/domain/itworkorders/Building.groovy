/*
Building Domain Class

Developer: Matt Gaines, Alexander Heavner, Daniel Dingess
Last Update: 5/1/2016

Purpose: Creating buildings that are used in Tickets.  Buildings have many tickets, and tickets have one building.

- Only admins can create buildings.
- Only admins can delete buildings.
- Buildings cannot be deleted if a ticket has been assigned to them. (Referential Integrity Check)
- Buildings cannot be named the same name.
- Viewable in Ascending Order.

Required Fields:
- buildingName is required and must be unique.

 */


package itworkorders

class Building {


    String buildingName
    String buildingAddress

    //Belongs to prevents deletion of a ticket that points to this object: Referential Integrity Check
    static belongsTo = [ticket: Ticket]
    static hasMany = [ticket: Ticket]


    static constraints = {
        //Unique forces each building name to be unique.
        buildingName blank:false, unique: true
        buildingAddress blank:true, nullable: true
        //Ticket nullable but not displayed.  We can later use this to view all tickets for a specific building.
        ticket nullable:true, display:false
    }

    //Sort in database by building name
    static mapping = {
        sort "buildingName"
    }
    String toString(){"$buildingName"}
}
