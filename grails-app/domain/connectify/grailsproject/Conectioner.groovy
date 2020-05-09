package connectify.grailsproject

class Conectioner {

    String cbu
    User user

    static hasMany = [activityTemplates: ActivityTemplate]

    static constraints = {
        cbu blank: false, matches: "[0-9]{22}"
        user unique: true
    }
    //https://es.wikipedia.org/wiki/Clave_Bancaria_Uniforme#Algoritmo_de_validaci%C3%B3n

    static mapping = {
        activityTemplates cascade: "all-delete-orphan"
    }
}
