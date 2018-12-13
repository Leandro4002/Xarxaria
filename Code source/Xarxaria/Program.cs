﻿/**
* \file      Program.cs
* \author    Johan Voland & Leandro Saraiva Maia
* \version   1.0
* \date      November 11. 2018
* \brief     Main entry of the program
*
* \details   This is the main entry of the program.
* It contains useful contstants like item's name and action id.
* 
* In a possible futur update the item's name may be stocked in the database
*/

#region using
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;
#endregion

namespace Xarxaria
{
    class Program
    {
        #region public static values
        public static string[] itemLists = {
            "goldenCoin"
        };
        public enum actionId { pageChange, addItem, removeItem, changePlayerHp, changePlayerForce, changePlayerArmor, changePlayerAgility, changePlayerLuck};
        public static ConnectionDB connection;
        #endregion

        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main()
        {
            //Instanciate new connection
            connection = new ConnectionDB();

            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(new frmStart());
        }
    }
}
