package connectify.grailsproject

class ActivityTemplate {

    String description
    Integer duration
    String address
    Integer maxParticipants
    boolean isActive = true

    static belongsTo = [conectioner: Conectioner]

    static constraints = {
        description blank: false
        duration blank: false
        address blank: false
        maxParticipants blank: false
    }
}
