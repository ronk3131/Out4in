﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="StationFive_Index" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../resource/style.css" />
    <script type="application/javascript">
        function Check()
        {
            value = document.getElementById("check_input").value;
            res = value.localeCompare("חולדה");
            if ( res == 0 )
            {
                document.getElementById('correct_answer').innerHTML = "נכון!";
            }
            else
            {
                document.getElementById('correct_answer').innerHTML = "לא נכון, נסו שוב";
            }

        }


         function CheckEnd()
        {

            var form = document.getElementById("final");
            var inputs = form.getElementsByTagName("input");
            s = ""
            for(var i = inputs.length - 1; i >= 0; i --)
            {
                s += inputs[i].value;
            }

            if(s.localeCompare("169") == 0)
            {
                 document.getElementById("final_div").innerHTML = "נכון, הקוד הוסף למאגר";
                 <% Sql.DoQuery("DataBase.mdb", String.Format("UPDATE Groups SET Station5 = True WHERE groupID='{0}'", (string)Session["groupID"])); %>
            }
            else
            {
                document.getElementById("final_div").innerHTML = "לא נכון נסו שוב";
            }
        }
        function Init()
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
    <body onload="Init();">
        <img src="../resource/logo.png" class="wide_img"> 
        <div class="Center_div" id="Header_div">
            תחנה 5 - חניון יער
        </div>
        <p id="HomeIcon">
            <a href="../Welcome/Index.aspx">
                <span class="glyphicon glyphicon-home"></span>
            </a>
            
        </p>
        <p class="Content">
            הגיעו אל היער חפשו את הבית שם תפגשו את צוות המירוץ המחכה לכם עם האתגר הבא הוא גם ייתן לכם את הרמזים לתחנה הבאה. 
            
            <br>
            <br>
            <b>רמזים</b>
            
        </p>
        <ul class="Content">
                <li>
                    הרצל אף פעם לא גר בבית שנמצא ביער ולמעשה רק קרוי על שמו.
                </li>
                <li>
                    ואין ספק שיש הבדל גדול בין שם המקום לבין עכבר!  
                </li>
                <li>
                    חוץ מזה זהו היער הנטוע הראשון של הקרן הקיימת לישראל (1907)
                </li>
        </ul>
        
        <p class = "Content" id="Check">
            כדי לוודא שאתם נוסעים למקום הנכון הכניסו את שם המקום:
            <br><br>
            יער <input type="text" class="txt_input" id="check_input" placeholder=".............">
            <br>
            <input type="button" value="בדוק" onclick="Check()"  class="button_type"/>
            
            <span id="correct_answer"></span>
            <br><br><br>
            <span id="end_span">
                כאשר תקבלו את הקוד, הכניסו אותו לתיבת הטקסט בתחתית העמוד.
            </span>
        </p>
        <br>
        
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