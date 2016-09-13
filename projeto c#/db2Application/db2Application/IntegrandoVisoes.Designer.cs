namespace db2Application
{
    partial class IntegrandoVisoes
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
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.btnExecutaProc = new System.Windows.Forms.Button();
            this.cmb_tabelas = new System.Windows.Forms.ComboBox();
            this.cmb_views = new System.Windows.Forms.ComboBox();
            this.cmb_procedures = new System.Windows.Forms.ComboBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.lblTitulo = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.SuspendLayout();
            // 
            // dataGridView1
            // 
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Location = new System.Drawing.Point(55, 95);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.Size = new System.Drawing.Size(638, 324);
            this.dataGridView1.TabIndex = 0;
            this.dataGridView1.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView1_CellContentClick_1);
            // 
            // btnExecutaProc
            // 
            this.btnExecutaProc.Location = new System.Drawing.Point(229, 471);
            this.btnExecutaProc.Name = "btnExecutaProc";
            this.btnExecutaProc.Size = new System.Drawing.Size(133, 23);
            this.btnExecutaProc.TabIndex = 1;
            this.btnExecutaProc.Text = "button1";
            this.btnExecutaProc.UseVisualStyleBackColor = true;
            this.btnExecutaProc.Click += new System.EventHandler(this.button1_Click);
            // 
            // cmb_tabelas
            // 
            this.cmb_tabelas.FormattingEnabled = true;
            this.cmb_tabelas.Location = new System.Drawing.Point(53, 55);
            this.cmb_tabelas.Name = "cmb_tabelas";
            this.cmb_tabelas.Size = new System.Drawing.Size(224, 21);
            this.cmb_tabelas.TabIndex = 3;
            this.cmb_tabelas.SelectedIndexChanged += new System.EventHandler(this.comboBox1_SelectedIndexChanged);
            // 
            // cmb_views
            // 
            this.cmb_views.FormattingEnabled = true;
            this.cmb_views.Location = new System.Drawing.Point(501, 55);
            this.cmb_views.Name = "cmb_views";
            this.cmb_views.Size = new System.Drawing.Size(190, 21);
            this.cmb_views.TabIndex = 4;
            this.cmb_views.SelectedIndexChanged += new System.EventHandler(this.comboBox2_SelectedIndexChanged);
            // 
            // cmb_procedures
            // 
            this.cmb_procedures.FormattingEnabled = true;
            this.cmb_procedures.Location = new System.Drawing.Point(53, 473);
            this.cmb_procedures.Name = "cmb_procedures";
            this.cmb_procedures.Size = new System.Drawing.Size(170, 21);
            this.cmb_procedures.TabIndex = 5;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(50, 39);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(45, 13);
            this.label1.TabIndex = 7;
            this.label1.Text = "Tabelas";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(498, 39);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(35, 13);
            this.label2.TabIndex = 8;
            this.label2.Text = "Views";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(53, 457);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(61, 13);
            this.label3.TabIndex = 9;
            this.label3.Text = "Procedures";
            // 
            // lblTitulo
            // 
            this.lblTitulo.AutoSize = true;
            this.lblTitulo.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblTitulo.Location = new System.Drawing.Point(51, 9);
            this.lblTitulo.Name = "lblTitulo";
            this.lblTitulo.Size = new System.Drawing.Size(149, 25);
            this.lblTitulo.TabIndex = 11;
            this.lblTitulo.Text = "VISÃO ATUAL";
            this.lblTitulo.TextAlign = System.Drawing.ContentAlignment.TopCenter;
            // 
            // IntegrandoVisoes
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(762, 520);
            this.Controls.Add(this.lblTitulo);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.cmb_procedures);
            this.Controls.Add(this.cmb_views);
            this.Controls.Add(this.cmb_tabelas);
            this.Controls.Add(this.btnExecutaProc);
            this.Controls.Add(this.dataGridView1);
            this.Name = "IntegrandoVisoes";
            this.Text = "Demonstrativo do BD";
            this.Load += new System.EventHandler(this.Form1_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.Button btnExecutaProc;
        private System.Windows.Forms.ComboBox cmb_tabelas;
        private System.Windows.Forms.ComboBox cmb_views;
        private System.Windows.Forms.ComboBox cmb_procedures;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label lblTitulo;
    }
}

