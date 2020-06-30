package connectify.grailsproject

class Province {

    String name

    static belongsTo = [country: Country]

    static constraints = {
    }
}
