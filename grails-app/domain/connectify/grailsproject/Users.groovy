package connectify.grailsproject

class Users {
    String username
    String password
    String email
    String name
    byte[] avatar
    String avatarType
    String userType
    Boolean isActive = false
    String confirmCode

    static belongsTo = [consumer: Consumer, conectioner: Conectioner]

    static constraints = {
        username blank: false, unique: true
        password blank: false, minSize: 8
        email email: true, blank: false, unique: true
        name blank: false
        avatar nullable: true, blank: true, maxSize: 2 * 1024 * 1024 // 2MiB
        avatarType nullable: true, blank: true, inList: ['image/png', 'image/jpeg', 'image/jpg']
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
