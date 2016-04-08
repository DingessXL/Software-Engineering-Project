package itworkorders

class Workgroup {
    String workgroupName

    static hasMany = [ticket:Ticket, user:User]


    static constraints = {
        workgroupName blank:false
        user blank:true, display:false
        ticket blank:true, nullable:true, display:false
    }

    String toString(){"$workgroupName"}
}
