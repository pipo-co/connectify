package connectify.grailsproject

import java.time.LocalDate
import java.time.LocalTime

class Activity {

    LocalDate initDate
    LocalTime initTime
    Integer participants = 0

    static belongsTo = [activityTemplate: ActivityTemplate]

    static hasMany = [consumers: Consumer]

    static constraints = {
        initDate blank: false
        initTime blank: false
        participants min: 0
    }
}
