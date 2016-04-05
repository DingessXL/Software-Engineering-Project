package itworkorders

class Reply  {

    String reply

    static belongsTo = [ticket: Ticket]
    static constraints = {
        reply blank: false, nullable:false, maxSize: 2500
    }

    String toString() { "$reply"}
}
