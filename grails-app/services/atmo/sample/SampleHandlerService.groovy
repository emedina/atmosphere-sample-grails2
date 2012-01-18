package atmo.sample

class SampleHandlerService {

    static transactional = false

    static atmosphere = [mapping: '/atmosphere/sample']

    def onRequest = { event ->
        log.info "onRequest, ${event}"

        // Mark this connection as suspended.
        event.suspend()
    }

    def onStateChange = { event ->
        if (event.message) {
            log.info "onStateChange, message: ${event.message}"

            event.resource.response.writer.with {
                write event.message
                flush()
            }
        }
    }
}
