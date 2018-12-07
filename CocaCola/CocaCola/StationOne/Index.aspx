﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="StationOne_Index" %>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title></title>
        <meta http-equiv="Content-Type" content="text/html, charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="../resource/style.css" />
        <script type="application/javascript">
            function CheckEnd() {
                debugger;
                var form = document.getElementById("final");
                var inputs = form.getElementsByTagName("input");
                var s = ""

                for (var i = inputs.length - 1; i >= 0; i--) {
                    s += inputs[i].value;
                }

                if (s.localeCompare("341568") == 0) {
                    document.getElementById("final_div").innerHTML = "נכון, הקוד הוסף למאגר";
                    <% Sql.DoQuery("DataBase.mdb", String.Format("UPDATE Groups SET Station1 = True WHERE groupID='{0}'", (string)Session["groupID"])); %>
                }
                else {
                    document.getElementById("final_div").innerHTML = "לא נכון נסו שוב";
                }
            }
            function Init() {
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
    
    <body onload="Init();">
           <img src="../resource/logo.png" class="wide_img" />
        
        <div class="Center_div" id="Header_div">
            תחנה 1 - מוזיאון אגד
        </div>
        <p id="HomeIcon" style="top: 21%;">
            <a href="../Welcome/Index.aspx">
                <span class="glyphicon glyphicon-home"></span>
            </a>
            
        </p>
        <p class="Content">
        ההיסטוריה של אגד שלובה בהיסטוריה של מדינת ישראל ומוזיאון אגד מהווה עדות נפלאה לשילוב. בתחנה זו תצטרכו לזהות 5 אוטובוסים שההיסטוריה שלהם נוגעת להיסטוריה של מדינת ישראל.<br>
זהו כל אוטובוס על פי השאלה מצאו את המספר שלו חברו את כל המספרים כל אחד (כל זוג מספרים או שלשה בנפרד ) למספר אחד.<br>
התוצאה – מספר שש ספרתי יהווה את הקוד הראשון שלכם
הכניסו את הקוד לתיבת הטקסט בתחתית העמוד.
        </p>
        
        <p class="Content">
            <b>חידון מוזיאון אגד</b> <br>
1. אוטובוס מדגם וויט , שימש להובלת נוסעים וציוד בשנים 1947-1949 (מספר 3 ספרתי) <br><br>
2. רכב מסוג זה היה מעורב ברצח נוסעים ע"י מחבלים במעלה עקרבים ליד אילת בשנות ה 50 (מספר 4 ספרתי)  <br><br>
3. אינטרנש על קו סנטה קטרינה =  התייחסו אל שני מספרים בנפרד : דו ספרתי + 3 ספרתי<br><br>
4. האוטובוס ששימש לאיסוף נפגעים וב עדיין נמצאות האלונקות (מספר 6 ספרתי)  <br><br>
5. הלילנד השתתף בהסעת כוחות במלחמת יום הכיפורים ושלום הגליל – שני מספרים – דו ספרתי ו 3 ספרתי <br><br>

        </p>
        <br><br>
        <div class="Content" style="text-align: center">
            <div style="text-decoration: underline">הקוד הוא: </div>
            <form id="final">
                <input type="text" class="mini_txt" id="final_1" maxlength="1" pattern ="[0-9]*" />
                <input type="text" class="mini_txt" id="final_2" maxlength="1" pattern ="[0-9]*" />
                <input type="text" class="mini_txt" id="final_3" maxlength="1" pattern ="[0-9]*" />
                <input type="text" class="mini_txt" id="final_4" maxlength="1" pattern ="[0-9]*" />
                <input type="text" class="mini_txt" id="final_5" maxlength="1" pattern ="[0-9]*" />
                <input type="text" class="mini_txt" id="final_6" maxlength="1" pattern ="[0-9]*" />
            </form>
            <input type="button" class="button_type" value="בדוק" onclick="CheckEnd();">
            <div id="final_div">
            </div>
        </div>
        
    </body>
</html>
