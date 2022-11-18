package connectify.grailsproject

import connectify.grailsproject.interceptors.NoAuthInterceptor
import grails.testing.web.interceptor.InterceptorUnitTest
import spock.lang.Specification

class NoAuthInterceptorSpec extends Specification implements InterceptorUnitTest<NoAuthInterceptor> {

    def setup() {
    }

    def cleanup() {

    }

    void "Test noAuth interceptor matching"() {
        when:"A request matches the interceptor"
            withRequest(controller:"noAuth")

        then:"The interceptor does match"
            interceptor.doesMatch()
    }
}
