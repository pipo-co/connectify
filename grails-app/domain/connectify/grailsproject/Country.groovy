package connectify.grailsproject

class Country {

    String name
    Double latitude
    Double longitude

    static hasMany = [provinces: Province]

    static constraints = {
    }
}
