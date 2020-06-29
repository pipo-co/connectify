package connectify.grailsproject

class Conectioner {

    String cbu
    String country //Add logic
    String province
    String district
    String street
    String houseNumber
    String cp
    String phoneNumber
    String phoneType //cell or house
    Users user

    static hasMany = [activityTemplates: ActivityTemplate]

    static constraints = {
        cbu blank: false, matches: "[0-9]{22}"
        user unique: true
        country blank: false, inList: ['Argentina', 'Chile','Brasil']
        province blank: false
        district blank: false
        street blank: false
        houseNumber blank: false, matches: "[1-9][0-9]{0,4}"
        cp blank: false, matches: "[1-9][0-9]{0,4}"
        phoneNumber blank: false, matches: "([0-9]{2})?[ .-]?[0-9]{4}[ .-]?[0-9]{4}"
        phoneType blank: false, inList: ["cell", "house"]
    }
    //https://es.wikipedia.org/wiki/Clave_Bancaria_Uniforme#Algoritmo_de_validaci%C3%B3n

    static mapping = {
        activityTemplates cascade: "all-delete-orphan"
    }
}