package drl2

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

//        "/"(view:"/index")
//        "/"(controller: "Machine")
//        "/"(controller: "item_master")
        "/"(controller: 'User', action: 'login')
        "500"(view:'/error')
    }
}