package itworkorders

/*
Note Class:  Technicians use notes to communicate to other technicians
that may be reading the ticket without the regular users being able to view
this communication.  This hides technical jargon from the user.

-Only viewable by Technicians and Admins
-Only viewable on the Edit ticket form.
-Hidden from view on Create ticket form.
-Viewable in ascending order (oldest->newest)


The only way to make a note needs to be a link within the view and edit ticket
views.  You cannot make a note from the note controller alone, since it would not
autopopulate the ticket.id needed.

Required Fields:
    note
    author(uneditable,hidden) Should use current logged in user.
    ticket(uneditable,hidden) Should use ticket which was used to create the note.

dateCreated and lastUpdated is automatically handled by Grails
 */

class Note {

    String note
    Date dateCreated
    Date lastUpdated

    //Current logged in user who created the note using the toString (firstName lastName)
    //Should be hidden from form so the user cannot select anything.
    User author

    static belongsTo = [ticket:Ticket]

    static constraints = {
        note blank:false, nullable: false, maxSize: 2500

        //We need to edit the view to get the current logged in user, and then hide the field
        //right now we are just going to select the user from the list.
        author blank:true, nullable:true //display:false

        //Display ticket, change to hiddenField in view manually.
        ticket display:true,nullable:true
    }

    String toString () {"$author said: $note"}
}
