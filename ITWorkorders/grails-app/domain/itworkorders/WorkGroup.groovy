package itworkorders

class WorkGroup {

	String name

    static constraints = {
    }

    static hasMany = [
    	tickets:Ticket,
    	queues:Queue,
    	users:User
    ]

    String toString()
    {
    	"$name"
    }
}
