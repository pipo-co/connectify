package connectify.grailsproject

class IndexController {

    def index(){

        [activityTList: ActivityTemplate.findAll()]
    }
}
