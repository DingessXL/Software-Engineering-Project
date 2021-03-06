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
	String userRole = "Patron"
	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired
	Workgroup workgroup


	//static belongsTo = [workgroup: Workgroup]
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
