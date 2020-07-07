<script>
    new Vue({
        el: '#app',
        vuetify: new Vuetify(),
        data: {
            headers: [
                {
                    text: 'Date',
                    align: 'start',
                    sortable: false,
                    value: 'info.initDate',
                },
                { text: 'Time', value: 'info.initTime' },
                { text: 'Participants', value: 'info.participants' },
                { text: 'Max participants', value: 'info.activityTemplate.maxParticipants' },
            ],
            window: window,
            icons: [
                'mdi-facebook',
                'mdi-twitter',
                'mdi-linkedin',
                'mdi-instagram',
            ],
            links: [
                {name:'Home', dir:'#'},
                {name:'About Us', dir:'#'},
                {name:'Team', dir:'#'},
                {name:'Contact Us', dir:'#'},
            ],
            itemsConsumer: [
                {title: 'Calendar', color: 'black--text', link: '/consumer/schedule'},
                {title: 'Log out', color: 'red--text', link: '/authentication/logout'}
            ],
            itemsConnectioner: [
                {title: 'Activities', color: 'black--text', link: '/activityTemplate/index'},
                {title: 'Log out', color: 'red--text', link: '/authentication/logout'}
            ],
            countries: null,
            provinces: null,
            phoneTypes: [
                'cell', 'house'
            ],
            docTypes: [
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
            form: {
                password: '',
                email: ''
            },
            rules: {
                required: value => !!value || 'Required.',
                counter: value => value.length <= 20 || 'Max 20 characters',
                email: value => {
                    let pattern = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
                    return pattern.test(value) || 'Invalid e-mail.';
                },
            },
            mountedRouteMap: {
                    "/": function () {
                        console.log("estoy en index");
                    },
                    "/consumer/create": function () {
                        this.getCountries();
                        if ("${fieldValue(bean: consumer, field: 'country')}" !== "")
                            this.getProvinces("${fieldValue(bean: consumer, field: 'country')}");
                    },
                    "/consumer/edit": function () {
                        this.getCountries();
                        this.getProvinces("${fieldValue(bean: consumer, field: 'country')}")
                    },
                    "/consumer/schedule": function () {
                        this.getUserActivities();
                    },
                    "/conectioner/create": function () {
                        this.getCountries();
                        if ("${fieldValue(bean: conectioner, field: 'country')}" !== "")
                            this.getProvinces("${fieldValue(bean: conectioner, field: 'country')}");
                    },
                    "/conectioner/edit": function () {
                        this.getCountries();
                        this.getProvinces("${fieldValue(bean: conectioner, field: 'country')}")
                    },
                    "/activityTemplate/create": function () {
                        this.getCategories();
                    },
                    "/activityTemplate/details": function () {
                        this.getUserActivitiesId();
                    },
                    "/search/index": function () {
                        this.getCategories();
                        this.getCountries();
                    },
                    "/search/searchResult": function () {
                        this.getCategories();
                        this.getCountries();
                        if ("${country}" !== "")
                            this.getProvinces("${country}");
                    },
                    "/map/index": function () {
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
            getUserActivitiesId() {
                <g:if test="${session.authorized && session.authorized.user.isTypeConsumer()}">
                axios.get('/api/getConsumerActivitiesId/' + ${session.authorized.user.consumer.id})
                    .then(response => this.subscribedActivities = response.data)
                    .catch(console.log);
                </g:if>
            },
            getUserActivities() {
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
                    .then(responseTemplates => {

                        <g:if test="${session.authorized && session.authorized.user.isTypeConsumer()}">
                        axios.get('/api/getCountryCoordinates/' + '${session.authorized.user.consumer.country}')
                            .then(responseCoordinates => {
                                window.initializeMap(responseCoordinates.data);
                                window.loadMarkers(responseTemplates.data);
                            }).catch(console.log);
                        </g:if>

                        <g:elseif test="${session.authorized && session.authorized.user.isTypeConnectioner()}">
                        axios.get('/api/getCountryCoordinates/' + '${session.authorized.user.conectioner.country}')
                            .then(responseCoordinates => {
                                window.initializeMap(responseCoordinates.data);
                                window.loadMarkers(responseTemplates.data);
                            }).catch(console.log);
                        </g:elseif>

                        <g:else>
                        window.loadMarkers(responseTemplates.data);
                        </g:else>
                    })
                    .catch(console.log);
            },
        },
        computed: {
            isSubscribed() {
                return !!(this.subscribedActivities != null && this.subscribedActivities.includes(parseInt(this.currentChip, 10)));
            },
            passwordProgress() {
                return Math.min(100, this.form.password.length * 5)
            },
            passwordProgressColor() {
                return ['error', 'warning', 'success'][Math.floor(this.passwordProgress / 40)]
            },
            passwordMessage() {
                return ['At least 8 characters', 'Weak', 'Strong'][Math.floor(this.passwordProgress / 40)]
            }
        },
        created() {
            this.show = true;
        },
        mounted() {
            let currentRoute = window.location.pathname;
            if (currentRoute !== '/') {
                currentRoute = currentRoute.split('/');

                if(currentRoute.length < 3)
                    currentRoute[2] = "index";

                currentRoute = '/' + currentRoute[1] + '/' + currentRoute[2];
            }

            if (this.mountedRouteMap[currentRoute])
                this.mountedRouteMap[currentRoute].call(this);
        }
    })
</script>