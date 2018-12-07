﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="StationThree_Index" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../resource/style.css" />
    <script type="application/javascript">
        var correct = []
        function Init()
         {

            var forms = document.getElementsByTagName("form");

             for(var i = 0; i < forms.length; i++)
             {

                var f = forms[i];
                var inputs = f.getElementsByTagName("input")
                if(f.id != "f_2" && f.id != "f_4"&& f.id !="f_5" && f.id != "f_6" && f.id != "f_7" &&f.id != "final") // then rtl
                {
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
                 else
                 {

                    for(var k = inputs.length - 1; k >= 1; k--)
                    {
                        (function()
                         {

                        var inp = inputs[k];
                        var next_inp = inputs[k - 1] ;
                        if(next_inp.disabled)
                        {
                            if( k - 2 < 0)
                            {

                            }
                            else
                                {
                                next_inp = inputs[k - 2];
                                }
                        }
                        inp.addEventListener("input", function()
                                            {

                    if(inp.value != "")
                        {
                            next_inp.focus();
                        }
                        });
                        }());
                    }
                 }
             }
         }
        function Check(elm)
        {

            var inputs = elm.getElementsByTagName("input");
            id = elm.id.split('_')[1]
            answer = (id == "1" ? "חייםנחמןביאליק" : (id == "2"? "01-1933" : (id == "3"? "הכוח" : undefined))); // fu adobe, like realy fu. fu motherfuckers
            if(answer == undefined)
            {
                if(id == "4")
                {
                    answer = "22";
                }
                else if (id == "5")
                {
                    answer="945";
                }
                else if(id == "6")
                {
                    answer = "37";
                }
                else
                {
                    answer="97.50"
                }

            }
            var str =""
            if (id != "2" && id != "4" && id !="5" && id != "6" && id != "7")
            {
                for(var i = 0; i < inputs.length; i++)
                {
                    str += inputs[i].value;
                }
            }
            else
            {
                for (var i = inputs.length - 1; i >= 0; i--)
                {
                    str += inputs[i].value;
                }
            }
            if(str.localeCompare(answer) == 0)
            {
                document.getElementById(id + "_sol").innerHTML = "נכון!";
                for(var i = 0; i < correct.length; i++)
                {
                    if(correct[i] == id)
                    {
                        return;
                    }
                }
                correct.push(id);
            }
            else
            {
                document.getElementById(id + "_sol").innerHTML = "נסו שוב";
            }
            if(correct.length == 7)
            {
                document.getElementById("final").innerHTML = "קוד התשובה של התחנה הוא: 144";
                alert("כל הכבוד פתרתם הכל! קוד התחנה מופיע בתחתית הדף");
            }

        }

         function CheckEnd()
         {
             var f = document.getElementById("final");
             var inputs = f.getElementsByTagName("input");
             var s = "";
             for (var i = inputs.length - 1; i >= 0; i--)
             {
                s += inputs[i].value;
             }
             if(s.localeCompare("144"))
             {
                 document.getElementById("final_div").innerHTML = "נכון, הקוד הוסף למאגר";
                    <% Sql.DoQuery("DataBase.mdb", String.Format("UPDATE Groups SET Station3 = True WHERE groupID='{0}'", (string)Session["groupID"])); %>
             }
             else
             {
                 document.getElementById("final_div").innerHTML = "לא נכון נסו שוב";
             }

         }
    </script>
</head>
    
    <body onload="Init();">
           <img src="../resource/logo.png" class="wide_img"> 
        
        <div class="Center_div" id="Header_div">
            תחנה 3 - משימת דרך - חידון אגד
        </div>
        <p id="HomeIcon" style="top: 26%;">
            <a href="../Welcome/Index.aspx">
                <span class="glyphicon glyphicon-home"></span>
            </a>
            
        </p>
        
        <p class="Content">
            לפניכם משימת דרך - חידון אגד<br>
            כנסו לתחנה 2 מצאו את מיקומה ובדרך פתרו את החידה(תחנה 3)<br>
            כאשר תענו על כל השאלות ותבדקו כל שאלה ושאלה ותקבלו את התשובה "נכון!" על כל שאלה תקבלו את הקוד הסודי.<br>
            הכניסו את הקוד הסודי לתיבת הטקסט בתחתית העמוד.
        </p>
        
        <p class="Content">
            1. מי הגה את השם אגד?<br>
        </p>
              
        <form id="f_1" style="margin-right: 5%; margin-left: 5%;">
            <input type="text" class="mini_txt" id="1_1" maxlength="1">
            <input type="text" class="mini_txt" id="1_2"  maxlength="1">
            <input type="text" class="mini_txt" id="1_3"  maxlength="1">
            <input type="text" class="mini_txt" id="1_4"  maxlength="1">
            <span style = "padding-left: 5%; padding-right: 5%;"></span>
            
            <input type="text" class="mini_txt" id="1_5"  maxlength="1">
            <input type="text" class="mini_txt" id="1_6"  maxlength="1">
            <input type="text" class="mini_txt" id="1_7"  maxlength="1">
            <input type="text" class="mini_txt" id="1_8"  maxlength="1">
            <br>
            <input type="text" class="mini_txt" id="1_9"  maxlength="1">
            <input type="text" class="mini_txt" id="1_10"  maxlength="1">
            <input type="text" class="mini_txt" id="1_11"  maxlength="1">
            <input type="text" class="mini_txt" id="1_12"  maxlength="1">
            <input type="text" class="mini_txt" id="1_13"  maxlength="1">
            <input type="text" class="mini_txt" id="1_14" disabled value="ק">
        </form>
        <input type="button" value="בדוק" class="button_type" onclick="Check(document.getElementById('f_1'));"/>
        <span id="1_sol">
        </span>
        <br>
        
        
        <p class="Content">
            2. החודש והשנה בהם הוקמה אגד?<br>
        </p>
              
        <form id="f_2" style="margin-right: 5%; margin-left: 5%;">
            <input type="text" class="mini_txt" id="2_1" maxlength="1" pattern="[0-9]*">
            <input type="text" class="mini_txt" id="2_2"  maxlength="1" pattern="[0-9]*">
            <input type="text" class="mini_txt" id="2_3"  maxlength="1" pattern="[0-9]*">
            <input type="text" class="mini_txt" id="2_4"  maxlength="1" pattern="[0-9]*">
            <input type="text" class="mini_txt" id="2_5"  maxlength="1" value='-' disabled>
            <input type="text" class="mini_txt" id="2_6"  maxlength="1" pattern="[0-9]*">
            <input type="text" class="mini_txt" id="2_7"  maxlength="1" pattern="[0-9]*">
        </form>
        <input type="button" value="בדוק" class="button_type" onclick="Check(document.getElementById('f_2'));"/>
        <span id="2_sol">
        </span>
        <br>
        <p class="Content">
            3.איזה מבין הארגונים הבאים לא מוזג לאגד:  <br>
            המהיר , הגה, קדימה, שחר, התאחדות הנהגים, הכוח, אקספרס הגליל, שרות עמק הירדן, החולה, המקשר <br>
הערה: מספר התיבות אינו מייצג בהכרח את מספר האותיות בתשובה
        </p>
              
        <form id="f_3" style="margin-right: 5%; margin-left: 5%;">
            <input type="text" class="mini_txt" id="3_1" maxlength="1">
            <input type="text" class="mini_txt" id="3_2"  maxlength="1">
            <input type="text" class="mini_txt" id="3_3"  maxlength="1">
            <input type="text" class="mini_txt" id="3_4"  maxlength="1">
            <input type="text" class="mini_txt" id="3_5"  maxlength="1">
            <input type="text" class="mini_txt" id="3_6"  maxlength="1">
            <input type="text" class="mini_txt" id="3_7"  maxlength="1">
            <input type="text" class="mini_txt" id="3_8"  maxlength="1">
            <input type="text" class="mini_txt" id="3_9"  maxlength="1">
            <input type="text" class="mini_txt" id="3_10"  maxlength="1">
            <input type="text" class="mini_txt" id="3_11"  maxlength="1">
            <input type="text" class="mini_txt" id="3_12"  maxlength="1">
            <input type="text" class="mini_txt" id="3_13"  maxlength="1">
        </form>
        <input type="button" value="בדוק" class="button_type" onclick="Check(document.getElementById('f_3'));"/>
        <span id="3_sol">
        </span>
        <br>
        
        <p class="Content">
            4.במהלך שנת 2017 יצאו מאגד אחרוני האוטובוסים ממוגני הירי ובכך ירד המסך על תקופה בת XX   שנים שבהם הפעילה אגד את האוטובוסים ממוגני הירי בקווי יו"ש וחבל עזה.
        </p>
              
        <form id="f_4" style="margin-right: 5%; margin-left: 5%;">
            <input type="text" class="mini_txt" id="4_1" maxlength="1" pattern="[0-9]*">
            <input type="text" class="mini_txt" id="4_2"  maxlength="1" pattern="[0-9]*">
        </form>
        <input type="button" value="בדוק" class="button_type" onclick="Check(document.getElementById('f_4'));"/>
        <span id="4_sol">
        </span>
                <br>
        <p class="Content">
            5. נכון ל 2016 אגד מפעילה XXX קווי שרות (מידע ממקורות ציבוריים בלבד)  
        </p>
              
        <form id="f_5" style="margin-right: 5%; margin-left: 5%;">
            <input type="text" class="mini_txt" id="5_1" maxlength="1" pattern="[0-9]*">
            <input type="text" class="mini_txt" id="5_2"  maxlength="1" pattern="[0-9]*">
            <input type="text" class="mini_txt" id="5_3"  maxlength="1" pattern="[0-9]*">
        </form>
        <input type="button" value="בדוק" class="button_type" onclick="Check(document.getElementById('f_5'));"/>
        <span id="5_sol">
        </span>
                <br>
        <p class="Content">
            6. נכון ל 2016 חלקה של אגד מכלל מערך התחבורה הציבורית בישראל עומד על ......אחוזים (מידע ממקורות ציבוריים בלבד)  
        </p>
              
        <form id="f_6" style="margin-right: 5%; margin-left: 5%;">
            <span class="Content">%</span>
            <input type="text" class="mini_txt" id="6_1" maxlength="1">
            <input type="text" class="mini_txt" id="6_2"  maxlength="1">
        </form>
        <input type="button" value="בדוק" class="button_type" onclick="Check(document.getElementById('f_6'));"/>
        <span id="6_sol">
        </span>
                <br>    
        <p class="Content">
            7. מה מחיר הנסיעה לשני נוסעים האחד רגיל והשני ותיק מאליפז לחציבה וחזרה , היום 30/05 
        </p>
              
        <form id="f_7" style="margin-right: 5%; margin-left: 5%;">
            <input type="text" class="mini_txt" id="7_1" maxlength="1" pattern="[0-9]*">
            <input type="text" class="mini_txt" id="7_2"  maxlength="1" pattern="[0-9]*">
            <input type="text" class="mini_txt" id="7_3" maxlength="1" value="." disabled>
            <input type="text" class="mini_txt" id="7_4"  maxlength="1" pattern="[0-9]*">
            <input type="text" class="mini_txt" id="7_5"  maxlength="1" pattern="[0-9]*">
        </form>
        <input type="button" value="בדוק" class="button_type" onclick="Check(document.getElementById('f_7'));"/>
        <span id="7_sol">
        </span>
        <br>
        
        <p class="Content" id="final">
            
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
