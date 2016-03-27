package itworkorders

class User {

	String 	   username
	String 	   fname
	String 	   lname

    static constraints = {
    }

    static hasMany = [queue:Queue]
    String toString()
    {
    	"$username,$fname,$lname"
    }
}
