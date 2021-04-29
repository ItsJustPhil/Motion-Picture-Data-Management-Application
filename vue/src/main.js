import Vue from 'vue';
import Vuex from 'vuex';
import App from './App.vue'
import store from "@/store";
import {FontAwesomeIcon} from "@fortawesome/vue-fontawesome"
import {faEdit} from "@fortawesome/free-solid-svg-icons"
import { library } from '@fortawesome/fontawesome-svg-core'
import {faCopy} from "@fortawesome/free-solid-svg-icons"
import {faTrashAlt} from "@fortawesome/free-solid-svg-icons"
import {faPlusCircle} from "@fortawesome/free-solid-svg-icons"

library.add(faEdit)
library.add(faCopy)
library.add(faTrashAlt)
library.add(faPlusCircle)

Vue.config.productionTip = false
Vue.component('font-awesome-icon', FontAwesomeIcon)

Vue.config.productionTip = false

Vue.use(Vuex)

new Vue({
  store,
  render: h => h(App),
}).$mount('#app')
