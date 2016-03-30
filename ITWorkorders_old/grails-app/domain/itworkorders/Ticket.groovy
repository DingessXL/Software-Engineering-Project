package itworkorders
import com.auth.GcPerson
class Ticket {

    String firstName
    String lastName
    String email
    Number priority
    Number queueID
    String categegory
    Number phoneNumber
    Number mobileNumber
    String department
    String roomNumber
    String building
    String subject
    String technician  //possible object from src/groovy/com.auth/GcPerson
    //Alex: Maybe SecUser or do we want to make a child class that is GcPerson?

    static constraints = {
        email email:true
    }

    String toString(){
        "$fname,$lname"
    }

}
