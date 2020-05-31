package connectify.grailsproject

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller: "index", action: "index")
        "/payment/paymentResult/$status/$months"(controller: "payment", action: "paymentResult")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
