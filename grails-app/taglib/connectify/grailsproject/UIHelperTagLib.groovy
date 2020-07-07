package connectify.grailsproject

class UIHelperTagLib {

    static namespace = "UIHelper"

    def templateByTobi = { attrs, body ->
        def model = attrs.model
        String fieldName = attrs.fieldName
        String errorMessage = attrs.errorMessage? g.message(code: attrs.errorMessage): g.message(code: "invalid.input")
        if (model && model.errors && model.errors.getFieldError(fieldName)){
            out << "<small class='form-text text-danger''><strong>${errorMessage}</strong></small>"
        }
    }

    def avatarPath = { attrs ->
        Users user = attrs.user as Users

        if(user.avatar)
            out << createLink(controller:'user', action:'getAvatar', id: user.id)
        else
            out << assetPath(src: "defaultAvatar.png")
    }
}