<template>
  <div id="modal" v-if="$store.state.editForm">
      <div id="editForm">
        <form v-on:submit.prevent="AddFilm($store.state.newFilm)">
        <label for="name">Film Name: </label>
        <input id="name" name="name" type="text" maxlength="50" required v-model="$store.state.newFilm.name" v-bind:class="{needsFixed: $store.state.newFilm.name != null && $store.state.newFilm.name.length > 50}">
        <p class="remCharWarning">{{RemainingNameChar}}</p>
        <label for="description">Description: </label>
        <textarea id="description" name="description" maxlength="500" v-model="$store.state.newFilm.desc" rows="4" cols="50" v-bind:class="{needsFixed: $store.state.newFilm.desc != null && $store.state.newFilm.desc.length > 500}"/>
        <p class="remCharWarning">{{RemainingDescriptionChar}}</p>
        <label for="release">Release Year: </label>
        <input id="dateEntry" type="number" max="2050" min="1800" placeholder="ie. 2001" v-model="$store.state.newFilm.release" required v-bind:class="{needsFixed: $store.state.newFilm.release < 1800 || $store.state.newFilm.release > 9999}">
        <span>
          <button v-on:click.prevent="CancelEdit()">Cancel</button>
          <input type="submit" name="submit" id="submitButton"/>
        </span>
      </form>
      </div>
    </div>
</template>

<script>
import FilmService from "@/services/FilmService.js"

export default {
   name:'edit-form',
   computed:{
    RemainingDescriptionChar(){
      if(this.$store.state.newFilm.desc == null){
        return 500 + " Characters Remaining"
      }else{
        if(this.$store.state.newFilm.desc.length == 500){
          return "You've reached the character limit"
        }
        return 500 - this.$store.state.newFilm.desc.length + " Characters Remaining";
      }
    },
    RemainingNameChar(){
      if(this.$store.state.newFilm.name == null){
        return 50 + " Characters Remaining"
      }else{
        if(this.$store.state.newFilm.name.length == 50){
          return "You've reached the character limit"
        }
        return 50 - this.$store.state.newFilm.name.length + " Characters Remaining";
      }
      
    }
  },
  methods:{
   CancelEdit(){
      return FilmService.GetFilms().then(response => {
        this.$store.commit("UPDATE_FILM_LIST", response.data)
        this.$store.commit("CLEAR_FORM")
        this.$store.commit("TOGGLE_FORM")
      })
    },
   AddFilm(newFilm){
      if(this.$store.state.newFilm.id == null){
        return FilmService.AddFilm(newFilm).then(response => {
        this.$store.commit("UPDATE_FILM_LIST", response.data)
        this.$store.commit("CLEAR_FORM")
        this.$store.commit("TOGGLE_FORM")
      })
      }else{
        return FilmService.UpdateFilm(newFilm).then(response => {
        this.$store.commit("UPDATE_FILM_LIST", response.data)
        this.$store.commit("CLEAR_FORM")
        this.$store.commit("TOGGLE_FORM")
      })
   }
   }
 },
}
</script>

<style>
#modal{
  z-index: 10;
  background-color: rgba(0, 0, 0, .5);
  height: 100vh;
  width:100vw;
}
#editForm{
  color: white;
  height: 40vh;
  width: 60vw;
  background-color:  rgba(0, 0, 0, .9);
  margin: 15vh 20vw;
  display: flex;
  align-content: center;
  justify-content: center;
  padding-top: 9vh;
  border-radius: 5%;
}
input{
  display: block;
}
textarea{
  display: block;
}
.remCharWarning{
  font-size: .7em;
  margin-top: 0;
}
.needsFixed{
  border-style: solid;
  border-color: red;
}
#submitButton{
  display: inline;
}
span{
  flex-grow: inherit;
}
#dateEntry{
  margin-bottom: 10px;  
}
</style>