package connectify.grailsproject

class Category {

    String name

    static belongsTo = [activity: Activity]

    static constraints = {
        name blank: false
    }
}
