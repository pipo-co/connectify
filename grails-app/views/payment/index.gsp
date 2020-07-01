<%--
  Created by IntelliJ IDEA.
  User: tobias
  Date: 30/5/20
  Time: 16:00
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<meta name="layout" content="main"/>
<v-container >
    <v-row justify="center">
        <v-col cols="10">
            <v-card>
                <v-container>
                    <v-row>
                        <v-col>
                            <v-card flat>
                                <v-card-title>Inscribite a todas las actividades que quieras</v-card-title>
                                <v-card-subtitle class="text-left">
                                    Con cualquiera de las subscripciones tenes acceso a todas las actividades. Limitado a una clase por dia (independiente de la activdiad)
                                </v-card-subtitle>
                            </v-card>
                        </v-col>
                        <v-col>
                            <v-card flat>
                                <v-card-title>Contacto directo con los conectioners</v-card-title>
                                <v-card-subtitle class="text-left">
                                    Cualquier duda o inquietud puede ser discutida directamente con los proveedores de actividad.
                                </v-card-subtitle>
                            </v-card>
                        </v-col>
                        <v-col >
                            <v-card flat>
                                <v-card-title>Precios lideres en el mercado</v-card-title>
                                <v-card-subtitle class="text-left">
                                    La baja infrastructura y el gran control por parte de cada desarrollador de activuidades, nuestros precios son los mas competitivos del mercado
                                </v-card-subtitle>
                            </v-card>
                        </v-col>
                    </v-row>
                </v-container>
            </v-card>
            <br>
            <br>
            <v-card>
                <v-container>
                    <v-row>
                        <g:each in="${preferencesInfo}" var="preferenceInfo">
                            <v-col>
                                <div style="border-style: solid; border-color: ${preferenceInfo.months == 12 ? "green" : "black"}" >
                                    <v-card outlined>
                                        <v-card-title>
                                            Plan de ${preferenceInfo.months} meses
                                        </v-card-title>
                                        <v-card-subtitle class="text-left">
                                            Pago de unica vez de $${preferenceInfo.price}
                                        </v-card-subtitle>
                                        <v-card-text>
                                            Precio final por mes <strong>$${preferenceInfo.price / preferenceInfo.months as int}</strong>/mes
                                        </v-card-text>
                                        <v-card-actions >
                                            <v-btn color="#2E3047" bold outlined depressed href="${preferenceInfo.preference.initPoint}">Seleccionar</v-btn>
                                            <v-spacer></v-spacer>
                                            <span v-if="${preferenceInfo.months == 12 ? "true" : "false"}" style="color:green">MEJOR PRECIO</span>
                                        </v-card-actions>
                                    </v-card>
                                </div>
                            </v-col>
                        %{--            <a href="${preferenceInfo.preference.initPoint}">Suscribirse por ${preferenceInfo.months} meses. A solo $${preferenceInfo.price}</a>--}%
                        </g:each>
                    </v-row>
                </v-container>

            </v-card>

        </v-col>
    </v-row>


</v-container>
