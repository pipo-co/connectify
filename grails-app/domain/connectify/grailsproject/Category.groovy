package connectify.grailsproject

class Category {

    String name

    static belongsTo = [activityTemplate: ActivityTemplate]

    static constraints = {
        name blank: false
    }
}
