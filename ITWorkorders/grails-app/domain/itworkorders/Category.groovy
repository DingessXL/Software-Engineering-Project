package itworkorders

class Category {

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
