package itworkorders

class Reply {
	Date        date
    String     	user
    String      reply

    static constraints = {
    }

    static belongsTo = [ticket:Ticket]

   	String toString()
   	{
   		"$date,$user,$reply"
   	}

}
