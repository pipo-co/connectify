package connectify.grailsproject

class Consumer {

        String lastName
//        String docType
//        String document
//        String country //Add logic
//        String province
//        String district
//        String street
//        Integer houseNumber
//        Integer cp
//        String phoneNumber
//        String phoneType //cell or house
        User user

        static constraints = {
            lastName blank: false
            user unique: true
//            docType blank: false, inList: ["dni", "ci", "passport"]
//            document blank: false, size: 8
//            country blank: false
//            province blank: false
//            district blank: false
//            street blank: false
//            houseNumber blank: false, maxSize: 100000
//            cp blank: false, maxSize: 100000
//            phoneNumber blank: false, matches: "([0-9]{2})?[ .-]?[0-9]{4}[ .-]?[0-9]{4}"
//            phoneType blank: false, inList: ["cell", "house"]
        }


}
