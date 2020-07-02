package connectify.grailsproject

import java.time.LocalDate
import java.time.LocalDateTime
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

    Boolean isActive(){
        return initDate.atTime(initTime).isAfter(LocalDateTime.now())
    }

    Boolean isFull(){
        return participants >= activityTemplate.maxParticipants
    }

    Boolean isConsumerSigned(Long consumerId){
        return consumers.any({ it.id.equals(consumerId)})
    }
}
