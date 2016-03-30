package com.auth

class GcPerson {
	String email
	String fullName
	String firstName
	String lastName
	String fullNameCapitalized

	GcPerson(String e){
		this.email=e
		setFullName()
		setFirstName()
		setLastName()
		setFullNameCapitalized()

	}
	void setFullName(){
		def name 
		def name2
		name = email.split('@')
    	name2 = name[0]
    	
   		fullName = name2.replaceAll(/\p{Punct}/, ' ')
//    	println noPunct
   		fullName = fullName.replaceAll(/\d/, '')
    	
	}
	void setFirstName(){
		def name 
		def name2
		def name3
		name = this.getFullName()
		name2 = name.split(' ')
		name3 = name2[0]
		firstName=name3.replaceAll(/^./){it.toUpperCase()}
	}

	void setLastName(){
		def name 
		def name2
		def name3
		name = this.getFullName()
		name2 = name.split(' ')
    	name3 = name2[1]
    	lastName=name3.replaceAll(/^./){it.toUpperCase()}
	}
	void setFullNameCapitalized(){
		fullNameCapitalized=firstName+' '+lastName
	}
	String getFirstName(){
		
		return firstName
	}


	String getLastName(){
		
    	return lastName

	}

	static transients = ['firstName', 'lastName', 'fullName']
    static constraints = {
    	email email:true
    }
}