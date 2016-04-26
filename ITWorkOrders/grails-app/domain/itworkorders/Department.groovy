package itworkorders

class Department {
    String departmentName
    String departmentAddress

    //static belongsTo =[ticket: Ticket]
    static hasMany = [ticket:Ticket]
    static constraints = {
        departmentName blank:false, unique:true
        departmentAddress blank:true, nullable:true
        ticket  nullable:true, display:false
    }

    static mapping={
        sort "departmentName"
    }
    String toString (){"$departmentName"}
}
