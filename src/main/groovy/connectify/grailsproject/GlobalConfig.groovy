package connectify.grailsproject

class GlobalConfig {

    public static final def USER_TYPE = [
            ADMINISTRATOR: "ADMINISTRATOR",
            CONSUMER: "CONSUMER",
            CONNECTIONER: "CONNECTIONER"
    ]


    public static Integer itemsPerPage() {
        return 5
    }
}
