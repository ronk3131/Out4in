﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="StationTwo_Index" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta http-equiv="Content-Type" content="text/html, charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../resource/style.css" />
    <style>
    </style>
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
                    if (k + 2 >= inputs.length) {

                    }
                    else {

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
        function Check() {
            var form = document.getElementById("1");
            var inputs = form.getElementsByTagName("input");
            var answer = "נצר-סירני";
            var s = "";
            for (var i = 0; i < inputs.length; i++) {
                s += inputs[i].value;
            }

            if (s.localeCompare(answer) == 0) {
                document.getElementById("answer").innerHTML = "נכון!";
            }
            else {
                document.getElementById("answer").innerHTML = "נסו שוב";
            }
        }

        function CheckEnd() {
            debugger;
            var form = document.getElementById("final");
            var inputs = form.getElementsByTagName("input");
            s = ""
            for (var i = inputs.length - 1; i >= 0; i--) {
                s += inputs[i].value;
            }

            if (s.localeCompare("130") == 0) {
                document.getElementById("final_div").innerHTML = "נכון, הקוד הוסף למאגר";
                <% Sql.DoQuery("DataBase.mdb", String.Format("UPDATE Groups SET Station2 = True WHERE groupID='{0}'", (string)Session["groupID"])); %>
            }
            else {
                document.getElementById("final_div").innerHTML = "לא נכון נסו שוב";
            }
        }
        function InitEnd() {
            var form = document.getElementById("final");
            var inputs = form.getElementsByTagName("input");
            for (var k = inputs.length - 1; k > 0; k--) {
                (function () {
                    var inp = inputs[k];
                    var next_inp = inputs[k - 1];
                    if (next_inp.disabled) {
                        if (k - 2 >= inputs.length) {

                        }
                        else {

                            next_inp = inputs[k - 2];
                        }
                    }
                    inp.addEventListener("input", function (event) {

                        if (inp.value != "") {
                            next_inp.focus();
                        }
                    });
                }());
            }
        }

    </script>
</head>
    
    <body onload="Init();InitEnd();">
           <img src="../resource/logo.png" class="wide_img"> 
        
        <div class="Center_div" id="Header_div">
            הנחיות לתחנה 3 + 2  
        </div>
        <p id="HomeIcon" style="top: 26%;">
            <a href="../Welcome/Index.aspx">
                <span class="glyphicon glyphicon-home"></span>
            </a>
            
        </p>
        <p class="Content">
כל הכבוד הצלחתם לפתור בהצלחה את משימת מוזיאון אגד - תחנה מס' 1  
כעת  אתם יוצאים למצוא את תחנה 2 ובדרך תפתרו את משימת הדרך היא תחנה 3.
<br>
אך ראשית , הנחיות למציאת תחנה 2:
הנקודה הבאה היא עוד נקודה על פי ההיסטוריה של מדינת ישראל בשלבי הקמתה.
מקימיו קראו לו "קיבוץ בוכנוולאד" משם הם הגיעו. עם הזמן שונה השם ל.....
הכנסו לקיבוץ ומצאו את האנדרטה משואה לתקומה. 
<br>

            <p class="Content">
כדי לודא שאתם נוסעים למקום הנכון הכניסו את שם הקיבוץ:
                <br>
            <br>
        </p>
        <form id="1">
            <input type="text" id = "1_1" class="mini_txt" maxlength="1">
            <input type="text" id = "1_2" class="mini_txt" maxlength="1">
            <input type="text" id = "1_3" class="mini_txt" maxlength="1">
            <input type="text" id = "1_4" class="mini_txt" maxlength="1"  disabled value="-">
            <input type="text" id = "1_5" class="mini_txt" maxlength="1">
            <input type="text" id = "1_6" class="mini_txt" maxlength="1">
            <input type="text" id = "1_7" class="mini_txt" maxlength="1">
            <input type="text" id = "1_8" class="mini_txt" maxlength="1">
            <input type="text" id = "1_9" class="mini_txt" maxlength="1">
        </form>
        <input type="button" class="button_type" onclick="Check()" value="בדוק">
        <span id="answer" class="Content">
        </span>
    <p class="Content">
        <br>
                <br>
<b>
הרמז הבא שלכם לתחנה 2 :<br>
   </b>     
נמצא ברדיוס של 50 מטר מהאנדרטה על העץ שליד העץ עם "קן הקוקיה הכחול"
מצאו את המספר (התלת ספרתי) והכניסו אותו לריבוע הקודים ותקבלו הנחיות לתחנה 2.
<br>
        <br>
        <b>
 משימת הדרך – תחנה  3 :<br>
        </b>
לחצו על הכפתור הכתום של התחנה בדף הבית וענו נכון על חידון אגד.
כאשר תענו נכון על כל השאלות – תקבלו קוד עם שלוש ספרות
הכניסו אותו לתיבת הטקסט בתחתית העמוד
<br>
					בהצלחה

        </p>
        
       <br><br>
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
</html>
