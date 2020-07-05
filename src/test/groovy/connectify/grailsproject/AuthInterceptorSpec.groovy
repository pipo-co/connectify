package connectify.grailsproject

import grails.testing.web.interceptor.InterceptorUnitTest
import spock.lang.Specification

class AuthInterceptorSpec extends Specification implements InterceptorUnitTest<AuthInterceptor> {

    def setup() {
    }

    def cleanup() {

    }

    void "Test security interceptor matching"() {
        when:"A request matches the interceptor"
            withRequest(controller:"security")

        then:"The interceptor does match"
            interceptor.doesMatch()
    }
}
