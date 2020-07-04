<script>
    console.log("holisss");
    new Vue({
        el: '#app',
        vuetify: new Vuetify(),
        data: {
            window: window,
            icons: [
                'mdi-facebook',
                'mdi-twitter',
                'mdi-linkedin',
                'mdi-instagram',
            ],
            links: [
                'Home',
                'About Us',
                'Team',
                'Services',
                'Blog',
                'Contact Us',
            ],
            headersActivityTemplate: [
                {text: 'Name', value: 'name'},
                {text:'Description', value: 'description' },
                {text:'Duration', value: 'duration'},
                {text:'Max', value: 'max'},
                {text:'Participants', value:'participants'},
                {text:'Action', value: 'actions'},
            ],
            itemsConsumer: [
                { title: 'Calendar', color:'black--text', link:'/consumer/schedule'},
                { title: 'Log out', color:'red--text', link:'/authentication/logout'}
            ],
            itemsConnectioner: [
                { title: 'Activities', color:'black--text', link:'/activityTemplate/index'},
                { title: 'Log out', color:'red--text', link:'/authentication/logout'}
            ],
            cards: [
                { category:'Fitness', title: 'Crossfit', show: false, max: '10', suscribed:'7',hour:"17:30", connectioner: 'Big', src: 'https://cdn.vuetifyjs.com/images/cards/house.jpg', flex: 12 },
                { category:'Fitness', title: 'Crossfit2', show: false, max: '10', suscribed:'7',hour:"17:30", connectioner: 'Big', src: 'https://cdn.vuetifyjs.com/images/cards/house.jpg', flex: 12 },
                { category:'Fitness', title: 'Crossfit3', show: false, max: '10', suscribed:'7',hour:"17:30", connectioner: 'Big', src: 'https://cdn.vuetifyjs.com/images/cards/house.jpg', flex: 12 }

            ],
            countries: null,
            provinces: null,
            phoneTypes: [
                'cell', 'house'
            ],
            docTypes:[
                'DNI', 'CI', 'Passport'
            ],
            show: false,
            categories: null,
            picker: null,
            timePicker: null,
            events: [],
            focus: '',
            calendarType: 'month',
            currentChip: null,
            currentParticipants: null,
            subscribedActivities: null,
            password: '',
            mountedRouteMap: {
                "/": function() {
                    console.log("estoy en index");
                },
                "/consumer/create": function() {
                    this.getCountries();
                    if("${fieldValue(bean: consumer, field: 'country')}" !== "")
                        this.getProvinces("${fieldValue(bean: consumer, field: 'country')}");
                },
                "/consumer/edit": function() {
                    this.getCountries();
                    this.getProvinces("${fieldValue(bean: consumer, field: 'country')}")
                },
                "/consumer/schedule": function() {
                    this.getUserActivities();
                },
                "/conectioner/create": function() {
                    this.getCountries();
                    if("${fieldValue(bean: conectioner, field: 'country')}" !== "")
                        this.getProvinces("${fieldValue(bean: conectioner, field: 'country')}");
                },
                "/conectioner/edit": function() {
                    this.getCountries();
                    this.getProvinces("${fieldValue(bean: conectioner, field: 'country')}")
                },
                "/activityTemplate/create": function() {
                    this.getCategories();
                },
                "/activityTemplate/details": function(){
                    this.getUserActivitiesId();
                },
                "/search/index": function() {
                    this.getCategories();
                    this.getCountries();
                },
                "/search/searchResult": function() {
                    this.getCategories();
                    this.getCountries();
                    if("${country}" !== "")
                        this.getProvinces("${country}");
                },
                "/search/categoryList": function(){
                },
                "/map/index": function(){
                    this.prepareMapMarkers();
                }
            },
        },
        methods: {
            getCategories() {
                axios.get('/api/getCategories')
                    .then(response => this.categories = response.data)
                    .catch(console.log);
            },
            getCountries() {
                axios.get('/api/getCountries')
                    .then(response => this.countries = response.data)
                    .catch(console.log);
            },
            getProvinces(country) {
                axios.get('/api/getProvinces/' + country)
                    .then(response => this.provinces = response.data)
                    .catch(console.log);
            },
            takeOnActivity(activityId) {
                axios.get('/activity/addConsumerToActivity/' + activityId.toString())
                    .then(() => this.getUserActivitiesId())
                    .catch(console.log);
            },
            takeOffActivity(activityId) {
                axios.get('/activity/removeConsumerFromActivity/' + activityId.toString())
                    .then(() => this.getUserActivitiesId())
                    .catch(console.log)
            },
            setCurrentParticipants(participants, chip) {
                this.currentParticipants = participants;
                this.currentChip = chip;
            },
            getUserActivitiesId(){
                <g:if test="${session.authorized && session.authorized.user.isTypeConsumer()}">
                axios.get('/api/getConsumerActivitiesId/' + ${session.authorized.user.consumer.id})
                    .then(response => this.subscribedActivities = response.data)
                    .catch(console.log);
                </g:if>
            },
            getUserActivities(){
                <g:if test="${session.authorized && session.authorized.user.isTypeConsumer()}">
                axios.get('/api/getConsumerActivities/' + ${session.authorized.user.consumer.id})
                    .then(response => {
                        this.subscribedActivities = response.data;
                        console.log(this.subscribedActivities);
                    })
                    .catch(console.log);
                </g:if>
            },
            prepareMapMarkers() {
                axios.get('/api/getActiveActivityTemplates')
                    .then(response => {
                        <g:if test="${session.authorized && session.authorized.user.isTypeConsumer()}">
                        axios.get('/api/getCountryCoordinates/' + ${session.authorized.user.consumer.country})
                            .then(response => {
                                window.initializeMap(response);
                            }).catch(console.log);
                        </g:if>
                        <g:elseif test="${session.authorized && session.authorized.user.isTypeConnectioner()}">
                        axios.get('/api/getCountryCoordinates/' + ${session.authorized.user.conectioner.country})
                            .then(response => {
                                window.initializeMap(response);
                            }).catch(console.log);
                        </g:elseif>
                        window.loadMarkers(response.data);
                    })
                    .catch(console.log);
            },
        },
        computed:{
            isSubscribed() {
                return !!(this.subscribedActivities != null && this.subscribedActivities.includes(parseInt(this.currentChip, 10)));
            },
            passwordProgress () {
                return Math.min(100, this.password.length * 5)
            },
            passwordProgressColor () {
                return ['error', 'warning', 'success'][Math.floor(this.passwordProgress / 40)]
            },
            passwordMessage(){
                return ['At least 8 characters', 'Week', 'Strong'][Math.floor(this.passwordProgress / 40)]
            }

        },
        created(){
            this.show = true;
        },
        mounted(){
            let currentRoute = window.location.pathname;
            if(currentRoute !== '/'){
                currentRoute = currentRoute.split('/');
                currentRoute = '/' + currentRoute[1] + '/' + currentRoute[2];
            }

            if(this.mountedRouteMap[currentRoute])
                this.mountedRouteMap[currentRoute].call(this);
        }
    })
</script>