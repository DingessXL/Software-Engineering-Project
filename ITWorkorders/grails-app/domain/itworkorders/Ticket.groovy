package itworkorders

class Ticket {

    String      firstName
    String      lastName
    String      email
    String      priority
    Integer     queueID
    String      categegory
    String      phoneNumber
    String      mobileNumber
    String      department
    String      roomNumber
    String      building
    String      subject
    String      technician
    Date        dateCreated
    Date        dateClosed
    
    static hasMany = [
        notes:Note,
        histories:History,
        replies:Reply
    ]

    static constraints = {

        email           email:true
        phoneNumber     blank:true, nullable:true
        mobileNumber    blank:true, nullable:true
        department      blank:true, nullable:true
        roomNumber      blank:true, nullable:true
        building        blank:true, nullable:true
        queueID         min:0

    }

    String toString(){
        "$firstName,$lastName"
    }

}
