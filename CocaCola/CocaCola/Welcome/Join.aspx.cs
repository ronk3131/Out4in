using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Welcome_Join : System.Web.UI.Page
{
    public string[] usedGroupID;
    protected void Page_Load(object sender, EventArgs e)
    {
        DataTable dt = Sql.ExecuteDataTable("DataBase.mdb", "SELECT groupID FROM Groups");
        usedGroupID = new string[dt.Rows.Count];
        for (int i = 0; i < usedGroupID.Length; ++i)
        {
            usedGroupID[i] = (string)dt.Rows[i][0];
        }
    }

    protected void groupIDbutton_Click(object sender, EventArgs e)
    {
        if (!Sql.IsExist("DataBase.mdb", "SELECT groupID FROM Groups WHERE groupID='" + groupID.Value + "'"))
        {
            Sql.DoQuery("DataBase.mdb", String.Format("INSERT INTO Groups(groupID, groupPassword) VALUES('{0}', '{1}')", groupID.Value, groupPass.Value));
            Session["groupID"] = groupID.Value;
            Response.Redirect("Index.aspx");

        }
        else if (Sql.IsExist("DataBase.mdb", "SELECT groupID FROM Groups WHERE groupID='" + groupID.Value + "' AND groupPassword='" + groupPass.Value + "'"))
        {
            Session["groupID"] = groupID.Value;
            Response.Redirect("Index.aspx");
        }
        else
        {
            Response.Write("<script> alert('Incorrect Password.') </script>");
        }
    }
}