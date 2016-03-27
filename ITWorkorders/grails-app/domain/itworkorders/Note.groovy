package itworkorders

class Note {
	Date        date
    String     	user
    String      note

    static belongsTo = [ticket:Ticket]

    static constraints = {
    }

    String toString()
    {
        "$date,$user,$note"
    }
}
