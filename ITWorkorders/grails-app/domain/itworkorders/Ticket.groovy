package itworkorders

class Ticket {

    String      firstName
    String      lastName
    String      email
    String      phoneNumber
    String      mobileNumber
    String      roomNumber
    String      subject
    String      description
    String      technician
    Date        dateCreated
    Date        dateClosed

    def getFullName(){
        return "$firstName $lastName"
    }
    
    static hasMany = [
        notes:Note,
        histories:History,
        replies:Reply
    ]

    static belongsTo = [
        priority:Priority,
        department:Department,
        building:Building,
        status:Status,
        category:Category,
        workgroup:WorkGroup,
        technician:User
    ]
    static constraints = {
        firstName       blank:true, nullable:true
        lastName        blank:true, nullable:true
        email           email:true
        phoneNumber     blank:true, nullable:true
        mobileNumber    blank:true, nullable:true
        building        blank:true, nullable:true
        roomNumber      blank:true, nullable:true
        category        blank:true, nullable:true
        priority        blank:true, nullable:true, display:false
        subject         blank:false
        description     blank:false
        technician      display:false
    }

    String toString(){
        "$firstName,$lastName,$email,$phoneNumber,$mobileNumber,$roomNumber,$subject,$dateCreated,$dateClosed"
    }

}
