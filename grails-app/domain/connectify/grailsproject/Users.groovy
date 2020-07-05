package connectify.grailsproject

class Users {
    String username
    String password
    String email
    String name
    String avatar
    String userType
    Boolean isActive = false
    String confirmCode

    static belongsTo = [consumer: Consumer, conectioner: Conectioner]

    static constraints = {
        username blank: false, unique: true
        password blank: false, minSize: 8
        email email: true, blank: false, unique: true
        name blank: false
        avatar nullable: true, blank: true
        confirmCode nullable: true
        consumer nullable: true
        conectioner nullable: true
    }

    def beforeInsert(){
        this.password = this.password.encodeAsSHA256()
    }

    Boolean isTypeConsumer(){
        return userType.equals(GlobalConfig.USER_TYPE.CONSUMER)
    }

    Boolean isTypeConnectioner(){
        return userType.equals(GlobalConfig.USER_TYPE.CONNECTIONER)
    }
}
