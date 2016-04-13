class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }


        //For now go to default workgroup in future will go to user's default workgroup
        "/"(controller:"/workgroup/index")
        "500"(view:'/error')
	}
}
