package itworkorders

class User {

	String 	   username
	String 	   fname
	String 	   lname

    static constraints = {
    }

    static belongsTo = [
        workgroup:WorkGroup
    ]

    static hasMany = [
        tickets:Ticket
    ]
    String toString()
    {
    	"$username,$fname,$lname"
    }
}
