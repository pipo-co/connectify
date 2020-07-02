package connectify.grailsproject

class ActivityTemplate {

    String name
    String description
    Integer duration
    String address
    Double latitude
    Double longitude
    Integer maxParticipants
    Category category
    boolean isActive = true

    static hasMany = [activity: Activity]

    static belongsTo = [conectioner: Conectioner]

    static constraints = {
        name blank: false
        description blank: false
        duration blank: false
        address blank: false
        latitude blank: false
        longitude blank: false
        maxParticipants blank: false
    }

    static mapping = {
        activity cascade: "all-delete-orphan"
        category cascade: 'none'
    }

    Boolean hasActiveActivity(){
        return activity.any({ it.isActive() && !it.isFull() })
    }
}
