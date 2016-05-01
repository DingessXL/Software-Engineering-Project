/*
User Domain Class

Developer: Matt Gaines, Alexander Heavner, Daniel Dingess
Last Update: 5/1/2016

Purpose: Used in springSecurityService for user authentication.  Users are created in the bootstrap.groovy file,
and also by Admins when the application is running in the Users controller.


Required Fields:
- username (important to use username and not userName, springSecurity expects username)
- password

*/

package itworkorders

import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString

@EqualsAndHashCode(includes='username')
@ToString(includes='username', includeNames=true, includePackage=false)
class User implements Serializable {

	private static final long serialVersionUID = 1

	transient springSecurityService

	String username
	String password
	String firstName
	String lastName
	String userRole = "Patron"  //Default user role is Patron
	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired
	Workgroup workgroup

	//Referential Integrity Check: Does not allow the deletion of Workgroups if users are assigned to them.
	static belongsTo = [workgroup: Workgroup]
	static hasMany = [tickets: Ticket]

	User(String username, String password) {
		this()
		this.username = username
		this.password = password
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this)*.role
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
	}

	static transients = ['springSecurityService']

	static constraints = {
		username blank: false, unique: true
		password blank: false
		firstName blank:true, nullalbe:true
		lastName blank:true, nullable:true
		userRole inList:["Admin", "Tech", "Patron"], nullable:true
		tickets blank:true,nullable: true, display:false
		workgroup blank:true, nullable:true
	}

	static mapping = {
		password column: '`password`'
	}

	//Return first name and last name as string for users
	String toString() {
		return "$firstName $lastName"
	}
}
