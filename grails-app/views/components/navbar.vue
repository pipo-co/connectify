<template id="nav-bar-template">
    <div class="navbar" padding>
        <v-app-bar fixed color="#72E1C7">
            <v-row align="center" justify="center">
                <v-col cols="3">
                    <v-toolbar-title color="3C3F58">SMARTIFY</v-toolbar-title>
                </v-col>
                <v-col cols="4"></v-col>
                <v-col cols="1">
                    <v-btn icon>
                        <v-icon>mdi-magnify</v-icon>
                    </v-btn>
                </v-col>
                <v-col cols="4">
                    <v-tabs right color="#3C3F58" background-color="#72E1C7">
                        <v-tabs-slider color="#87FFE3"></v-tabs-slider>
                        <v-tab>Favoritos</v-tab>
                        <v-tab>Hogares</v-tab>
                        <v-tab>Rutinas</v-tab>
                        <v-tab>Consumos</v-tab>
                    </v-tabs>
                </v-col>
            </v-row>
        </v-app-bar>
    </div>
</template>

<script>
    export default {
        name: 'nav-bar-template'
    }
</script>

<style>
</style>