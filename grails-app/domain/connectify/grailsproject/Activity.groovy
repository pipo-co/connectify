package connectify.grailsproject

class Activity {

    Date initDate
    Integer participants = 0

    static belongsTo = [activityTemplate: ActivityTemplate]

    static hasMany = [consumers: Consumer]

    static constraints = {
        initDate blank: false
        participants min: 0
    }
}
