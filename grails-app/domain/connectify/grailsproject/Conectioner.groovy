package connectify.grailsproject

class Conectioner {

    String cbu
    User user

    static constraints = {
        cbu blank: false
        user unique: true
    }
}
