package itworkorders

class Queue {

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
    	
    }
}
