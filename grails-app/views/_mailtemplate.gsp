<div>
    <h1> Email Confirmation</h1>

    <g:link absolute="true" controller="user" action="confirm" id="${user.confirmCode}">Click this link to confirm your account</g:link>

    <g:createLink absolute="true" controller="user" action="confirm" id="${user.confirmCode}"></g:createLink>
</div>