﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="StationEight_Index" %>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../resource/style.css" />

    <script type="application/javascript">
        function CheckEnd()
          {

              var form = document.getElementById("final");
              var inputs = form.getElementsByTagName("input");
              s = ""
              for(var i = inputs.length - 1; i >= 0; i --)
              {
                  s += inputs[i].value;
              }

              if(s.localeCompare("749") == 0)
              {
                  document.getElementById("final_div").innerHTML = "נכון, הקוד הוסף למאגר";
                  <% Sql.DoQuery("DataBase.mdb", String.Format("UPDATE Groups SET Station8 = True WHERE groupID='{0}'", (string)Session["groupID"])); %>
              }
              else
              {
                  document.getElementById("final_div").innerHTML = "לא נכון נסו שוב";
              }
          }
          function InitEnd()
          {
              var form = document.getElementById("final");
              var inputs = form.getElementsByTagName("input");
               for(var k = inputs.length - 1; k > 0 ; k--)
              {
                  (function(){
                  var inp = inputs[k];
                  var next_inp = inputs[k - 1];
                  if(next_inp.disabled)
                  {
                      if( k - 2 >= inputs.length)
                      {

                      }
                      else
                          {

                          next_inp = inputs[k - 2];
                          }
                  }
                  inp.addEventListener("input", function(event)
                  {

                      if(inp.value != "")
                          {
                      next_inp.focus();
                          }
                  });
                  }());
              }
          }

    </script>
</head>
    
    <body onload="InitEnd();">
           <img src="../resource/logo.png" class="wide_img"> 
        
        <div class="Center_div" id="Header_div">
            תחנה 8 - משימת דרך אחרונה
        </div>
        <p id="HomeIcon" style="top: 26%;">
            <a href="../Welcome/Index.aspx">
                <span class="glyphicon glyphicon-home"></span>
            </a>
            
        </p>
        <p class="Content">
  נקודת סיום המסלול היא מסעדת מוזה במושב שורש משימה דרך זו (תחנה 8) תאפשר לכם לקבל את הקוד האחרון החסר לכם לפענוח צופן הקוד הסופי.
            <br>
<br>
            <b>
חידה:
            </b>
            <br>
אם תחשבו בגימטריה את הסלוגן של אגד (5 מילים) תגיעו למספר תלת ספרתי 
<br>
הכניסו את המספר לתיבת הטקסט בתחתית העמוד
<br>
<br>
כעת שבידכם שמונת המספרים הכנסו לכפתור התכלת בעמוד הבית  "פיצוח הקוד הסופי" <br>
            הכפתור התכלת – פיצוח הקוד הסופי ו.....את משפט הפרס. <br>
<b>הצוות הראשון שיגיע במלואו</b>
            (כל הרכבים שבצוות) למוזה בהר בשורש ויגיש פיסית ראשון את המשפט למנהל המירוץ יזכה בפרס 
<br>
מחכים לכם בשורש                                                                             <br>
            בהצלחה  

        </p>
        
         <div class="Content" style="text-align: center">
            <div style="text-decoration: underline">הקוד הוא: </div>
            <form id="final">
                <input type="text" class="mini_txt" id="final_1" maxlength="1" pattern ="[0-9]*" />
                <input type="text" class="mini_txt" id="final_2" maxlength="1" pattern ="[0-9]*" />
                <input type="text" class="mini_txt" id="final_3" maxlength="1" pattern ="[0-9]*" />
            </form>
            <input type="button" class="button_type" value="בדוק" onclick="CheckEnd();">
            <div id="final_div">
            </div>
        </div>
    </body>
</html>
