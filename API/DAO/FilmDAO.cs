using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using MPDMA.Models;

namespace MPDMA.DAO
{
    public class FilmDAO
    {
        private readonly string connectionString = "Server=.\\sqlexpress;Database=mpdma;Trusted_Connection=True;";

        public List<Film> GetFilms()
        {
            List<Film> films = new List<Film>();

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("SELECT id, name, description, release_year FROM MotionPictures " +
                        "WHERE active = 1", conn);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            Film film = GetFilmFromReader(reader);
                            films.Add(film);
                        }
                    }
                }
            }
            catch (Exception e)
            {

                throw e;
            }
            return films;
        }

        public List<Film> CreateFilm(Film newFilm)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("INSERT INTO MotionPictures (name, description, release_year, active) " +
                        "VALUES(@filmName, @filmDesc, @releaseYear, 1)", conn);
                    cmd.Parameters.AddWithValue("@filmName", $"{newFilm.Name}");
                    cmd.Parameters.AddWithValue("@filmDesc", $"{newFilm.Desc}");
                    cmd.Parameters.AddWithValue("@releaseYear", $"{newFilm.Release}");
                    cmd.ExecuteNonQuery();

                    return GetFilms();
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        public List<Film> UpdateFilm(Film updateFilm)
        {
            try
            {
                using(SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("UPDATE MotionPictures SET name = @filmName, description = @filmDesc, release_year = @releaseYear " +
                        "WHERE id = @filmId", conn);
                    cmd.Parameters.AddWithValue("@filmName", $"{updateFilm.Name}");
                    cmd.Parameters.AddWithValue("@filmDesc", $"{updateFilm.Desc}");
                    cmd.Parameters.AddWithValue("@releaseYear", $"{Convert.ToInt32(updateFilm.Release)}");
                    cmd.Parameters.AddWithValue("@filmId", $"{updateFilm.Id}");

                    cmd.ExecuteNonQuery();

                    return GetFilms();
                }
            }
            catch (Exception e)
            {

                throw e;
            }
        }

        public List<Film> DeleteFilm(int filmId)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("UPDATE MotionPictures SET active = 0 WHERE id = @filmId", conn);
                    cmd.Parameters.AddWithValue("@filmId", $"{filmId}");

                    cmd.ExecuteNonQuery();

                    return GetFilms();
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        private Film GetFilmFromReader(SqlDataReader reader)
        {
            Film f = new Film()
            {
                Id = Convert.ToInt32(reader["id"]),
                Name = Convert.ToString(reader["name"]),
                Desc = Convert.ToString(reader["description"]),
                Release = Convert.ToString(reader["release_year"])
            };

            return f;
        }
    }
}
