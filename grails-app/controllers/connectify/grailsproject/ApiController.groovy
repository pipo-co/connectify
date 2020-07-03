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
            return
        }

        render Province.findAllByCountry(country).collect({ it.name }) as JSON
    }

    def getConsumerActivities(Long id){
        Consumer consumer = Consumer.get(id)
        render consumer.activities.findAll({ it.isActive()} ).collect({
            [id: it.id,
             name: it.activityTemplate.name,
             date: it.initDate,
             time:it.initTime,
             participants: it.participants,
             duration: it.activityTemplate.duration,
             templateId: it.activityTemplate.id
            ]
        }) as JSON
    }

    def getConsumerActivitiesId(Long id){
        Consumer consumer = Consumer.get(id)
        render consumer.activities.findAll({ it.isActive() }).collect({ it.id }) as JSON
    }

    def getActiveActivityTemplates(){
        render ActivityTemplate.findAll().findAll({ it.hasActiveActivity() }).collect({
            [id: it.id,
             name: it.name,
             description: it.description,
             duration: it.duration,
             address: it.address,
             latitude: it.latitude,
             longitude: it.longitude,
             maxParticipants: it.maxParticipants,
             category: it.category.name
            ]
        }) as JSON
    }

    def getCountryCoordinates(String id){
        Country country = Country.findByName(id)
        def ans = [latitude: country.latitude, longitude: country.longitude]
        render ans as JSON
    }
}
