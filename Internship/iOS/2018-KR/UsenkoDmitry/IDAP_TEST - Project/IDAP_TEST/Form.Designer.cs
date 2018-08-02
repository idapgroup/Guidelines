namespace IDAP_TEST
{
    partial class Form
    {
        /// <summary>
        /// Обязательная переменная конструктора.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Освободить все используемые ресурсы.
        /// </summary>
        /// <param name="disposing">истинно, если управляемый ресурс должен быть удален; иначе ложно.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Код, автоматически созданный конструктором форм Windows

        /// <summary>
        /// Требуемый метод для поддержки конструктора — не изменяйте 
        /// содержимое этого метода с помощью редактора кода.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Form));
            this.textBoxTransform = new System.Windows.Forms.TextBox();
            this.buttonTransform = new System.Windows.Forms.Button();
            this.buttonIconList = new System.Windows.Forms.ImageList(this.components);
            this.comboBoxLanguage = new System.Windows.Forms.ComboBox();
            this.textField = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // textBoxTransform
            // 
            resources.ApplyResources(this.textBoxTransform, "textBoxTransform");
            this.textBoxTransform.BackColor = System.Drawing.SystemColors.ControlLightLight;
            this.textBoxTransform.ForeColor = System.Drawing.Color.Black;
            this.textBoxTransform.Name = "textBoxTransform";
            this.textBoxTransform.ShortcutsEnabled = false;
            this.textBoxTransform.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.textBoxTransform_KeyPress);
            // 
            // buttonTransform
            // 
            resources.ApplyResources(this.buttonTransform, "buttonTransform");
            this.buttonTransform.BackColor = System.Drawing.SystemColors.Control;
            this.buttonTransform.ImageList = this.buttonIconList;
            this.buttonTransform.Name = "buttonTransform";
            this.buttonTransform.UseVisualStyleBackColor = false;
            this.buttonTransform.Click += new System.EventHandler(this.buttonTransform_Click);
            // 
            // buttonIconList
            // 
            this.buttonIconList.ImageStream = ((System.Windows.Forms.ImageListStreamer)(resources.GetObject("buttonIconList.ImageStream")));
            this.buttonIconList.TransparentColor = System.Drawing.Color.Transparent;
            this.buttonIconList.Images.SetKeyName(0, "buttonTransfomBackground.png");
            // 
            // comboBoxLanguage
            // 
            resources.ApplyResources(this.comboBoxLanguage, "comboBoxLanguage");
            this.comboBoxLanguage.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.comboBoxLanguage.Items.AddRange(new object[] {
            resources.GetString("comboBoxLanguage.Items")});
            this.comboBoxLanguage.Name = "comboBoxLanguage";
            this.comboBoxLanguage.SelectedIndexChanged += new System.EventHandler(this.comboBoxLanguage_SelectedIndexChanged);
            this.comboBoxLanguage.Leave += new System.EventHandler(this.comboBoxLanguage_Leave);
            // 
            // textField
            // 
            resources.ApplyResources(this.textField, "textField");
            this.textField.BackColor = System.Drawing.SystemColors.HotTrack;
            this.textField.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.textField.Name = "textField";
            this.textField.ReadOnly = true;
            // 
            // Form
            // 
            resources.ApplyResources(this, "$this");
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackgroundImage = global::IDAP_TEST.Properties.Resources.background;
            this.Controls.Add(this.textField);
            this.Controls.Add(this.comboBoxLanguage);
            this.Controls.Add(this.buttonTransform);
            this.Controls.Add(this.textBoxTransform);
            this.DoubleBuffered = true;
            this.Name = "Form";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.Form1_FormClosing);
            this.Load += new System.EventHandler(this.Form1_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox textBoxTransform;
        private System.Windows.Forms.Button buttonTransform;
        private System.Windows.Forms.ImageList buttonIconList;
        private System.Windows.Forms.ComboBox comboBoxLanguage;
        private System.Windows.Forms.TextBox textField;
    }
}

