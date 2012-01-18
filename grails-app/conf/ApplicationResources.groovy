modules = {
    application {
        resource url:'js/application.js'
    }
    overrides {
        'atmosphere'{
            dependsOn 'jquery'
        }
    }
}