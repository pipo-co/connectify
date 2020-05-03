package connectify.grailsproject

import grails.util.Holders
import org.springframework.web.multipart.MultipartFile

class FileUtil {

    public static final String defaultAvatar = "defaultAvatar.png"

    public static String getRootPath(){
        return Holders.servletContext?.getRealPath("")
    }

    public static getAvatarDir(){
        return "${getRootPath()}avatar"
    }
//
//
//    public static File makeDirectory(String path){
//        File file = new File(path)
//        if (!file.exists()){
//            file.mkdirs()
//        }
//        return file
//    }

    public static getAvatarName(String username, String filename){
        return (filename.equals(""))? defaultAvatar : username + "-" + filename
    }

    public static void uploadAvatar(String filename, MultipartFile multipartFile){
        if (filename && multipartFile && !filename.equals(defaultAvatar))
            multipartFile.transferTo(new File(getAvatarDir() + "/", filename))
    }
}
