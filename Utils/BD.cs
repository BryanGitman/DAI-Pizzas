using System.Collections.Generic;
using System.Linq;
using System.Data.SqlClient;
using Dapper;

using Pizzas.API.Models;

namespace Pizzas.API.Utils;

public static class BD
{
    private static string CONNECTION_STRING = @"Persist Security Info=False;User ID=Pizzas;password=Pizzas;Initial Catalog=DAI-Pizzas;Data Source=.;";

    public static List<Pizza> GetAll()
    {
        string sqlQuery;
        List<Pizza> returnList;
        returnList = new List<Pizza>();
        using (SqlConnection db = new SqlConnection(CONNECTION_STRING))
        {
            sqlQuery = "SELECT * FROM Pizzas";
            returnList  = db.Query<Pizza>(sqlQuery).ToList();
        }
        return returnList;
    }

    public static Pizza GetById(int id)
    {
        string sqlQuery;
        Pizza returnEntity = null;
        sqlQuery = "SELECT * FROM Pizzas WHERE Id = @pId";
        using (SqlConnection db = new SqlConnection(CONNECTION_STRING))
        {
            returnEntity  = db.QueryFirstOrDefault<Pizza>(sqlQuery, new { pId = id });
        }
        return returnEntity;
    }

    public static int Insert(Pizza pizza)
    {
        string sqlQuery;
        int intRowsAffected = 0;
        sqlQuery = "INSERT INTO Pizzas (Nombre, LibreGluten, Importe, Descripcion) VALUES (@pNombre, @pLibreGluten, @pImporte, @pDescripcion)";
        using (SqlConnection db = new SqlConnection(CONNECTION_STRING)) 
        {
            intRowsAffected = db.Execute(sqlQuery, new {pnombre = pizza.Nombre, pLibreGluten = pizza.LibreGluten, pImporte = pizza.Importe, pDescripcion = pizza.Descripcion});
        }
        return intRowsAffected;
    }

    public static int UpdateById(Pizza pizza)
    {
        string sqlQuery;
        int intRowsAffected = 0;
        sqlQuery = "UPDATE Pizzas SET Nombre = @pNombre, LibreGluten = @pLibreGluten, Importe = @pImporte, Descripcion = @pDescripcion WHERE Id = @pId";
        using (SqlConnection db = new SqlConnection(CONNECTION_STRING)) 
        {
            intRowsAffected = db.Execute(sqlQuery, new {pnombre = pizza.Nombre, pLibreGluten = pizza.LibreGluten, pImporte = pizza.Importe, pDescripcion = pizza.Descripcion, pId = pizza.Id});
        }
        return intRowsAffected;
    }

    public static int DeleteById(int id)
    {
        string  sqlQuery;
        int intRowsAffected = 0;
        sqlQuery = "DELETE FROM Pizzas WHERE Id = @pId";
        using (SqlConnection db = new SqlConnection(CONNECTION_STRING))
        {
            intRowsAffected = db.Execute(sqlQuery, new { @pId = id });
        }
        return intRowsAffected;
    }
}