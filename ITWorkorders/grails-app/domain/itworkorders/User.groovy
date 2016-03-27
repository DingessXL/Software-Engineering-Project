package itworkorders

class User {

	String 	   username
	String 	   fname
	String 	   lname
	int	       queueID

    static constraints = {
    }

    String toString()
    {
    	"$username,$fname,$lname,$queueID"
    }
}
