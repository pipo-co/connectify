package connectify.grailsproject

class Category {

    public static final int imgPoolSize = 4
    private static final Random randGen = new Random()
    private static final String imgDir = "category"

    String name

    static constraints = {
        name blank: false, unique: true
    }

    private String imgBasePath(){
        return imgDir + "/" + name.toLowerCase()
    }

    public String indexImgPath(){
        return imgBasePath() + "/index.png"
    }

    public String randStockImgPath(){
        int rand = randGen.nextInt(imgPoolSize) + 1
        return imgBasePath() + "/" + "img" + rand + ".jpg"
    }
}
