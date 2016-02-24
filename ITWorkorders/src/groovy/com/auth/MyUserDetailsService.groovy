package com.auth

import grails.plugin.springsecurity.SpringSecurityUtils 
import grails.plugin.springsecurity.userdetails.GrailsUser 
import grails.plugin.springsecurity.userdetails.GrailsUserDetailsService 
import org.springframework.security.core.authority.GrantedAuthorityImpl 
import org.springframework.security.core.userdetails.UserDetails 
import org.springframework.security.core.userdetails.UsernameNotFoundException

import com.auth.GcPerson
//import com.auth.SecUser
//import com.auth.SecRole
//import com.auth.SecUserSecRole
//import com.auth.MyUserDetails 
class MyUserDetailsService { 
//implements GrailsUserDetailsService {

/** * Some Spring Security classes (e.g. RoleHierarchyVoter) expect at least 
	* one role, so we give a user with no granted roles this one which gets 
	* past that restriction but doesn't grant anything. 
*/ 


static final List NO_ROLES = [new GrantedAuthorityImpl("ROLE_USER")]
UserDetails loadUserByUsername(String username, boolean loadRoles) throws UsernameNotFoundException 
{ 
	return loadUserByUsername(username) 
}

UserDetails loadUserByUsername(String uName) throws UsernameNotFoundException 
{


	SecUser.withTransaction { status ->
		
		//SecUser user = SecUser.findByUsername(username) 
		

		////////////////////////////////////////////////////////////////
		////////////////////////////////////////////////////////////////
		////////////////////////////////////////////////////////////////
		////////////////////////////////////////////////////////////////
		////////////////////////////////////////////////////////////////
		// a lot of times the java compiler complains that an exception isn't being thrown 
		// for a class that should throw an exception.
		// Since this "bean" is overriding a class that throws an exeception
		// it has to throw an exception.  I think.  You are welcome to prove otherwise
		// but it probably isn't worth your time.
		// so here we just throw the compiler a bone 
		// it will never execute but the compiler is happy.
		if (false) throw new UsernameNotFoundException( 'User not found', uName)
		////////////////////////////////////////////////////////////////
		////////////////////////////////////////////////////////////////
		////////////////////////////////////////////////////////////////
		////////////////////////////////////////////////////////////////
		////////////////////////////////////////////////////////////////


		////////////////////////////////////////////////////////////////
		////////////////////////////////////////////////////////////////
		//the gcperson class is  able to produce fullname for user
		////////////////////////////////////////////////////////////////
		////////////////////////////////////////////////////////////////
		def gcPerson = new GcPerson(uName)

		
		
		println "looking for user  "+uName
		SecUser localUser = SecUser.findByUsername(uName) 
		if (!localUser){
			// "#######################################"
			// "#######################################"
			println "inside custome MyUserDetails, not a user: "+uName
			// "#######################################"
		////////////////////////////////////////////////////////////////
		////////////////////////////////////////////////////////////////
		//yes there isn't a role for a user that doesn't exist yet
		// so we need to create one with the default role of User
			//def notRole = new SecRole(authority:"ROLE_USER").save(flush:true)
			def basicRole = SecRole.findWhere(authority:"ROLE_USER")
			localUser = new SecUser(
				username:uName, 
				password:"password",
			 	enabled:true,
				accountExpired:false,
				accountLocked:false,
				passwordExpired:false
			).save(flush:true)
			SecUserSecRole.create localUser, basicRole
			} 

		def authorities = localUser.authorities.collect { new GrantedAuthorityImpl(it.authority) }
		////////////////////////////////////////////////////////////////
		////////////////////////////////////////////////////////////////
		//Who the hell thought it was a good idea 
		//to require negated constructors to make things work?
		//"NO_ROLES" is defined at the top as a list
		// bc the constructor has to accept a list
		////////////////////////////////////////////////////////////////
		////////////////////////////////////////////////////////////////
		return new MyUserDetails(localUser.username, localUser.password, localUser.enabled, !localUser.accountExpired, !localUser.passwordExpired, !localUser.accountLocked, authorities ?: NO_ROLES, localUser.id, gcPerson.fullNameCapitalized)


		} 
	} 

}