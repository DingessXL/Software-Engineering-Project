package itworkorders

class Note {
	Date        date
    String     	user
    String      note


    static constraints = {
    }

   	static belongsTo = [ticket:Ticket]


    String toString()
    {
        "$date,$user,$note"
    }
}
