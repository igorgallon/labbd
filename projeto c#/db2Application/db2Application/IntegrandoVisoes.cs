using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using IBM.Data.DB2;
using Microsoft.VisualBasic;


namespace db2Application
{
    public partial class IntegrandoVisoes : Form
    {
        public IntegrandoVisoes()
        {
            InitializeComponent();
        }

        string[][] matrizParams;


        DB2Connection _con;
        DataTable Table;

        private void connection()
        {
            #region senha
            _con = new DB2Connection("User ID=db2admin;Password=123;Server=localhost;Database=DIGRA;Current Schema=DB2ADMIN");
            _con.Open();
            #endregion


        }

        private void tablesandviews(string selecionado)
        {
            try
            {
                Table = new DataTable("TestTable");
                using (DB2Command _cmd = new DB2Command("SELECT * FROM " + selecionado, _con))
                {
                    DB2DataAdapter _dap = new DB2DataAdapter(_cmd);
                    _dap.Fill(Table);
                    dataGridView1.DataSource = Table;
                }
            }
            catch { }
        }

        private void executeProcedure(string procname, string[] parametros)
        {
            try
            {
                string parametrosParsing = "";
                foreach (string singleparam in parametros)
                {
                    parametrosParsing += '\'' + singleparam + '\'' + ", ";
                }
                parametrosParsing = parametrosParsing.Substring(0, parametrosParsing.Length - 2);
                using (DB2Command _cmd = new DB2Command("CALL " + procname + "(" + parametrosParsing + ")", _con))
                {
                    _cmd.ExecuteNonQuery();
                    MessageBox.Show("Comando executado!");
                }
            }
            catch
            {
                MessageBox.Show("Comando não executado!");
            }
        }

        private void closeconnection()
        {
            _con.Close();
        }


        private void Form1_Load(object sender, EventArgs e)
        {
            string[] vetortabelas = new string[36]{"TURMA","CONSELHO","CONSELHODEDEPARTAMENTO","CURSO","DEPARTAMENTO","DISCIPLINA","DOCENTE","DOCENTE_CARGO_ADMINISTRATIVO",
                "MEMBRO","PESSOA","PLANODEENSINO","REQUISITOS","REVISAO","SERVIDOR","TAS","TURMA","TURMAHORARIO","ATIVIDADE","CALENDARIO","CONSELHO","CONSELHODEDEPARTAMENTO",
                "DISCENTE","DISCENTE_CURSOU_TURMA","DISCENTE_EAD","DISCENTE_INCREVE_TURMA","DISCENTE_PRESENCIAL","ENADE","ENADE_AVALIA_CURSO","ITEM","ITEM_DE_PAUTA","PROPOE",
                "RECESSO","RECONHECIMENTO","REQUISITOS","REUNIAO","VISITA"};
            string[] vetorviews = new string[13]{"CALENDARIOVIEW","REUNIAO_COM_PAUTAS","V_APROVACOES_POR_MEMBRO","V_PROPOSICOES_DO_ANO_CORRENTE",
            "V_PROPOSICOES_DO_MES_CORRENTE","VATIVIDADE","VCONTATOSERVIDOR","VDISCIPLINASEMOFERTA","VDOCENTECARGOADMINISTRATIVO","VHISTORICOPLANOENSINO","VPLANODEENSINO",
            "VRECESSO","VTURMAHORARIOINCONSISTENTE"};
            string[] vetorprocedures = new string[5] { "ADICIONAMEMBROCONSELHO", "ALTERAESTADOPLANODEENSINO", "NOVOCONSELHO", "PINSERESERVIDOR", "PREMOVEDISCIPLINA" };
            string[] vetorfunctions = new string[5] { "APROVACAO_PLANO_ENSINO_DOCENTE", "TIPO_DOCENTES_PORCENTAGEM", "MEDIA_CREDITOS_PRATICOS_DISCIPLINA", "QUANTIDADE_DISCIPLINA_DEPARTAMENTO", "DISCIPLINA_TEM_QUANTOS_REQUISITOS" };


            matrizParams = new string[10][]; //10 procedures e functions
            //PARAMETROS DAS PROCEDURES
            matrizParams[0] = new string[3] { "VAL_SIAPE", "VAL_CONSELHO", "VAL_PORTARIA" }; //nome da funcao + parametros
            matrizParams[1] = new string[7] { "SIAPE_P", "NOVO_ESTADO", "NOME_DISCIPLINA", "LETRA", "ANO", "SEMESTRE", "PARECER" };
            matrizParams[2] = new string[2] { "VAL_TIPO", "SIGLA" };
            matrizParams[3] = new string[6] { "SIAPE","NOME","POSICAO","TIPO_DOCENTE","CPF","TIPO_SERVIDOR" };
            matrizParams[4] = new string[1] { "CODIGODADISCIPLINA" };
            //PARAMETROS DAS FUNCTIONS
            matrizParams[5] = new string[1] { "PAR_NOME" }; //nome da funcao + parametros
            matrizParams[6] = new string[1] { "VAL_TIPO_DOCENTE" };
            matrizParams[7] = null;
            matrizParams[8] = new string[1] { "SEI LA" };
            matrizParams[9] = new string[1] { "procedure que falta" };


            cmb_tabelas.Items.AddRange(vetortabelas);
            cmb_views.Items.AddRange(vetorviews);
            cmb_procedures.Items.AddRange(vetorprocedures);
            connection();

            btnExecutaProc.Text = "Executa Procedure";

        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            cmb_views.Text = "";
            tablesandviews(cmb_tabelas.Text);
            lblTitulo.Text = "Tabela " + cmb_tabelas.Text;
            
        }

        private void comboBox2_SelectedIndexChanged(object sender, EventArgs e)
        {
            cmb_tabelas.Text = "";
            tablesandviews(cmb_views.Text);
            lblTitulo.Text = "View " + cmb_views.Text;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string mensagemUsuario = "Insira os parametros necessários separados por ponto e virgula\n";
            foreach (string parametro in matrizParams[cmb_procedures.SelectedIndex])
            {
                mensagemUsuario += parametro + "\n";
            }
            string input = Interaction.InputBox(mensagemUsuario, cmb_procedures.Text, "Digite sua entrada aqui", -1, -1);
            string[] parametros = input.Split(';');
            executeProcedure(cmb_procedures.Text, parametros);
        }

        private void dataGridView1_CellContentClick_1(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            foreach (DataGridViewRow item in this.dataGridView1.SelectedRows)
            {
                
                try
                {
                    using (DB2Command _cmd = new DB2Command("DELETE FROM VDOCENTECARGOADMINISTRATIVO WHERE SIAPE = \'" + item.Cells[0].Value.ToString() + 
                        "\' AND INICIODOMANDATO = \'" + Convert.ToDateTime(item.Cells[3].Value.ToString()).ToString("yyyy-MM-dd") + '\''))
                        //'11/1/2015 12:00:00 AM'
                    {
                        _cmd.ExecuteNonQuery();
                        MessageBox.Show("Comando executado!");
                    }
                }
                catch
                {
                    MessageBox.Show("Comando não executado!");
                }
            }
        }
    }
}