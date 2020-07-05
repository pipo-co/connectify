package connectify.grailsproject

import grails.testing.web.interceptor.InterceptorUnitTest
import spock.lang.Specification

class ConsumerInterceptorSpec extends Specification implements InterceptorUnitTest<ConsumerInterceptor> {

    def setup() {
    }

    def cleanup() {

    }

    void "Test consumer interceptor matching"() {
        when:"A request matches the interceptor"
            withRequest(controller:"consumer")

        then:"The interceptor does match"
            interceptor.doesMatch()
    }
}
