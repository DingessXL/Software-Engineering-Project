package itworkorders

class Ticket {

    String      firstName
    String      lastName
    String      email
    String      phoneNumber
    String      mobileNumber
    String      roomNumber
    String      subject
    String      technician
    Date        dateCreated
    Date        dateClosed
    
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
        workgroup:WorkGroup
    ]
    static constraints = {

        email           email:true
        phoneNumber     blank:true, nullable:true
        mobileNumber    blank:true, nullable:true
        roomNumber      blank:true, nullable:true

    }

    String toString(){
        "$firstName,$lastName,$email,$phoneNumber,$mobileNumber,$roomNumber,$subject,$technician,$dateCreated,$dateClosed"
    }

}
