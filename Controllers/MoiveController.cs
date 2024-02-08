using Newtonsoft.Json;
using System;
using System.Data;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using WebApplication1.Models;

namespace WebApplication1.Controllers
{
    
    public class MoiveController : ApiController
    {
        // Instantiate the data access class
        DaClass Objdal = new DaClass();

        // Get movie details by movieId
        [HttpGet]
        [Route("api/GetMovieDetails")]
        public HttpResponseMessage GetMovieDetails(int movieId)
        {
            try
            {
                // Get movie details from the data access layer
                DataTable dt = Objdal.GetMovieDetails(movieId);

                if (dt.Rows.Count > 0)
                {
                    // Serialize DataTable to JSON and return a success response
                    string result = JsonConvert.SerializeObject(dt);
                    return Request.CreateResponse(HttpStatusCode.OK, result);
                }
                else
                {
                    // Return a not found response if no movies found for the given movieId
                    return Request.CreateResponse(HttpStatusCode.NotFound, "No movie found for the provided movieId.");
                }
            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, "Internal server error");
            }
        }

        // Get movies by actorId
        [HttpGet]
        [Route("api/GetActorMovies")]
        public HttpResponseMessage GetActorMovies(int actorId)
        {
            try
            {
                // Get movies by actorId from the data access layer
                DataTable dt = Objdal.GetActorMovies(actorId);

                if (dt.Rows.Count > 0)
                {
                    // Serialize DataTable to JSON and return a success response
                    string result = JsonConvert.SerializeObject(dt);
                    return Request.CreateResponse(HttpStatusCode.OK, result);
                }
                else
                {
                    
                    return Request.CreateResponse(HttpStatusCode.NotFound, "No movies found for the actor.");
                }
            }
            catch (Exception ex)
            {
              
               
                return Request.CreateResponse(HttpStatusCode.InternalServerError, "Internal server error");
            }
        }

        // Get movies by genre
        [HttpGet]
        [Route("api/GetMoviesByGenre")]
        public HttpResponseMessage GetMoviesByGenre(string genre)
        {
            try
            {
                DataTable dt = Objdal.GetMoviesByGenre(genre);

                if (dt.Rows.Count > 0)
                {
                    string result = JsonConvert.SerializeObject(dt);
                    return Request.CreateResponse(HttpStatusCode.OK, result);
                }
                else
                {
                    
                    return Request.CreateResponse(HttpStatusCode.NotFound, $"No movies found for the genre '{genre}'.");
                }
            }
            catch (Exception ex)
            {
              
                return Request.CreateResponse(HttpStatusCode.InternalServerError, "Internal server error");
            }
        }

       
    }
}
