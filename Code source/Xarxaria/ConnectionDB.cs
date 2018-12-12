/**
 * \file      ConnectionDB.cs
 * \author    Johan Voland
 * \version   1.0
 * \date      November 28. 2018
 * \brief     Set of methods to interact with the database
 *
 * \details   This file contains all the necessary attributes and methods to interact with the database.
 */

#region using
using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Threading.Tasks;
#endregion

namespace Xarxaria
{
    class ConnectionDB
    {
        #region private attributes
        //Object needed for database operation
        SqlConnection sqlConnection;
        #endregion

        #region constructor
        /// <summary>
        /// Connection to the DB in the constructor
        /// Uses the "xarxariaLogin" user in the "XarxariaDB" database
        /// </summary>
        public ConnectionDB()
        {
            string connectionString = "Data Source=localhost; Initial Catalog=XarxariaDB; User ID=xarxariaLogin; Password=Pa$$w0rd";
            sqlConnection = new SqlConnection(connectionString);
        }
        #endregion

        #region Add query
        /// <summary>
        /// Add a player in the database
        /// </summary>
        /// <param name="name">Name of the player</param>
        /// <param name="hp">Number of Health Points</param>
        /// <param name="force">Number of force</param>
        /// <param name="agility">Number of force</param>
        /// <param name="luck">Number of force</param>
        /// <param name="idInventory">Inventory id of the player</param>
        public void AddPlayer(string name, int hp, int force, int agility, int luck, int idInventory)
        {
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "INSERT INTO Player (pv, force, armor ,agility, name, idActualPage, idInventory) VALUES ("+hp+", "+force+", "+1+", "+agility+", "+name+", "+1+", "+idInventory+")";
            cmd.CommandType = CommandType.Text;
            cmd.Connection = sqlConnection;

            sqlConnection.Open();

            cmd.ExecuteNonQuery();

            sqlConnection.Close();
        }
        #endregion

        #region Select query
        /// <summary>
        /// Get all the player values from the database
        /// </summary>
        /// <param name="playerId"></param>
        /// <returns>Player object with the values in the database</returns>
        public Player GetPlayer(int playerId)
        {
            SqlCommand cmd = new SqlCommand();
            SqlDataReader reader;
            Player selectedPlayer = new Player();
            Inventory playerInventory = GetInventory(selectedPlayer.IdInventory);

            cmd.CommandText = "SELECT * FROM Player WHERE id = " + playerId;
            cmd.CommandType = CommandType.Text;
            cmd.Connection = sqlConnection;

            sqlConnection.Open();

            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                //Get all data of the player
                int id = int.Parse(reader["id"].ToString());
                int pv = int.Parse(reader["pv"].ToString());
                int force = int.Parse(reader["force"].ToString());
                int agility = int.Parse(reader["agility"].ToString());
                int armor = int.Parse(reader["armor"].ToString());
                int luck = int.Parse(reader["luck"].ToString());
                string name = reader["name"].ToString();
                int idActualPage = int.Parse(reader["idActualPage"].ToString());
                int idInventory = int.Parse(reader["idInventory"].ToString());
                selectedPlayer = new Player(id, pv, force, agility, armor, luck, name, idActualPage, idInventory, playerInventory);
            }
            
            sqlConnection.Close();

            return selectedPlayer;
        }

        /// <summary>
        /// Get inventory values according to Id
        /// </summary>
        /// <param name="idInventory"></param>
        /// <returns>Inventory object with the value in the database</returns>
        public Inventory GetInventory(int idInventory)
        {
            SqlCommand cmd = new SqlCommand();
            SqlDataReader reader;
            Inventory selectedInventory = new Inventory();

            cmd.CommandText = "SELECT * FROM Inventory WHERE id = " + idInventory;
            cmd.CommandType = CommandType.Text;
            cmd.Connection = sqlConnection;

            sqlConnection.Open();

            reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                int[] inventoryValues = new int[Program.itemLists.Length];

                //Get all data of the inventroy
                for (int i = 0; i < Program.itemLists.Length - 1; i++)
                {
                    inventoryValues[i] = int.Parse(reader[Program.itemLists[i]].ToString());
                }

                //Create a new inventory and give it the readed values
                selectedInventory = new Inventory(inventoryValues);
            }

            sqlConnection.Close();

            return selectedInventory;
        }

        /// <summary>
        /// Get page values according to Id
        /// </summary>
        /// <param name="idPage"></param>
        /// <returns>Page object with the value in the database</return
        public Page GetPage (int idPage)
        {
            Page readedPage = new Page();

            SqlCommand cmd = new SqlCommand();
            SqlDataReader reader;

            cmd.CommandText = "SELECT * FROM Page WHERE id = " + idPage;
            cmd.CommandType = CommandType.Text;
            cmd.Connection = sqlConnection;

            sqlConnection.Open();

            reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                readedPage = new Page(reader["title"].ToString(), reader["text"].ToString(), reader["image"].ToString());
            }

            sqlConnection.Close();

            return readedPage;
        }
        #endregion
    }
}
