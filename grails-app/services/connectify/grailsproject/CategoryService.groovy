package connectify.grailsproject

import grails.gorm.transactions.Transactional

@Transactional
class CategoryService {

    private Map<String, Category> categoryMap = new HashMap<>()

    def initCategory(String name) {
        Category category = new Category()
        category.name = name
        category.save(flash: true)
        categoryMap.put(name, category)
    }

    def getByName(String name){
        return categoryMap.get(name)
    }
}
