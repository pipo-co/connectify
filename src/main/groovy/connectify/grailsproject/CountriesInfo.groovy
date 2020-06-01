package connectify.grailsproject

class CountriesInfo {

    static getProvinces(String country){
        switch(country){
            case supportedCountries[0]:
                return argentinaProvinces
            case supportedCountries[1]:
                return chileProvinces
            case supportedCountries[2]:
                return uruguayProvinces
        }
    }

    public static final String[] supportedCountries = [
            "Argentina", "Chile", "Uruguay"
    ]

    public static final String[] argentinaProvinces = [
            "Provincia de Misiones",
            "Provincia de San Luis",
            "Provincia de San Juan",
            "Provincia de Entre Ríos",
            "Provincia de Santa Cruz",
            "Provincia de Río Negro",
            "Provincia del Chubut",
            "Provincia de Córdoba",
            "Provincia de Mendoza",
            "Provincia de La Rioja",
            "Provincia de Catamarca",
            "Provincia de La Pampa",
            "Provincia de Santiago del Estero",
            "Provincia de Corrientes",
            "Provincia de Santa Fe",
            "Provincia de Tucumán",
            "Provincia del Neuquén",
            "Provincia de Salta",
            "Provincia del Chaco",
            "Provincia de Formosa",
            "Provincia de Jujuy",
            "Ciudad Autónoma de Buenos Aires",
            "Provincia de Buenos Aires",
            "Provincia de Tierra del Fuego, Antártida e Islas del Atlántico Sur"
    ]

    public static final String[] chileProvinces = [
            'Arica y Parinacota',
            'Tarapacá',
            'Antofagasta',
            'Atacama',
            'Coquimbo',
            'Valparaiso',
            'Metropolitana de Santiago',
            'Libertador General Bernardo O\'Higgins',
            'Maule',
            'Biobío',
            'La Araucanía',
            'Los Ríos',
            'Los Lagos',
            'Aisén del General Carlos Ibáñez del Campo',
            'Magallanes y de la Antártica Chilena'
    ]

    public static final String[] uruguayProvinces = [
            "Artigas",
            "Canelones",
            "Cerro Largo",
            "Colonia",
            "Durazno",
            "Flores",
            "Florida",
            "Lavalleja",
            "Maldonado",
            "Montevideo",
            "Paysandú",
            "Río Negro",
            "Rivera",
            "Rocha",
            "Salto",
            "San José",
            "Soriano",
            "Tacuarembó",
            "Treinta y Tres"
    ]

}
