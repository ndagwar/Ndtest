using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Linq;
using System.Linq;

namespace ExpanseExample
{
    public enum UIMODE
    {
        NEW,
        EDIT,
        VIEW
    }
    public partial class EditExpanse : System.Web.UI.Page
    {
        private Expanse EditingExpanse
        {
            get
            {
                return Session["EditingExpanse"] as Expanse;
            }
            set
            {
                Session["EditingExpanse"] = value;
            }
        }
        public UIMODE UIMode
        {
            get
            {
                if (ViewState["UIMODE"] == null)
                    ViewState["UIMODE"] = new UIMODE();
                return (UIMODE) ViewState["UIMODE"] ;
            }
            set
            {
                ViewState["UIMODE"] = value;
            }
        }

        private int EID
        {
            get
            {
                if (ViewState["EID"] == null)
                    ViewState["EID"] = -1;
                return (int) ViewState["EID"];
            }
            set
            {
                ViewState["EID"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            //Response.Cache.SetCacheability(HttpCacheability.NoCache);
            
            if (!IsPostBack)
            {
                string qsUIMODE = Request.QueryString["UIMODE"];
                if (string.IsNullOrEmpty(qsUIMODE) == false)
                {
                    UIMode = (UIMODE) Enum.Parse(typeof(UIMODE), qsUIMODE);
                    EID = Convert.ToInt32(Request.QueryString["EID"]);
                    LoadExpanse();
                    hdnWindowUIMODE.Value = UIMode.ToString();
                }
                MultiViewExpanse.ActiveViewIndex = 0;
            }
        }

        private void LoadExpanse()
        {
            ExpanseClassesDataContext db = new ExpanseClassesDataContext();
            Expanse exp = db.Expanses.Single(p => p.ID == EID);
            EditingExpanse = exp;

            TextBoxCategory.Text = exp.Category;
            TextBoxDate.Text = exp.Date.ToShortDateString();
            TextBoxAmount.Text = exp.Amount.ToString();
        }

        protected void lnkAddAnother_Click(object sender, EventArgs e)
        {
        }

        protected void btnOkay_Click(object sender, EventArgs e)
        {
            try
            {
                if (UIMode == UIMODE.NEW)
                {
                    AddExpanse();
                }
                else if (UIMode == UIMODE.EDIT)
                {
                    UpdateExpanse();
                }
                MultiViewExpanse.ActiveViewIndex = 1;
                ClientScript.RegisterStartupScript(this.GetType(), "onload", "onSuccess();", true);
            }
            catch
            {
                ClientScript.RegisterStartupScript(this.GetType(), "onload", "onError();", true);
                MultiViewExpanse.ActiveViewIndex = 1;
            }
        }

        private void UpdateExpanse()
        {
            ExpanseClassesDataContext context = new ExpanseClassesDataContext();
            Expanse expanse = context.Expanses.Single(p => p.ID == EID);
            expanse.Amount = Convert.ToDecimal(TextBoxAmount.Text);
            expanse.Category = TextBoxCategory.Text;
            expanse.Date = Convert.ToDateTime(TextBoxDate.Text);
            context.SubmitChanges();
        }

        private void AddExpanse()
        {
            ExpanseClassesDataContext context = new ExpanseClassesDataContext();
            Expanse expanse = new Expanse();
            expanse.Amount = Convert.ToDecimal(TextBoxAmount.Text);
            expanse.Category = TextBoxCategory.Text;
            expanse.Date = Convert.ToDateTime(TextBoxDate.Text);
            context.Expanses.InsertOnSubmit(expanse);
            context.SubmitChanges();
        }
    }
}
