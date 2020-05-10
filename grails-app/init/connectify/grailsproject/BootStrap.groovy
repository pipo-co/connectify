package connectify.grailsproject

class BootStrap {


    def init = { servletContext ->
        AppInitializationService.initialize()
    }

    def destroy = {
    }
}
