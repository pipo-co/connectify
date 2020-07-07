package connectify.grailsproject

import connectify.grailsproject.interceptors.ConectionerInterceptor
import grails.testing.web.interceptor.InterceptorUnitTest
import spock.lang.Specification

class ConectionerInterceptorSpec extends Specification implements InterceptorUnitTest<ConectionerInterceptor> {

    def setup() {
    }

    def cleanup() {

    }

    void "Test conectioner interceptor matching"() {
        when:"A request matches the interceptor"
            withRequest(controller:"conectioner")

        then:"The interceptor does match"
            interceptor.doesMatch()
    }
}
