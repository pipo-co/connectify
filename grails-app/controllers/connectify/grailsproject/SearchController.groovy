package connectify.grailsproject

import grails.gorm.DetachedCriteria

class SearchController {

    def index() {

    }

    def searchResult(){

        DetachedCriteria<ActivityTemplate> query = new DetachedCriteria<>(ActivityTemplate.class, "activityTemplate")

        if(params.category){
            query = query.where {
                category {id == params.category}
            }
        }

        if(params.name){
            query = query.where {
                name ==~ params.name
            }
        }

        if(params.connectioner){
            query = query.where {
                conectioner { user { name ==~ params.connectioner } }
            }
        }

        if(params.country){
            query = query.where {
                conectioner { country == params.country }
            }
        }

        if(params.province){
            query = query.where {
                conectioner { province == params.province }
            }
        }

        def result = query.list()

        render(view: "search/index", model: [category: params.category, name: params.name, connectioner: params.connectioner, country: params.country,
         province: params.province])

    }
}
