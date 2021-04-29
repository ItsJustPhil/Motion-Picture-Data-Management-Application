import Vue from "vue";
import Vuex from "vuex";

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    errors: {},
    listOfFilms: {},
    newFilm: {},
    editForm: false
  },

  getters: {
    errors(state) {
      return state.errors;
    }
  },

  mutations: {
    SET_ERRORS(state, data) {
      state.errors = data;
    },
    UPDATE_FILM_LIST(state, data){
     state.listOfFilms = data;
    },
    CLEAR_FORM(state){
     state.newFilm = {};
    },
    TOGGLE_FORM(state){
     state.editForm = !state.editForm;
    },
    EDIT_FILM(state, data){
     state.newFilm = data;
    }
  },

  actions: {
    setErrors({ commit }, errors) {
      commit("SET_ERRORS", errors);
    }
  }
});