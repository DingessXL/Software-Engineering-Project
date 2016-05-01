/*
Role Domain Class

Developer: Matt Gaines, Alexander Heavner, Daniel Dingess
Last Update: 5/1/2016

Purpose: Used in springSecurityService for user authentication roles.  Roles are created in the bootstrap.groovy file

- In Bootstrap, we have created "ROLE_ADMIN", "ROLE_TECH", and "ROLE_USER".  New accounts are given the "ROLE_USER" by default.

Required Fields:

*/
package itworkorders

import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString

@EqualsAndHashCode(includes='authority')
@ToString(includes='authority', includeNames=true, includePackage=false)
class Role implements Serializable {

	private static final long serialVersionUID = 1

	String authority

	Role(String authority) {
		this()
		this.authority = authority
	}

	static constraints = {
		authority blank: false, unique: true
	}

	static mapping = {
		cache true
	}
}
