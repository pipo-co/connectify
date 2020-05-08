package connectify.grailsproject

class Conectioner {

    String cbu
    User user

    static hasMany = [activityTemplates: ActivityTemplate]

    static constraints = {
        cbu blank: false
        user unique: true
    }

    static mapping = {
        activityTemplates cascade: "all-delete-orphan"
    }
}
