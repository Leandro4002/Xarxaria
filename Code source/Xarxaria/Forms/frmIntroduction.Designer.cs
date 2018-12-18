﻿namespace Xarxaria
{
    partial class frmIntroduction
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmIntroduction));
            this.lblIntroduction = new System.Windows.Forms.Label();
            this.lblPlayerName = new System.Windows.Forms.Label();
            this.lblHealth = new System.Windows.Forms.Label();
            this.lblAgility = new System.Windows.Forms.Label();
            this.richTextBox1 = new System.Windows.Forms.RichTextBox();
            this.cmdStartAventure = new System.Windows.Forms.Button();
            this.numHealth = new System.Windows.Forms.NumericUpDown();
            this.numLuck = new System.Windows.Forms.NumericUpDown();
            this.txtPlayerName = new System.Windows.Forms.TextBox();
            this.numAgility = new System.Windows.Forms.NumericUpDown();
            this.lblLuck = new System.Windows.Forms.Label();
            this.lblDistributePoints = new System.Windows.Forms.Label();
            this.lblDistributePointsValue = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.numHealth)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.numLuck)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.numAgility)).BeginInit();
            this.SuspendLayout();
            // 
            // lblIntroduction
            // 
            this.lblIntroduction.AutoSize = true;
            this.lblIntroduction.BackColor = System.Drawing.Color.Transparent;
            this.lblIntroduction.Font = new System.Drawing.Font("Algerian", 11.25F);
            this.lblIntroduction.ForeColor = System.Drawing.SystemColors.ControlText;
            this.lblIntroduction.Location = new System.Drawing.Point(103, 19);
            this.lblIntroduction.Name = "lblIntroduction";
            this.lblIntroduction.Size = new System.Drawing.Size(109, 16);
            this.lblIntroduction.TabIndex = 0;
            this.lblIntroduction.Text = "Introduction";
            // 
            // lblPlayerName
            // 
            this.lblPlayerName.AutoSize = true;
            this.lblPlayerName.BackColor = System.Drawing.Color.Transparent;
            this.lblPlayerName.Font = new System.Drawing.Font("Algerian", 11.25F);
            this.lblPlayerName.ForeColor = System.Drawing.SystemColors.ControlText;
            this.lblPlayerName.Location = new System.Drawing.Point(32, 237);
            this.lblPlayerName.Name = "lblPlayerName";
            this.lblPlayerName.Size = new System.Drawing.Size(117, 16);
            this.lblPlayerName.TabIndex = 0;
            this.lblPlayerName.Text = "Nom du joueur";
            // 
            // lblHealth
            // 
            this.lblHealth.AutoSize = true;
            this.lblHealth.BackColor = System.Drawing.Color.Transparent;
            this.lblHealth.Font = new System.Drawing.Font("Algerian", 11.25F);
            this.lblHealth.ForeColor = System.Drawing.SystemColors.ControlText;
            this.lblHealth.Location = new System.Drawing.Point(32, 260);
            this.lblHealth.Name = "lblHealth";
            this.lblHealth.Size = new System.Drawing.Size(106, 16);
            this.lblHealth.TabIndex = 0;
            this.lblHealth.Text = "Points de vie";
            // 
            // lblAgility
            // 
            this.lblAgility.AutoSize = true;
            this.lblAgility.BackColor = System.Drawing.Color.Transparent;
            this.lblAgility.Font = new System.Drawing.Font("Algerian", 11.25F);
            this.lblAgility.ForeColor = System.Drawing.SystemColors.ControlText;
            this.lblAgility.Location = new System.Drawing.Point(32, 284);
            this.lblAgility.Name = "lblAgility";
            this.lblAgility.Size = new System.Drawing.Size(65, 16);
            this.lblAgility.TabIndex = 0;
            this.lblAgility.Text = "Agilité";
            // 
            // richTextBox1
            // 
            this.richTextBox1.BackColor = System.Drawing.Color.AntiqueWhite;
            this.richTextBox1.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.richTextBox1.Location = new System.Drawing.Point(12, 49);
            this.richTextBox1.Name = "richTextBox1";
            this.richTextBox1.ReadOnly = true;
            this.richTextBox1.Size = new System.Drawing.Size(285, 140);
            this.richTextBox1.TabIndex = 0;
            this.richTextBox1.TabStop = false;
            this.richTextBox1.Text = resources.GetString("richTextBox1.Text");
            // 
            // cmdStartAventure
            // 
            this.cmdStartAventure.BackColor = System.Drawing.Color.Transparent;
            this.cmdStartAventure.BackgroundImage = global::Xarxaria.Properties.Resources.Simple_Button;
            this.cmdStartAventure.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.cmdStartAventure.FlatAppearance.BorderSize = 0;
            this.cmdStartAventure.FlatAppearance.MouseDownBackColor = System.Drawing.Color.Gold;
            this.cmdStartAventure.FlatAppearance.MouseOverBackColor = System.Drawing.Color.Gold;
            this.cmdStartAventure.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.cmdStartAventure.Font = new System.Drawing.Font("Algerian", 11.25F);
            this.cmdStartAventure.ForeColor = System.Drawing.Color.Gold;
            this.cmdStartAventure.Location = new System.Drawing.Point(71, 337);
            this.cmdStartAventure.Name = "cmdStartAventure";
            this.cmdStartAventure.Size = new System.Drawing.Size(179, 46);
            this.cmdStartAventure.TabIndex = 5;
            this.cmdStartAventure.Text = "Commencer l\'aventure";
            this.cmdStartAventure.UseVisualStyleBackColor = false;
            this.cmdStartAventure.Click += new System.EventHandler(this.cmdStartAventure_Click);
            this.cmdStartAventure.MouseDown += new System.Windows.Forms.MouseEventHandler(this.cmdStartAventure_MouseDown);
            this.cmdStartAventure.MouseLeave += new System.EventHandler(this.cmdStartAventure_MouseLeave);
            // 
            // numHealth
            // 
            this.numHealth.BackColor = System.Drawing.Color.AntiqueWhite;
            this.numHealth.Location = new System.Drawing.Point(158, 257);
            this.numHealth.Name = "numHealth";
            this.numHealth.Size = new System.Drawing.Size(37, 20);
            this.numHealth.TabIndex = 2;
            this.numHealth.ValueChanged += new System.EventHandler(this.numHealth_ValueChanged);
            // 
            // numLuck
            // 
            this.numLuck.BackColor = System.Drawing.Color.AntiqueWhite;
            this.numLuck.Location = new System.Drawing.Point(158, 305);
            this.numLuck.Name = "numLuck";
            this.numLuck.Size = new System.Drawing.Size(37, 20);
            this.numLuck.TabIndex = 4;
            this.numLuck.ValueChanged += new System.EventHandler(this.numLuck_ValueChanged);
            // 
            // txtPlayerName
            // 
            this.txtPlayerName.BackColor = System.Drawing.Color.AntiqueWhite;
            this.txtPlayerName.Location = new System.Drawing.Point(158, 233);
            this.txtPlayerName.Name = "txtPlayerName";
            this.txtPlayerName.Size = new System.Drawing.Size(132, 20);
            this.txtPlayerName.TabIndex = 1;
            this.txtPlayerName.TextChanged += new System.EventHandler(this.txtPlayerName_TextChanged);
            // 
            // numAgility
            // 
            this.numAgility.BackColor = System.Drawing.Color.AntiqueWhite;
            this.numAgility.Location = new System.Drawing.Point(158, 281);
            this.numAgility.Name = "numAgility";
            this.numAgility.Size = new System.Drawing.Size(37, 20);
            this.numAgility.TabIndex = 3;
            this.numAgility.ValueChanged += new System.EventHandler(this.numAgility_ValueChanged);
            // 
            // lblLuck
            // 
            this.lblLuck.AutoSize = true;
            this.lblLuck.BackColor = System.Drawing.Color.Transparent;
            this.lblLuck.Font = new System.Drawing.Font("Algerian", 11.25F);
            this.lblLuck.ForeColor = System.Drawing.SystemColors.ControlText;
            this.lblLuck.Location = new System.Drawing.Point(32, 308);
            this.lblLuck.Name = "lblLuck";
            this.lblLuck.Size = new System.Drawing.Size(64, 16);
            this.lblLuck.TabIndex = 0;
            this.lblLuck.Text = "Chance";
            // 
            // lblDistributePoints
            // 
            this.lblDistributePoints.AutoSize = true;
            this.lblDistributePoints.BackColor = System.Drawing.Color.Transparent;
            this.lblDistributePoints.Font = new System.Drawing.Font("Algerian", 11.25F);
            this.lblDistributePoints.ForeColor = System.Drawing.SystemColors.ControlText;
            this.lblDistributePoints.Location = new System.Drawing.Point(9, 203);
            this.lblDistributePoints.Name = "lblDistributePoints";
            this.lblDistributePoints.Size = new System.Drawing.Size(241, 16);
            this.lblDistributePoints.TabIndex = 0;
            this.lblDistributePoints.Text = "Points restant à distribuer : ";
            // 
            // lblDistributePointsValue
            // 
            this.lblDistributePointsValue.AutoSize = true;
            this.lblDistributePointsValue.BackColor = System.Drawing.Color.Transparent;
            this.lblDistributePointsValue.Font = new System.Drawing.Font("Algerian", 11.25F);
            this.lblDistributePointsValue.Location = new System.Drawing.Point(256, 203);
            this.lblDistributePointsValue.Name = "lblDistributePointsValue";
            this.lblDistributePointsValue.Size = new System.Drawing.Size(17, 16);
            this.lblDistributePointsValue.TabIndex = 0;
            this.lblDistributePointsValue.Text = "0";
            // 
            // frmIntroduction
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackgroundImage = global::Xarxaria.Properties.Resources.rose_des_vents_V3;
            this.ClientSize = new System.Drawing.Size(309, 386);
            this.Controls.Add(this.lblDistributePointsValue);
            this.Controls.Add(this.lblDistributePoints);
            this.Controls.Add(this.lblLuck);
            this.Controls.Add(this.numAgility);
            this.Controls.Add(this.txtPlayerName);
            this.Controls.Add(this.numLuck);
            this.Controls.Add(this.numHealth);
            this.Controls.Add(this.cmdStartAventure);
            this.Controls.Add(this.richTextBox1);
            this.Controls.Add(this.lblAgility);
            this.Controls.Add(this.lblHealth);
            this.Controls.Add(this.lblPlayerName);
            this.Controls.Add(this.lblIntroduction);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedToolWindow;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "frmIntroduction";
            this.Text = "Xarxaria v1.0 - Introduction";
            ((System.ComponentModel.ISupportInitialize)(this.numHealth)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.numLuck)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.numAgility)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lblIntroduction;
        private System.Windows.Forms.Label lblPlayerName;
        private System.Windows.Forms.Label lblHealth;
        private System.Windows.Forms.Label lblAgility;
        private System.Windows.Forms.RichTextBox richTextBox1;
        private System.Windows.Forms.Button cmdStartAventure;
        private System.Windows.Forms.NumericUpDown numHealth;
        private System.Windows.Forms.NumericUpDown numLuck;
        private System.Windows.Forms.TextBox txtPlayerName;
        private System.Windows.Forms.NumericUpDown numAgility;
        private System.Windows.Forms.Label lblLuck;
        private System.Windows.Forms.Label lblDistributePoints;
        private System.Windows.Forms.Label lblDistributePointsValue;
    }
}