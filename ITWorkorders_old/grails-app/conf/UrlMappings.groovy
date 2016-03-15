class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
                "/login/$action?"(controller: "login")
				"/logout/$action?"(controller: "logout")
               
            }
        }
        "/login/$action?"(controller: "login")
		"/logout/$action?"(controller: "logout")
        "/home/$action?"(controller:"home")

        "/"(controller:"home")
        "500"(view:'/error')
        "405"(view:'/error')
        "404"(view:'/error')
	}
}
