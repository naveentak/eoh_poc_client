import Vue from 'vue'
import Router from 'vue-router'
import Address from '@/components/Addresses'

Vue.use(Router)

export default new Router({
    routes: [{
        path: '/',
        name: 'addresses',
        component: Address
    }]
})