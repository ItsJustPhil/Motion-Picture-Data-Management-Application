using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MPDMA.DAO;
using MPDMA.Models;

namespace MPDMA.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class FilmsController : ControllerBase
    {
        private FilmDAO _filmDAO;

        public FilmsController()
        {
            _filmDAO = new FilmDAO();
        }

        [HttpGet]
        public List<Film> GetFilms()
        {
            return _filmDAO.GetFilms();
        }

        [HttpPost]
        public List<Film> CreateFilm(Film newFilm)
        {
            return _filmDAO.CreateFilm(newFilm);
        }

        [HttpPut("{filmId}")]
        public List<Film> UpdateFilm(Film film, int filmId)
        {
            film.Id = filmId;
            return _filmDAO.UpdateFilm(film);
        }

        [HttpDelete("{filmId}")]
        public List<Film> DeleteFilm(int filmId)
        {
            return _filmDAO.DeleteFilm(filmId);
        }

    }
}
