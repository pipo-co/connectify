package connectify.grailsproject

class ApiController {


    def prueba(Long id){
        Category category = Category.get(id)
        if(category) {
            List<ActivityTemplate> atList = ActivityTemplate.findAllByCategory(category)
            atList.forEach({ at -> println(at.description) })
        }

        redirect(uri: "/")
    }
}
