package itworkorders

class History {
	String 	user
	String 	description
	Date	date

    static constraints = {
    }

    static belongsTo = [ticket:Ticket]

    String toString()
    {
    	"$user,$date,$description"
    }
}
