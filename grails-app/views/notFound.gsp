<!doctype html>
<html>
    <head>
        <title>Page Not Found</title>
        <meta name="layout" content="main">
        <asset:stylesheet src="notFound.css"/>
    </head>
    <body>
        %{--  404 page credit to:
                Ricardo Prieto
                November 5, 2017
        --}%
        <section class="error-container">
            <span>4</span>
            <span><span class="screen-reader-text">0</span></span>
            <span>4</span>
        </section>
        <h1>Unknown URL ${request.forwardURI}</h1>
        <p class="zoom-area"><strong>Please try again :)</strong></p>
    </body>
</html>