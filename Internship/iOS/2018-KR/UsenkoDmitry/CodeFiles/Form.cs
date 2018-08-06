using System;
using System.Windows.Forms;

namespace IDAP_TEST
{
    public partial class Form : System.Windows.Forms.Form
    {
        public Form()
        {
            if (!String.IsNullOrEmpty(Properties.Settings.Default.Language))
            {
                System.Threading.Thread.CurrentThread.CurrentUICulture =
                     System.Globalization.CultureInfo.GetCultureInfo(Properties.Settings.Default.Language);
                System.Threading.Thread.CurrentThread.CurrentCulture =
                    System.Globalization.CultureInfo.GetCultureInfo(Properties.Settings.Default.Language);
            }
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            comboBoxLanguage.DataSource = new System.Globalization.CultureInfo[]
            {
                System.Globalization.CultureInfo.GetCultureInfo("en-US"),
                System.Globalization.CultureInfo.GetCultureInfo("uk-UA"),
                System.Globalization.CultureInfo.GetCultureInfo("de-DE")
            };
            comboBoxLanguage.DisplayMember = "NativeName";
            comboBoxLanguage.ValueMember = "Name";
            if (!String.IsNullOrEmpty(Properties.Settings.Default.Language))
            {
                comboBoxLanguage.SelectedValue = Properties.Settings.Default.Language;
            }
        }

        private void buttonTransform_Click(object sender, EventArgs e)
        {
            if (textBoxTransform.Text != "")
            {
                Number.convertNumberToClasses(Int64.Parse(textBoxTransform.Text));
                if (System.Threading.Thread.CurrentThread.CurrentUICulture.Name == "uk-UA")
                 {
                    NumberToOrdinalUa ua = new NumberToOrdinalUa();
                    textField.Text = ua.convert();
                }
                else if (System.Threading.Thread.CurrentThread.CurrentUICulture.Name == "de-DE")
                {
                    NumberToOrdinalDe de = new NumberToOrdinalDe();
                    textField.Text = de.convert();
                }
                else
                {
                    NumberToOrdinalEng eng = new NumberToOrdinalEng();
                    textField.Text = eng.convert();
                }
            }
            else MessageBox.Show(LanguageSettings.messageBoxErrText, LanguageSettings.messageBoxErrTitle, MessageBoxButtons.OK, MessageBoxIcon.Error);
        }

        private void textBoxTransform_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!Char.IsDigit(e.KeyChar) && e.KeyChar != 8) // 8 - keycode backspace
            {
                e.Handled = true;
            }
        }

        private void comboBoxLanguage_Leave(object sender, EventArgs e)
        {
            if (comboBoxLanguage.SelectedValue.ToString() != Properties.Settings.Default.Language)
            {
                DialogResult result = MessageBox.Show(LanguageSettings.messageBoxConfirmText, LanguageSettings.messageBoxConfirmTitle, MessageBoxButtons.YesNoCancel, MessageBoxIcon.Question);
                if (result == DialogResult.Cancel)
                {
                    comboBoxLanguage.SelectedValue = Properties.Settings.Default.Language;
                }
                else if (result == DialogResult.Yes)
                {
                    Application.Restart();
                }
            }
        }

        private void comboBoxLanguage_SelectedIndexChanged(object sender, EventArgs e)
        {
            textBoxTransform.Focus();
        }

        private void Form1_FormClosing(object sender, FormClosingEventArgs e)
        {
            Properties.Settings.Default.Language = comboBoxLanguage.SelectedValue.ToString();
            Properties.Settings.Default.Save();
        }
    }
}
