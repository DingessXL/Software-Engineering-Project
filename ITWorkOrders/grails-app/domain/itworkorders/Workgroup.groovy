package itworkorders


class Workgroup {
    String workgroupName

    static hasMany = [ticket:Ticket, user:User]


    static constraints = {
        workgroupName blank:false, unique: true
        user blank:true, display:false
        ticket blank:true, nullable:true, display:false
    }

    static mapping = {
        ticket sort: 'dateCreated', order: 'asc'
   	}

    String toString(){"$workgroupName"}
}
