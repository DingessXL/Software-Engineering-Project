package itworkorders.auth


import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString
import itworkorders.Ticket
import itworkorders.Workgroup

@EqualsAndHashCode(includes='username')
@ToString(includes='username', includeNames=true, includePackage=false)
class SecUser implements Serializable {

	private static final long serialVersionUID = 1

	transient springSecurityService

	String username  //This should be an email. -mg
	String password
	//String firstName
	//String lastName

	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	//static belongsTo = [workgroup: Workgroup]

	//static hasMany = [tickets: Ticket]

	SecUser(String username, String password) {
		this()
		this.username = username
		this.password = password
	}

	Set<SecRole> getAuthorities() {
		SecUserSecRole.findAllBySecUser(this)*.secRole
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
		//firstName blank:true
		//lastName blank:true
		//tickets blank:true,nullable: true, display:false
	}

	static mapping = {
		password column: '`password`'
	}
}
