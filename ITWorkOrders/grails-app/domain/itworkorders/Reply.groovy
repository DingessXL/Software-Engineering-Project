package itworkorders

/*

Reply Domain Class

Developer: Matt Gaines, Alexander Heavner, Daniel Dingess
Last Update: 5/1/2016

Purpose: This class if for the communication between technicians and
end users.

-Viewable in ascending order (oldest->newest)
-Editable and Deletable for only the user which wrote the reply.

The only way to make a reply is to select "add reply" on the ticket show and
edit view.  This makes sure that the ticket.id is autopopulated for the reply.

Required Data:
    reply
    author(unedtiable, hidden) Should use current logged in user.
    ticket(uneditable, hidden) Should use the ticket that was used to create the reply.

dateCreated and lastUpdated is automatically handled by Grails.
 */

class Reply  {

    String reply
    User author
    Date dateCreated
    Date lastUpdated

    static belongsTo = [ticket: Ticket]
    static constraints = {
        reply blank: false, nullable:false, maxSize: 2500

        //Author is determined by current logged in user in the controller
        author blank:true, nullable:true
        //Ticket is determined automatically by the ticket that selected "Add reply"
        ticket display:true, nullable:false
    }

    String toString() { "$author said: $reply"}
}
