<template>
  <div id="app">
    <edit-form v-if="$store.state.editForm"/>
    <div id="mainLayout">
      <button id="newFilmButton" v-on:click="$store.state.editForm = !$store.state.editForm"><font-awesome-icon icon="plus-circle"/> Add</button>
      <film-table></film-table>
    </div>
  </div>
</template>

<script>
import FilmTable from "@/components/FilmTable.vue"
import FilmService from "@/services/FilmService.js"
import EditForm from "@/components/EditForm.vue"

export default {
  name: 'App',
  components: {
    FilmTable,
    EditForm
  },
  methods:{
    GetFilms(){
      return FilmService.GetFilms().then(response =>{
        this.$store.commit("UPDATE_FILM_LIST", response.data)
      })
    }
  },
  created(){
    this.GetFilms();
  },
  data(){
    return{

    }
  }
}

</script>

<style>
body {
background-color: #131315;
height: 75vh;
margin: 0;
font-family: Arial, Helvetica, sans-serif;
font-size: 1.5em;
}

#app{
  display: flex;
  flex-direction: column;
}

#newFilmButton{
  background-color: #088CFF;
  color: white;
  padding: 5px 5px;
  align-self: flex-end;
  border-radius: 10%;
  outline: none;
  border: none;
  margin-bottom: 2px;
}

#mainLayout{
  position: absolute;
  display: flex;
  flex-direction: column;
  margin-top:15vh;
  margin-left: 17vw;
}

</style>
