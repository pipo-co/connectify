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
        def result = query.list()
        return result

    }
}
