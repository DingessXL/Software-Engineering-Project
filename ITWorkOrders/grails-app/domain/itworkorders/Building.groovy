package itworkorders

class Building {
    String buildingName
    String buildingAddress

    static belongsTo = [ticket: Ticket]
    static hasMany = [ticket: Ticket]
    static constraints = {
        buildingName blank:false
        buildingAddress blank:true, nullable: true
        ticket nullable:true
    }
    String toString(){"$buildingName"}
}
