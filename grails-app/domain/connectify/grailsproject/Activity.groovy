package connectify.grailsproject

class Activity {

    Date initDate
    Integer participants = 0
    Category category

    static belongsTo = [activityTemplate: ActivityTemplate]

    static hasMany = [consumers: Consumer]

    static mapping = {
        category cascade: 'none'
    }

    static constraints = {
        initDate blank: false
        participants min: 0
    }
}
