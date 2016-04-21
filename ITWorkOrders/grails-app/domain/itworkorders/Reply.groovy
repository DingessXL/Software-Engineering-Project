package itworkorders

/*
Reply Class: This class if for the communication between technicians and
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
    String author
    Date dateCreated
    Date lastUpdated

    static belongsTo = [ticket: Ticket]
    static constraints = {
        reply blank: false, nullable:false, maxSize: 2500

        //We need to edit the view to get the current logged in user, and then hide the field
        //right now we are just going to select the user from the list.
        author blank:true, nullable:true
        ticket display:true, nullable:false
    }

    String toString() { "$author said: $reply"}
}
