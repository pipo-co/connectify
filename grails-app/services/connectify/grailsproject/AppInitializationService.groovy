package connectify.grailsproject

import grails.gorm.transactions.Transactional

@Transactional
class AppInitializationService {

    static initialize(){
        initCategory("Fitness")
        initCategory("Cooking")
    }

    private static initCategory(String name){
        Category category = new Category()
        category.name = name
        category.save(flash: true)
    }
}
