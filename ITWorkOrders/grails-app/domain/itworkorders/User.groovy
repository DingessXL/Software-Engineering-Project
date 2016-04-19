package itworkorders

import itworkorders.auth.*


import sun.security.util.Password

class User extends SecUser{
    //String userName
    //String password
    String firstName
    String lastName
    //String role = 'user'

    static belongsTo = [workgroup: Workgroup, role:SecRole]

    static hasMany = [tickets: Ticket]

    static constraints = {
        //username blank:false,nullable: false, unique:true
        //password nullable:false
        /*
        firstName and lastName does not need to be selectable.  We will use a string split
        to split the email address.
         */
        firstName blank:true, nullalbe:true
        lastName blank:true, nullable:true

        //role     (inList:["user", "technician", "admin"])
        tickets blank:true,nullable: true, display:false
        workgroup blank:true, nullable:true
        role blank:true, nullable:true

    }
    String toString () {"$firstName $lastName"}
}
