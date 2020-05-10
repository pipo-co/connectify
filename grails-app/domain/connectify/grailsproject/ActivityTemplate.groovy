package connectify.grailsproject

class ActivityTemplate {

    String name
    String description
    Integer duration
    String address
    Integer maxParticipants
    boolean isActive = true

    static hasMany = [activity: Activity]

    static belongsTo = [conectioner: Conectioner]

    static constraints = {
        name blank: false
        description blank: false
        duration blank: false
        address blank: false
        maxParticipants blank: false
    }

    static mapping = {
        activity cascade: "all-delete-orphan"
    }
}
