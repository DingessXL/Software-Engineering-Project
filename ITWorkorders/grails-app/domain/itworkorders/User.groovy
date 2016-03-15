package itworkorders

class User {

	String 	username
	String 	fname
	String 	lname
	Number	queueID

    static constraints = {
    }

    String toString()
    {
    	"$username,$fname,$lname,$queueID"
    }
}
