using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GreetingCardConsoleApp
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Getting connection...");
            String connectionString = "Server=sql16appdev;Database=GCDB;User Id=ww;Password=Aa!123456;Encrypt=true; TrustServerCertificate=True";
            SqlConnection connection = new SqlConnection(connectionString);
            try
            {
                Console.WriteLine("Opening connection...");
                connection.Open();
                Console.WriteLine("Connection successfull...");

                StringBuilder stringBuilder = new StringBuilder();
                string procedureName = "GetAllUsers";

                using (SqlCommand command = new SqlCommand(procedureName, connection))
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        int userNumber = 1;
                        while (reader.Read())
                        {
                            stringBuilder.AppendLine($"User {userNumber++}: UserID: {reader["UserID"]}, UserName: {reader["UserName"]}, Email: {reader["Email"]}, Password: {reader["Password"]}");
                        }

                        Console.WriteLine(stringBuilder.ToString());
                        Console.WriteLine($"Total number of rows: {userNumber - 1}");
                    }
                }
            

            }
            catch (Exception ex)
            {
                Console.WriteLine("Error" + ex.Message);
            }
            Console.Read();
        }
    }
}
