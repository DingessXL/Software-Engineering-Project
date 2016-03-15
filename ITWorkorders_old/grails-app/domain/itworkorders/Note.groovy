package itworkorders

import com.auth.SecUser

class Note {

    Date        date
    SecUser     user
    String      note

    static constraints = {
    
    }

    String toString()
    {
        "$date," + user.username + ",$note"
    }
}
