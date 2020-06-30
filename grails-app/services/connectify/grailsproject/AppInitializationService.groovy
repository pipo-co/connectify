package connectify.grailsproject

import grails.gorm.transactions.Transactional

@Transactional
class AppInitializationService {

    def initialize(){
        initCategories();

        initCountries()

        //createTestingConectioner()
        //createTestingConsumer()
    }

    private static initCategories(){
        initCategory("Fitness")
        initCategory("Cooking")
        initCategory("Artistic")
        initCategory("Science")
        initCategory("Crafts")
        initCategory("Tech")
    }

    private static initCountries(){
        initCountry("Argentina", CountriesInfo.argentinaProvinces)

        initCountry("Chile", CountriesInfo.chileProvinces)

        initCountry("Uruguay", CountriesInfo.uruguayProvinces)
    }

    private static initCategory(String name) {
        if(Category.findByName(name) != null)
            return

        Category category = new Category(name: name)
        category.save()
    }

    private static initCountry(String name, String[] provinces){
        if(Country.findByName(name) != null)
            return

        Country country = new Country(name: name)

        for(String province: provinces)
            country.addToProvinces(new Province(name: province))

        country.save()
    }

    private static createTestingConectioner(){
        Conectioner conectioner = new Conectioner()
        conectioner.user = new Users()

        conectioner.user.username = "tobias"
        conectioner.user.password = "tobias"
        conectioner.user.name = "tobias"
        conectioner.user.email = "t@t.com"
        conectioner.user.avatar = "defaultAvatar.png"
        conectioner.user.userType = GlobalConfig.USER_TYPE.CONNECTIONER
        conectioner.user.confirmCode = null
        conectioner.user.isActive = true

        conectioner.cbu = "6666666666666666666666"
        conectioner.country = "Argentina"
        conectioner.province = "Vicente Lopez"
        conectioner.district = "gduhg"
        conectioner.street = "dufghfd"
        conectioner.houseNumber = "777"
        conectioner.cp = "555"
        conectioner.phoneNumber = "66666666"
        conectioner.phoneType = "cell"

        conectioner.save()
    }

    static private createTestingConsumer(){
        Consumer consumer = new Consumer()
        consumer.user = new Users()

        consumer.user.username = "tobiasConsumer"
        consumer.user.password = "tobias"
        consumer.user.name = "tobiasConsumer"
        consumer.user.email = "t2@t.com"
        consumer.user.avatar = "defaultAvatar.png"
        consumer.user.userType = GlobalConfig.USER_TYPE.CONSUMER
        consumer.user.confirmCode = null
        consumer.user.isActive = true

        consumer.lastName = "brandy"
        consumer.docType = "DNI"
        consumer.document = "88888888"
        consumer.country = "Argentina"
        consumer.province = "Vicente Lopez"
        consumer.district = "gduhg"
        consumer.street = "dufghfd"
        consumer.houseNumber = "777"
        consumer.cp = "555"
        consumer.phoneNumber = "66666666"
        consumer.phoneType = "cell"

        consumer.save()
    }
}
