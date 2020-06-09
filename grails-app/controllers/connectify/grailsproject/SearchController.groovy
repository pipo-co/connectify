package connectify.grailsproject

import grails.gorm.DetachedCriteria

class SearchController {

    def index() {

    }

    def searchResult(){

        Boolean hasSearchParam = 0
        def result = null

        DetachedCriteria<ActivityTemplate> query = new DetachedCriteria<>(ActivityTemplate.class, "activityTemplate")

        if(params.category){
            hasSearchParam = 1
            query = query.where {
                category {id == params.category}
            }
        }

        if(params.name){
            hasSearchParam = 1
            query = query.where {
                name ==~ params.name
            }
        }

        if(params.connectioner){
            hasSearchParam = 1
            query = query.where {
                conectioner { user { name ==~ params.connectioner } }
            }
        }

        if(params.country){
            hasSearchParam = 1
            query = query.where {
                conectioner { country == params.country }
            }
        }

        if(params.province){
            hasSearchParam = 1
            query = query.where {
                conectioner { province == params.province }
            }
        }

        if(hasSearchParam)
            result = query.list()

        render(view: "/search/index", model: [category: params.category,
                                              name: params.name,
                                              connectioner: params.connectioner,
                                              country: params.country,
                                              province: params.province,
                                              result: result])

    }
}
