package connectify.grailsproject

class Category {

    String name

    static constraints = {
        name blank: false, unique: true
    }
}
