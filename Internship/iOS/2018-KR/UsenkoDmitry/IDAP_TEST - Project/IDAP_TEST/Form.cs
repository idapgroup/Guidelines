using System;
using System.Windows.Forms;

namespace IDAP_TEST
{
    public partial class Form : System.Windows.Forms.Form
    {
        // Equal null before Form_Load. After Form_Load one of them will be created
        NumberToOrdinalUa ua;
        NumberToOrdinalEng eng;
        NumberToOrdinalDe de;

        public Form()
        {
            switch (!String.IsNullOrEmpty(Properties.Settings.Default.Language))
            {
                case true:
                    System.Threading.Thread.CurrentThread.CurrentUICulture =
                         System.Globalization.CultureInfo.GetCultureInfo(Properties.Settings.Default.Language);
                    System.Threading.Thread.CurrentThread.CurrentCulture =
                        System.Globalization.CultureInfo.GetCultureInfo(Properties.Settings.Default.Language);
                    break;
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
            switch (!string.IsNullOrEmpty(Properties.Settings.Default.Language))
            {
                case true:
                    comboBoxLanguage.SelectedValue = Properties.Settings.Default.Language;
                    break;
            }
            // One object per launch
            switch (System.Threading.Thread.CurrentThread.CurrentUICulture.Name)
            {
                case "uk-UA":
                    ua = new NumberToOrdinalUa();
                    break;
                case "de-DE":
                    de = new NumberToOrdinalDe();
                    break;
                default:
                    eng = new NumberToOrdinalEng();
                    break;
            }
        }

        private void buttonTransform_Click(object sender, EventArgs e)
        {
            switch (!string.IsNullOrEmpty(textBoxTransform.Text))
            {
                case true:
                    Number.convertNumberToClasses(Int64.Parse(textBoxTransform.Text));
                    switch (System.Threading.Thread.CurrentThread.CurrentUICulture.Name)
                    {
                        case "uk-UA":
                            textField.Text = ua.convert();
                            break;
                        case "de-DE":
                            textField.Text = de.convert();
                            break;
                        default:
                            textField.Text = eng.convert();
                            break;
                    }
                    break;
                case false:
                    MessageBox.Show(LanguageSettings.messageBoxErrText, LanguageSettings.messageBoxErrTitle, MessageBoxButtons.OK, MessageBoxIcon.Error);
                    break;
            }
        }

        private void textBoxTransform_KeyPress(object sender, KeyPressEventArgs e)
        {
            switch (!Char.IsDigit(e.KeyChar) && e.KeyChar != 8) // 8 - keycode backspace
            {
                case true:
                    e.Handled = true;
                    break;
            }
        }

        private void comboBoxLanguage_Leave(object sender, EventArgs e)
        {
            switch (comboBoxLanguage.SelectedValue.ToString() != Properties.Settings.Default.Language)
            {
                case true:
                    DialogResult result = MessageBox.Show(LanguageSettings.messageBoxConfirmText, LanguageSettings.messageBoxConfirmTitle, MessageBoxButtons.YesNoCancel, MessageBoxIcon.Question);
                    switch (result)
                    {
                        case DialogResult.Cancel:
                            comboBoxLanguage.SelectedValue = Properties.Settings.Default.Language;
                            break;
                        case DialogResult.Yes:
                            Application.Restart();
                            break;
                    }
                    break;
            }
        }

        private void comboBoxLanguage_SelectedIndexChanged(object sender, EventArgs e)
        {
            textBoxTransform.Focus();
        }

        private void Form1_FormClosing(object sender, FormClosingEventArgs e)
        {
            //Saving to settings file
            Properties.Settings.Default.Language = comboBoxLanguage.SelectedValue.ToString();
            Properties.Settings.Default.Save();
        }
    }
}
