package itworkorders
class Note {

    Date        date
    String      user
    String      note

    static constraints = {
    
    }

    String toString()
    {
        "$date,$user,$note"
    }
}
