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
            <v-card color="#1d1e33">
                <v-container>
                    <v-row align="center" justify="center">
                        <v-col>
                                <v-card-subtitle class="title pb-0 teal--text text--accent-3">Inscribite a todas las <br>actividades que quieras</v-card-subtitle>

                        </v-col>
                        <v-col>
                                <v-card-subtitle class="title pb-0 teal--text text--accent-3">Contacto directo con <br>los conectioners</v-card-subtitle>

                        </v-col>
                        <v-col >
                                <v-card-subtitle class="title pb-0 teal--text text--accent-3">Precios lideres en el mercado</v-card-subtitle>
                        </v-col>
                    </v-row>
                    <v-row>
                        <v-col cols="4">
                            <v-card-subtitle class="white--text">
                                Con cualquiera de las subscripciones tenes acceso a todas las actividades. Limitado a una clase por dia (independiente de la activdiad)
                            </v-card-subtitle>
                        </v-col>
                        <v-col cols="4">
                            <v-card-subtitle class="white--text">
                                Cualquier duda o inquietud puede ser discutida directamente con los proveedores de actividad.
                            </v-card-subtitle>
                        </v-col>
                        <v-col cols="4">
                            <v-card-subtitle class="white--text">
                                La baja infrastructura y el gran control por parte de cada desarrollador de activuidades, nuestros precios son los mas competitivos del mercado
                            </v-card-subtitle>
                        </v-col>
                    </v-row>
                </v-container>
            </v-card>
            <br>
            <br>
            <v-card color="#1d1e33">
                <v-container>
                    <v-row>
                        <g:each in="${preferencesInfo}" var="preferenceInfo">
                            <v-col>
                                <div style="border-style: solid; border-color: ${preferenceInfo.months == 12 ? "#1DE9B6" : "black"}" >
                                    <v-card outlined color="#1d1e33">
                                        <v-card-title class="white--text">
                                            Plan de ${preferenceInfo.months} meses
                                        </v-card-title>
                                        <v-card-subtitle class="white--text text-left">
                                            Pago de unica vez de $${preferenceInfo.price}
                                        </v-card-subtitle>
                                        <v-card-text class="white--text">
                                            Precio final por mes <strong>$${preferenceInfo.price / preferenceInfo.months as int}</strong>/mes
                                        </v-card-text>
                                        <v-card-actions >
                                            <v-btn color="#1DE9B6" bold outlined depressed href="${preferenceInfo.preference.initPoint}">Seleccionar</v-btn>
                                            <v-spacer></v-spacer>
                                            <span v-if="${preferenceInfo.months == 12 ? "true" : "false"}" style="color:#00BFA5">MEJOR PRECIO</span>
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
