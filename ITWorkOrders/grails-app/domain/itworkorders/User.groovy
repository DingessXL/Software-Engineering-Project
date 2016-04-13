package itworkorders

import sun.security.util.Password

class User {
    String userName
    String password
    String firstName
    String lastName
    String role = 'user'

    static belongsTo = [workgroup: Workgroup]

    static hasMany = [tickets: Ticket]

    static constraints = {
        userName blank:false,nullable: false, unique:true
        password nullable:false
        /*
        firstName and lastName does not need to be selectable.  We will use a string split
        to split the email address.
         */
        firstName blank:true, nullalbe:true
        lastName blank:true, nullable:true

        role     (inList:["user", "technician", "admin"])
        tickets blank:true,nullable: true, display:false

    }
    String toString () {"$firstName $lastName"}
}
