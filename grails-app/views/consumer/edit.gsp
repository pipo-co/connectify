<%--
  Created by IntelliJ IDEA.
  User: tobias
  Date: 1/5/20
  Time: 00:40
--%>


%{--Include Main Layout--}%
<meta name="layout" content="main"/>
<v-container class="my-2">
    <v-row>
        <v-col cols="3">
            <p class="headline"><g:message code="consumer" args="['Update']"/>:</p>
        </v-col>
    </v-row>
</v-container>

<div class="card-body">
    <g:form controller="consumer" action="update" enctype="multipart/form-data">
        <g:hiddenField name="id" value="${consumer.id}"/>
        <g:render template="form" model="[edit:'yes']"/>
    %{--            <div class="form-action-panel">--}%
    %{--                <g:submitButton class="btn btn-primary" name="update" value="${g.message(code: "update")}"/>--}%
    %{--                <g:link controller="consumer" action="index" class="btn btn-primary"><g:message code="cancel"/></g:link>--}%
    %{--            </div>--}%
        <v-container class="ma-1 pa-1" fluid>
            <v-row align="center" justify="center" >
                <v-col cols="2">
                    <v-btn color="#2E3047" class="white--text" type="submit" width="200" name="save" value="${g.message(code: "update")}">
                        <g:message code="update"/>
                    </v-btn>
                </v-col>
                <v-col cols="2">
                    <v-btn color="red" class="white--text"  width="200" href="/" >
                        <g:message code="cancel"/>
                    </v-btn>
                </v-col>
            </v-row>
        </v-container>
    </g:form>

</div>