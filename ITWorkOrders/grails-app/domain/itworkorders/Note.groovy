package itworkorders

class Note {

    String note

    //Current logged in user who created the note using the toString (firstName lastName)
    //Should be hidden from form so the user cannot select anything.
    String name

    static belongsTo = [ticket:Ticket]

    static constraints = {
        note blank:false, nullable: false, maxSize: 2500
        name blank:true, nullable:true
    }

    String toString () {"$note"}
}
