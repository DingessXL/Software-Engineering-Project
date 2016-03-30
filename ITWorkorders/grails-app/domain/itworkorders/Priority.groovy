package itworkorders

class Priority {
	String name
	Integer level
    static constraints = {
    	level	min:0
    }

    static hasMany = [
    	tickets:Ticket
    ]
    
    String toString()
    {
    	"$name,$level"
    }
}
