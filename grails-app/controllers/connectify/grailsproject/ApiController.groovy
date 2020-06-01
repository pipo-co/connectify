package connectify.grailsproject

import grails.converters.JSON

import java.util.stream.Collectors

class ApiController {


    def prueba(Long id){
        Category category = Category.get(id)
        if(category) {
            List<ActivityTemplate> atList = ActivityTemplate.findAllByCategory(category)
            atList.forEach({ at -> println(at.description) })
        }

        redirect(uri: "/")
    }

    def getCategories(){
        List<Category> categories = Category.list().stream()
                .map({ category -> [value: category.id, text: category.name] })
                .collect(Collectors.toList())

        render categories as JSON
    }

    def getCountries(){
        render CountriesInfo.supportedCountries as JSON
    }

    def getProvinces(String id){
        println(id)
        render CountriesInfo.getProvinces(id) as JSON
    }
}
