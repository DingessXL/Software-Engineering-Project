package itworkorders

class SetCurrentUserFilters {
    def springSecurityService
    def filters = {
        all(controller: '*', action: '*') {
            before = {
                if (springSecurityService.isLoggedIn()){
                    request.setAttribute("current_user", springSecurityService.currentUser);
                }
            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }
    }
}