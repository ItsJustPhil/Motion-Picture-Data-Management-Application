import axios from 'axios'

const http = axios.create({
 baseURL: "https://localhost:44321"
})
export default{

  GetFilms(){
   return http.get(`/api/films`)
  },

  AddFilm(film){
    return http.post(`/api/films`, {
      name: film.name,
      desc: film.desc,
      release: film.release
    })
  },

  DeleteFilm(filmId){
    return http.delete(`/api/films/${filmId}`)
  },

  UpdateFilm(film){
    return http.put(`/api/films/${film.id}`, film)
  }

}