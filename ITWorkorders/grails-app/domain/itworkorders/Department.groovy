package itworkorders

class Department {
	
	String name

    static constraints = {
    }

    static hasMany = [
    	tickets:Ticket
    ]
    
    String toString()
    {
    	"$name"
    }
}