﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="StationSix_Index" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../resource/style.css" />
    <script type="application/javascript">
        function Init()
        {
            var form = document.getElementById("1");
            var inputs = form.getElementsByTagName("input");
             for(var k = 0; k < inputs.length - 1; k++)
            {
                (function(){
                var inp = inputs[k];
                var next_inp = inputs[k + 1];
                if(next_inp.disabled)
                {
                    if( k + 2 >= inputs.length)
                    {

                    }
                    else
                        {

                        next_inp = inputs[k + 2];
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

        function Check()
        {
            var inputs = document.getElementById("1").getElementsByTagName("input");
            var arr = ['-','-','-','-','-','-','-','-'];
            for(var i = 0; i < inputs.length; i++)
            {
                var inp = inputs[i];
                var id = inp.id;
                arr[id - 1] = inp.value;
            }
            var value = arr.join('');
            var res = value.localeCompare("מצפההראל");
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

            if(s.localeCompare("543") == 0)
            {
                 document.getElementById("final_div").innerHTML = "נכון, הקוד הוסף למאגר";
                 <% Sql.DoQuery("DataBase.mdb", String.Format("UPDATE Groups SET Station6 = True WHERE groupID='{0}'", (string)Session["groupID"])); %>
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
    
    <body onload="Init();InitEnd()">
           <img src="../resource/logo.png" class="wide_img"> 
        
        <div class="Center_div" id="Header_div">
            תחנה 6 - נקודת תצפית ביער
        </div>
        <p id="HomeIcon" style="top: 26%;">
            <a href="../Welcome/Index.aspx">
                <span class="glyphicon glyphicon-home"></span>
            </a>
            
        </p>
        <p class="Content">
         התחנה הבאה היא מצפור יער מרהיב החולש על פי יערות השפלה כשמו של הקיבוץ שלידו (3 ק"מ) שהוקם על אדמות בית ג'יז.<br>
הכניסה למצפור נמצאת 44 סעו בדרך העפר עד לאורחן הבדואי.<br>
הרמז מחכה לכם על עץ ליד התבליט של דרך בורמה סרקו את הברקוד ובצעו את המשימה.<br>
בתום המשימה שתתבצע בטלפון הנייד תקבלו קוד עם 3 הספרות אותו
הכניסו לתיבת הטקסט בתחתית העמוד<br> 

        </p>
        
        <p class = "Content" id="Check">
            כדי לוודא שאתם נוסעים למקום הנכון הכניסו את שם המקום:
            <br><br>
        </p>
            <form id="1" style="margin-right: 5%; margin-left: 5%;">
                <input type="text" class="mini_txt" id="1">
                <input type="text" class="mini_txt" id="2">
                <input type="text" class="mini_txt" id="3">
                <input type="text" class="mini_txt" disabled value="ה" id="4">
                <span style="margin-left: 5%;"></span>
                <input type="text" class="mini_txt" id="5">
                <input type="text" class="mini_txt" id="6">
                <input type="text" class="mini_txt" id="7">
                <input type="text" class="mini_txt" id="8">

            </form>
        <p>
            <br>
            <input type="button" value="בדוק" onclick="Check()"  class="button_type"/>
            
            <span id="correct_answer"></span>
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
