using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Welcome_Index : System.Web.UI.Page
{
    public bool[] StationStatus;

    protected void Page_Load(object sender, EventArgs e)
    {
        if ((string)Session["groupID"] == "not logged")
        {
            Response.Redirect("Join.aspx");
        }
        DataTable dt = Sql.ExecuteDataTable("DataBase.mdb", "SELECT * FROM Groups WHERE groupID = '" + Session["groupID"] + "'");

        StationStatus = new bool[dt.Columns.Count - 2];

        for(int i = 0; i < StationStatus.Length; i++)
        {
            StationStatus[i] = (bool)dt.Rows[0][i + 2];
        }
    }
}