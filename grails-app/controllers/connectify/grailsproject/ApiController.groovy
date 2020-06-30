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
        render Country.list().collect({ it.name }) as JSON
    }

    def getProvinces(String id){
        Country country = Country.findByName(id)

        if(!country){
            println("El nombre del pais no es valido")
            render null as JSON
            return;
        }

        render Province.findAllByCountry(country).collect({ it.name }) as JSON
    }

    def getConsumerActivities(Long id){
        Consumer consumer = Consumer.get(id)
        render consumer.activities.collect({ it.id }) as JSON
    }
}
