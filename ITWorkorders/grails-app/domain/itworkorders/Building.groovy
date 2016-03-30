package itworkorders

class Building {

	Status name

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
