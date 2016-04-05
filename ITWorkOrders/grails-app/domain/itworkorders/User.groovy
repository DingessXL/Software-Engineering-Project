package itworkorders

class User {
    String email
    String firstName
    String lastName
    Boolean isTechnician //default should be no
    //Boolean isManager  //created for feature add later
    Boolean isAdmin     //default should be no

    static belongsTo = [workgroup: Workgroup]

    static hasMany = [tickets: Ticket]

    static constraints = {
        email blank:false,nullable: false
        /*
        firstName and lastName does not need to be selectable.  We will use a string split
        to split the email address.
         */
        firstName blank:true, nullalbe:true
        lastName blank:true, nullable:true

        /*
        isTechnician and isAdmin only needs to be selectable if current logged in user is admin
        or we may just want to limit the user controller to admin, since technicians should not
        need to edit/create users
        */
        isTechnician blank:true,nullable:true
        isAdmin blank:true,nullable: true
        tickets blank:true,nullable: true

    }
    String toString () {"$firstName $lastName"}
}
