package itworkorders

class Workgroup {
    String workgroupName

    static hasMany = [ticket:Ticket, user:User]


    static constraints = {
        workgroupName blank:false
        user blank:true
        ticket blank:true
    }

    String toString(){"$workgroupName"}
}
