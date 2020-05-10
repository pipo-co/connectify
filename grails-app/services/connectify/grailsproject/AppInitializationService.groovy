package connectify.grailsproject

import grails.gorm.transactions.Transactional

@Transactional
class AppInitializationService {

    static initialize(){
        initCategory("Fitness")
        initCategory("Cooking")
        createTestingConectioner()
        createTestingConsumer()
    }

    static private initCategory(String name) {
        Category category = new Category()
        category.name = name
        category.save()
    }

    static private createTestingConectioner(){
        Conectioner conectioner = new Conectioner()
        conectioner.user = new User()

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
        consumer.user = new User()

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
