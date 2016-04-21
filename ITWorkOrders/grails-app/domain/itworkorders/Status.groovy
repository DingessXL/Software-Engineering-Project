package itworkorders

class Status {
    String status

    static belongsTo = [ticket:Ticket]

    static constraints = {
        status blank:false
        ticket blank:true, nullable: true, display:false

    }

    //CAUTION: Do not sort status' in static mapping.  Default is referenced by ticketStatus.id


    String toString () {"$status"}
}
