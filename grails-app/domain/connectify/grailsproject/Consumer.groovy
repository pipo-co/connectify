package connectify.grailsproject

import java.time.LocalDate

class   Consumer {

        String lastName
        String docType
        String document
        String country //Add logic
        String province
        String district
        String street
        String houseNumber
        String cp
        String phoneNumber
        String phoneType //cell or house
        LocalDate suscribedUntil = null
        User user

        static belongsTo = Activity
        static hasMany = [activities: Activity]

        static constraints = {
            lastName blank: false
            user unique: true
            docType blank: false, inList: ['DNI', 'CI','Passport']
            document blank: false, matches: "[1-9][0-9]{7}"
            country blank: false, inList: ['Argentina', 'Chile','Brasil']
            province blank: false
            district blank: false
            street blank: false
            houseNumber blank: false, matches: "[1-9][0-9]{0,4}"
            cp blank: false, matches: "[1-9][0-9]{0,4}"
            phoneNumber blank: false, matches: "([0-9]{2})?[ .-]?[0-9]{4}[ .-]?[0-9]{4}"
            phoneType blank: false, inList: ["cell", "house"]
            suscribedUntil nullable: true
        }

        Boolean isSuscribed(){
            return suscribedUntil && suscribedUntil.compareTo(LocalDate.now()) >= 0
        }
}
