<%--
  Created by IntelliJ IDEA.
  User: tobias
  Date: 30/4/20
  Time: 23:17
--%>

%{--<%@ page contentType="text/html;charset=UTF-8" %>--}%
%{--Include Main Layout--}%
<meta name="layout" content="main"/>

<v-container class="my-2">
    <v-row>
        <v-col>
            <p class="headline">Start an activity:</p>
        </v-col>
    </v-row>
</v-container>


        <g:form controller="activity" action="save">

        %{--Partial Templating--}%
            <g:render template="form"/>
            <div class="form-action-panel">
                <v-container class="ma-1 pa-1" fluid>
                    <v-row align="center" justify="center" >
                        <v-col cols="2">
                            <v-btn color="#59D0B4" class="white--text" type="submit" width="200" name="save" value="${g.message(code: "save")}">
                                Save
                            </v-btn>
                        </v-col>
                        <v-col cols="2">
                            <v-btn color="red" class="white--text"  width="200" href="/" >
                                <g:message code="cancel"/>
                            </v-btn>
                        </v-col>
                    </v-row>
                </v-container>
            </div>
        </g:form>
