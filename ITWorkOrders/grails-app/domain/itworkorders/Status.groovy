package itworkorders

class Status {
    String status

    static belongsTo = [ticket:Ticket]

    static constraints = {
        status blank:false
        ticket blank:true, nullable: true

    }
    String toString () {"$status"}
}
