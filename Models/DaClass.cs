using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace WebApplication1.Models
{
    public class DaClass
    {
        private string ConnectionString = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;

        public DataTable GetMovieDetails(int movieId)
        {
            DataTable movieDetailsTable = new DataTable();

            using (SqlConnection con = new SqlConnection(ConnectionString))
            {
                try
                {
                    con.Open();

                    string query = @"
                        SELECT M.movie_id, M.title, M.release_date, 
                               D.director_id, D.name AS director_name, 
                               G.genre_id, G.name AS genre_name, 
                               A.actor_id, A.name AS actor_name, 
                               R.review_id, R.comment AS review_text
                        FROM movies M
                        INNER JOIN directors D ON M.director_id = D.director_id
                        INNER JOIN movie_genres MG ON M.movie_id = MG.movie_id
                        INNER JOIN genres G ON MG.genre_id = G.genre_id
                        LEFT JOIN actors AM ON M.movie_id = AM.actor_id
                        LEFT JOIN actors A ON AM.actor_id = A.actor_id
                        LEFT JOIN reviews R ON M.movie_id = R.movie_id
                        WHERE M.movie_id = @MovieId;";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@MovieId", movieId);

                        using (SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd))
                        {
                            dataAdapter.Fill(movieDetailsTable);
                        }
                    }
                }
                catch (Exception ex)
                {
                    // Log the exception
                }
            }

            return movieDetailsTable;
        }

        public DataTable GetActorMovies(int actorId)
        {
            DataTable movieTable = new DataTable();

            using (SqlConnection con = new SqlConnection(ConnectionString))
            {
                try
                {
                    con.Open();

                    string query = @"
                        SELECT M.movie_id, M.Title
                        FROM movies M
                        INNER JOIN actors AM ON M.movie_id = AM.actor_id
                        WHERE AM.actor_id = @ActorId";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@ActorId", actorId);

                        using (SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd))
                        {
                            dataAdapter.Fill(movieTable);
                        }
                    }
                }
                catch (Exception ex)
                {
                    // Log the exception
                    throw; // Rethrow the exception for handling at a higher level
                }
            }

            return movieTable;
        }

        public DataTable GetMoviesByGenre(string name)
        {
            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {
                connection.Open();

                string query = "select a.title as  moivename from movies a join  genres b on a.movie_id=b.genre_id where b.name= @name";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@name", name);

                    using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                    {
                        DataTable dataTable = new DataTable();
                        adapter.Fill(dataTable);

                        return dataTable;
                    }
                }
            }
        }
    }
}
