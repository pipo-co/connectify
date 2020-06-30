package connectify.grailsproject

class Country {

    String name

    static hasMany = [provinces: Province]

    static constraints = {
    }
}
