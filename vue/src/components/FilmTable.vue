<template>
  <table id="filmTable">
   <tr>
    <th v-on:click="SortTable(0)">Film Name</th>
    <th v-on:click="SortTable(1)">Description</th>
    <th v-on:click="SortTable(2)">Release Year</th>
    <th>Actions</th>
   </tr>
   <tr v-for="film in $store.state.listOfFilms" v-bind:key="film.id">
    <td>{{film.name.length &lt; 20 ? film.name : film.name.substring(0,20) + "..."}}</td>
    <td>{{film.desc.length &lt; 30 ? film.desc : film.desc.substring(0,30) + "..."}}</td>
    <td>{{film.release}}</td>
    <td class="editButtons">
      <button v-on:click.prevent="EditFilm(film)"><font-awesome-icon icon="edit"/></button>
      <button v-on:click.prevent="CopyFilm(film)"><font-awesome-icon icon="copy"/></button>
      <button v-on:click.prevent="DeleteFilm(film.id)"><font-awesome-icon class="deleteIcon" icon="trash-alt"/></button>
    </td>
   </tr>
  </table>
</template>

<script>
import FilmService from "@/services/FilmService.js"

export default {
 name:"film-table",
 methods:{
   DeleteFilm(filmId){
     if(confirm("You'll never be able to get it back! Are you sure?")){
       return FilmService.DeleteFilm(filmId).then(response => {
        this.$store.commit("UPDATE_FILM_LIST", response.data)
     })
     }
   },
   CopyFilm(film){
     film.id = null;
     this.$store.commit("TOGGLE_FORM")
     this.$store.commit("EDIT_FILM", film)
   },
   EditFilm(film){
     this.$store.commit("TOGGLE_FORM")
     this.$store.commit("EDIT_FILM", film)
   },
   /*Have to come clean I had to do some googling on this one*/
   SortTable(n){
     let table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
     table = document.getElementById("filmTable");
     switching = true;

     dir = "asc"

     while(switching){
       switching = false;
       rows = table.rows;

       for(i = 1; i < (rows.length - 1); i++){
         shouldSwitch = false;

         x = rows[i].getElementsByTagName("TD")[n];
         y = rows[i+1].getElementsByTagName("TD")[n];

         if(dir == "asc"){
           if(x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()){
             shouldSwitch = true;
             break;
           }
         }else if (dir == "desc"){
           if(x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()){
             shouldSwitch = true;
             break;
           }
         }
       }

       if(shouldSwitch){
         rows[i].parentNode.insertBefore(rows[i+1], rows[i]);
         switching = true;
         switchcount++;
       }else{
         if(switchcount == 0 && dir == "asc"){
           dir = "desc";
           switching = true;
         }
       }
     }
   }
 }

}
</script>

<style>
#filmTable{
 color: #f7F9FA;
 width: 60vw;
 justify-content: center;
 align-content: center;
 border-spacing: 0px;
}

th{
 font-weight: bold;
}

.deleteIcon{
  color: #D94340
}

.editButtons{
  display: flex;
  justify-content: space-around;
}

.editButtons button{
  border: none;
  padding: none;
  color: inherit;
  background-color: inherit;
  font-size: 1em;
}
td{
  border-top: 1px solid #495057;
  border-bottom: 1px solid #495057;
}
tr:nth-child(even){
  background-color: #1A1A1E ;
}
</style>