// locations to search for config files that get merged into the main config;
// config files can be ConfigSlurper scripts, Java properties files, or classes
// in the classpath in ConfigSlurper format

grails.config.locations = []

 if (System.properties["j2j.config.location"]) {
   
    println "found J2J Configuration"
    grails.config.locations << "file:" + System.properties["j2j.config.location"]
    
    }
 if(System.properties["current.cas.config.location"]){
    
    println "found CAS Configuration"
    grails.config.locations << "file:"+System.properties["current.cas.config.location"]
 }
 if(System.properties["config.application.url"]){
    grails.config.locations << "file:"+System.properties["config.application.url"]
 }
import grails.plugin.springsecurity.SecurityConfigType
grails.project.groupId = appName // change this to alter the default package name and Maven publishing destination

// The ACCEPT header will not be used for content negotiation for user agents containing the following strings (defaults to the 4 major rendering engines)
grails.mime.disable.accept.header.userAgents = ['Gecko', 'WebKit', 'Presto', 'Trident']
grails.mime.types = [ // the first one is the default format
    all:           '*/*', // 'all' maps to '*' or the first available format in withFormat
    atom:          'application/atom+xml',
    css:           'text/css',
    csv:           'text/csv',
    form:          'application/x-www-form-urlencoded',
    html:          ['text/html','application/xhtml+xml'],
    js:            'text/javascript',
    json:          ['application/json', 'text/json'],
    multipartForm: 'multipart/form-data',
    rss:           'application/rss+xml',
    text:          'text/plain',
    hal:           ['application/hal+json','application/hal+xml'],
    xml:           ['text/xml', 'application/xml']
]

// URL Mapping Cache Max Size, defaults to 5000
//grails.urlmapping.cache.maxsize = 1000

// Legacy setting for codec used to encode data with ${}
grails.views.default.codec = "html"

// The default scope for controllers. May be prototype, session or singleton.
// If unspecified, controllers are prototype scoped.
grails.controllers.defaultScope = 'singleton'

// GSP settings
grails {
    views {
        gsp {
            encoding = 'UTF-8'
            htmlcodec = 'xml' // use xml escaping instead of HTML4 escaping
            codecs {
                expression = 'html' // escapes values inside ${}
                scriptlet = 'html' // escapes output from scriptlets in GSPs
                taglib = 'none' // escapes output from taglibs
                staticparts = 'none' // escapes output from static template parts
            }
        }
        // escapes all not-encoded output at final stage of outputting
        // filteringCodecForContentType.'text/html' = 'html'
    }
}


grails.converters.encoding = "UTF-8"
// scaffolding templates configuration
grails.scaffolding.templates.domainSuffix = 'Instance'

// Set to false to use the new Grails 1.2 JSONBuilder in the render method
grails.json.legacy.builder = false
// enabled native2ascii conversion of i18n properties files
grails.enable.native2ascii = true
// packages to include in Spring bean scanning
grails.spring.bean.packages = []
// whether to disable processing of multi part requests
grails.web.disable.multipart=false

// request parameters to mask when logging exceptions
grails.exceptionresolver.params.exclude = ['password']

// configure auto-caching of queries by default (if false you can cache individual queries with 'cache: true')
grails.hibernate.cache.queries = false

// configure passing transaction's read-only attribute to Hibernate session, queries and criterias
// set "singleSession = false" OSIV mode in hibernate configuration after enabling
grails.hibernate.pass.readonly = false
// configure passing read-only to OSIV session by default, requires "singleSession = false" OSIV mode
grails.hibernate.osiv.readonly = false

environments {
    development {
        grails.logging.jul.usebridge = true
    }
    production {
        grails.logging.jul.usebridge = false
        grails.plugin.springsecurity.secureChannel.useHeaderCheckChannelSecurity = true
        grails.plugin.springsecurity.secureChannel.secureHeaderName = 'X-FORWARDED-PROTO'
        grails.plugin.springsecurity.secureChannel.secureHeaderValue = 'http'
        grails.plugin.springsecurity.secureChannel.insecureHeaderName = 'X-FORWARDED-PROTO'
        grails.plugin.springsecurity.secureChannel.insecureHeaderValue = 'https'
        //grails.plugin.springsecurity.portMapper.httpPort =  4653
        //grails.plugin.springsecurity.portMapper.httpsPort = 4854
//
        grails.plugin.springsecurity.secureChannel.definition = [
                                    
                                    '/some-url/index':          'REQUIRES_SECURE_CHANNEL',
                                    '/some-url/create':         'REQUIRES_SECURE_CHANNEL',
                                    '/some-url/save':           'REQUIRES_SECURE_CHANNEL',
                                    '/some-url/show':           'REQUIRES_SECURE_CHANNEL',
                                    '/assets/**':                     'ANY_CHANNEL' ,                 
                                    '/**/js/**':                      'ANY_CHANNEL' ,           
                                    '/**/css/**':                     'ANY_CHANNEL',            
                                    '/**/images/**':                  'ANY_CHANNEL',             
                                    '/**/favicon.ico':                'ANY_CHANNEL'
                                    ]
        grails.plugin.springsecurity.auth.forceHttps = true                                 
        // TODO: grails.serverURL = "http://www.changeme.com"
    }
}

// log4j configuration
log4j.main = {
    // Example of changing the log pattern for the default console appender:
    //
    //appenders {
    //    console name:'stdout', layout:pattern(conversionPattern: '%c{2} %m%n')
    //}

   warn     'org.codehaus.groovy.grails.web.servlet',        // controllers  
            'org.codehaus.groovy.grails.web.mapping.filter', // URL mapping
            'org.codehaus.groovy.grails.web.mapping',       // URL mapping
            'org.codehaus.groovy.grails.web.pages',          // GSP
            'org.codehaus.groovy.grails.web.sitemesh',      // layouts
            'org.codehaus.groovy.grails.commons',            // core / classloading
            'org.codehaus.groovy.grails.plugins',            // plugins
            'org.codehaus.groovy.grails.orm.hibernate',      // hibernate integration
            'org.springframework',
            'org.hibernate',
            'net.sf.ehcache.hibernate',
            'grails.plugin.springsecurity',
            'org.codehaus.groovy.grails.plugin.springsecurity',
            'org.springframework.security',
            'org.jasig.cas.client'
          
}
        grails.plugin.springsecurity.cas.active = true
        grails.plugin.springsecurity.cas.sendRenew = false

        grails.plugin.springsecurity.cas.serverUrlEncoding = 'UTF-8'
        grails.plugin.springsecurity.cas.key = 'grails-spring-security-cas'
        grails.plugin.springsecurity.cas.artifactParameter = 'ticket'
        grails.plugin.springsecurity.cas.serviceParameter = 'service'
        grails.plugin.springsecurity.cas.filterProcessesUrl = '/j_spring_cas_security_check'


        grails.plugin.springsecurity.cas.useSingleSignout = true



        grails.plugin.springsecurity.cas.loginUri = '/login'
grails.plugin.springsecurity.cas.serviceUrl = 'http://localhost:8080/'+grails.project.groupId+'/j_spring_cas_security_check'
grails.plugin.springsecurity.cas.serverUrlPrefix = 'https://unify.gcsu.edu/cas'
grails.plugin.springsecurity.cas.proxyCallbackUrl = 'http://localhost:8080/'+grails.project.groupId+'/secure/receptor'
grails.plugin.springsecurity.cas.proxyReceptorUrl = '/secure/receptor'
grails.plugin.springsecurity.logout.afterLogoutUrl = 'https://unify.gcsu.edu/cas/logout?url=http://localhost:8080/'+grails.project.groupId+'/'

        
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        

        //Begin PRODUCTION  CAS configuration


        
    //    grails.plugin.springsecurity.cas.loginUri = '/login'
    //    grails.plugin.springsecurity.cas.serviceUrl = 'https://vband.gcsu.edu:4854/gcForms/j_spring_cas_security_check'
    //    grails.plugin.springsecurity.cas.serverUrlPrefix = 'https://unify.gcsu.edu/cas'
    //    grails.plugin.springsecurity.cas.proxyCallbackUrl = 'https://vband.gcsu.edu:4854/gcForms/secure/receptor'
    //    grails.plugin.springsecurity.cas.proxyReceptorUrl = '/secure/receptor'
     //   grails.plugin.springsecurity.logout.afterLogoutUrl = 'https://unify.gcsu.edu/cas/logout?url=https://vband.gcsu.edu:4854/gcForms/'


        //End PRODUCTION Configuration for CAS


////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////




        grails.plugin.springsecurity.userLookup.userDomainClassName = 'com.auth.SecUser'
        grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'com.auth.SecUserSecRole'
        grails.plugin.springsecurity.authority.className = 'com.auth.SecRole'


        grails.plugin.springsecurity.securityConfigType = "InterceptUrlMap"//SecurityConfigType.InterceptUrlMap  // remember to import this object
        grails.plugin.springsecurity.rejectIfNoRule = true
        grails.plugin.springsecurity.fii.rejectPublicInvocations = false
        //grails.plugin.springsecurity.controllerAnnotations.staticRules needs to be changed to the rule below
        

        
        grails.plugin.springsecurity.interceptUrlMap = [
	
                    '/':                            ['permitAll'],
                    '/home/':                       ['permitAll'],
                    '/home':                        ['permitAll'],
                    '/home/index':                  ['permitAll'],
                    '/some-url':                    ['ROLE_USER'],
                    '/some-url/':                   ['ROLE_USER'],
                    '/propertyOffCampus':           ['ROLE_USER'],
                    '/propertyOffCampus/':          ['ROLE_USER'],
                    '/some-url/index':              ['ROLE_USER'],  //, 'isFullyAuthenticated()']
                    '/some-url/create':             ['ROLE_USER'],
                    '/some-url/save':               ['ROLE_USER'],
                    '/some-url/show':               ['ROLE_USER'],
                    '/some-url/edit':               ['ROLE_USER'],
                    '/some-url/update':             ['ROLE_USER'],
                    '/some-url/delete':             ['ROLE_USER'],
                    '/some-url/workflowError':      ['ROLE_USER'],
                    '/communicationError/workflowError':['ROLE_USER'],
                    '/communicationError/youCantSeeThis':['ROLE_USER'],
                    '/some-url/j2jError/**':        ['ROLE_USER'],
                                        
                    '/index':                        ['permitAll'],
                    '/index.gsp':                    ['permitAll'],
                    '/assets/**':                    ['permitAll'],
                    '/**/js/**':                     ['permitAll'],
                    '/**/css/**':                    ['permitAll'],
                    '/**/images/**':                 ['permitAll'],
                    '/**/favicon.ico':               ['permitAll'],
                    '/login/**':                     ['permitAll'],
                    '/logout/**':                    ['permitAll'],
                    '/secure/**':                    ['ROLE_USER']
]

