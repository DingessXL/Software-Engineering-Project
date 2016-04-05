package itworkorders

class Department {
    String departmentName
    String departmentAddress

    //static belongsTo =[ticket: Ticket]
    static hasMany = [ticket:Ticket]
    static constraints = {
        departmentName blank:false
        departmentAddress blank:true, nullable:true
        ticket  nullable:true
    }
    String toString (){"$departmentName"}
}
