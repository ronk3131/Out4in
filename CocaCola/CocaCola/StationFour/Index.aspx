﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="StationFour_Index" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../resource/style.css" />
    <style>
        select {
            background-color: white;
            border: 0;
            border-bottom: 1px solid black;
            width: 100%;
            text-align: center;
        }

        option {
            text-align: center;
        }
    </style>
    <script type="application/javascript">
        var correct = ["True", "True", "False", "False", "False", "False", "False", "True", "False", "False", "False", "False", "True", "False", "True", "False", "False", "True", "True", "False", "False"]
        function Check()
        {
            debugger;
            var inp = document.getElementsByTagName("select");
            var corr = 0;
            for(var i = 0; i < inp.length; i++)
            {
                var k = inp[i];
                var id = k.id.split("_")[1];
                if(k.value.localeCompare(correct[id*1 - 1]) == 0)
                {
                    corr += 1;
                }


            }

            if(corr == correct.length)
            {
                document.getElementById("answer").innerHTML = "כל הכבוד! הקוד הסודי הוא:  669 ";
            }
            else
            {
                document.getElementById("answer").innerHTML = "לא נכון נסו שוב";
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

            if(s.localeCompare("669") == 0)
            {
                 document.getElementById("final_div").innerHTML = "נכון, הקוד הוסף למאגר";
                 <% Sql.DoQuery("DataBase.mdb", String.Format("UPDATE Groups SET Station4 = True WHERE groupID='{0}'", (string)Session["groupID"])); %>
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
            תחנה 4 - משימת דרך 
חידון חטיבת המחשוב 

        </div>
        <p id="HomeIcon" style="top: 28%;">
            <a href="../Welcome/Index.aspx">
                <span class="glyphicon glyphicon-home"></span>
            </a>
            
        </p>
        <p class="Content">
          מה אתם יודעים עליכם ? <br>
במידה ותענו נכון על השאלות תוכלו לקבל את קוד מספר 4 . <br>
הכניסו את קוד תחנה ארבע לתיבת הטקסט בתחתית העמוד
        </p>
    
        
        <p class="Content">
            הסבת מערכות המידע להסכם השכר החדש באגד: משימות הוגדרו במסגרת התכנית לפיתוח והתאמת המערכות להסכם השכר קיימות מעל 47 משימות
            <br>
            <select id="select_1">
                <option value="True">נכון</option>
                <option value="False">לא נכון</option>
            </select>
            
            
        </p>
        <br>
                
        <p class="Content">
            שאלה 2:
                   ולידטור דור ב': ולידטור דור ב יכלול את היכולות הבאות: קריאת כרטיס קליפסו, קריאת ברקוד, קריאת כרטיסי אשראי.
            
            <select id="select_2">
                <option value="True">נכון</option>
                <option value="False">לא נכון</option>
            </select>
            
            
        </p>
            <br>    
        <p class="Content">
            שאלה 3:
              אפליקצית כירטוס לנוסע בסלולר: תאפשר גם רכש ערך צבור מיד בהפעלתה.
            <select id="select_3">
                <option value="True">נכון</option>
                <option value="False">לא נכון</option>
            </select>
            
            
        </p>
            <br>    
        <p class="Content">
            שאלה 4:
            אפליקצית אגד לנוסע: מאפשרת לקבל תכנון מסע (מוצא / יעד) של כלל המפעילים.
            <select id="select_4">
                <option value="True">נכון</option>
                <option value="False">לא נכון</option>
            </select>
            
            
        </p>
            <br>    
        <p class="Content">
            שאלה 5:
            אפליקציה סלולרית לעובדי המוסך: האפליקציה מופעלת בסלולר של חברת  APPLE
            <select id="select_5">
                <option value="True">נכון</option>
                <option value="False">לא נכון</option>
            </select>
            
            
        </p>
            <br>    
        <p class="Content">
            שאלה 6:
            מערך מידע חדש (BI): דו"חות REPORTING מהווים חלק ממערך הBI  החדש
            <select id="select_6">
                <option value="True">נכון</option>
                <option value="False">לא נכון</option>
            </select>
            
            
        </p>
            <br>    
        <p class="Content">
            שאלה 7:
            החלפת ספק התקשורת לHOT: במסגרת ההסכם החדש, חברת HOT תספק לאגד גם שירותי טלויזיה בכבלים
            <select id="select_7">
                <option value="True">נכון</option>
                <option value="False">לא נכון</option>
            </select>
   
        </p>
                <br>
        <p class="Content">
            שאלה 8:
            הקמת ענן פרטי: מערכת נוטאניקס מכילה בתוכה גם את האיחסון
            <select id="select_8">
                <option value="True">נכון</option>
                <option value="False">לא נכון</option>
            </select>
            

        </p>
                <br>
        <p class="Content">
            שאלה 9:
            הקמת אתרי אגד בתחנות מרכזיות חדשות: במהלך השנה הוקמו תשתיות בארבע תחנות מרכזיות חדשות
            <select id="select_9">
                <option value="True">נכון</option>
                <option value="False">לא נכון</option>
            </select>
            
 
        </p>
                <br>
        <p class="Content">
            שאלה 10:
            צמצום מכירה ע"י הנהג: לנהגים בירושלים מותר היום למכור כרטיס בודד וערך צבור בלבד
            <select id="select_10">
                <option value="True">נכון</option>
                <option value="False">לא נכון</option>
            </select>
            

        </p>
                <br>
        <p class="Content">
            שאלה 11:
            העברת מערכות אגד הסעים ותיור לאגד: כל עובדי אגד תיור עברו כבר לרשת אגד
            <select id="select_11">
                <option value="True">נכון</option>
                <option value="False">לא נכון</option>
            </select>
            

        </p>
                <br>
        <p class="Content">
            שאלה 12:
            החלפת מכשיר הכירטוס: חסרים עוד 400 מכשירי כירטוס חדשים להשלמת הפריסה בירושלים
            <select id="select_12">
                <option value="True">נכון</option>
                <option value="False">לא נכון</option>
            </select>

        </p>
        <br>
        <p class="Content">
            שאלה 13:
            הקמת מערכת לניהול מוסך: קליטת מערכת נמ"ר במערכת ניהול מוסך מתבצעת כעת בהובלת הצוותים של נעים וגלית
            <select id="select_13">
                <option value="True">נכון</option>
                <option value="False">לא נכון</option>
            </select>
            
            
        </p>
<br>                
        <p class="Content">
            שאלה 14:
            פיתוח מערכת חדשה לניהול תחבורה ציבורית- נתיב ( החלפת מערכת סדרן): נתיב תעלה בגירסה ראשונה בסוף שנה זו, תכלול בתוכה לראשונה מודול שיבוץ שבועי ויומי ושילוב תקנה 168 במלואה
            <select id="select_14">
                <option value="True">נכון</option>
                <option value="False">לא נכון</option>
            </select>
            
            
        </p>
    <br>            
        <p class="Content">
            שאלה 15:
            הקמת מערכת רכש: הקמת מערכת הרכש מחולקת לשתי תכניות משנה, רכש כללי ורכש ח"ח
            <select id="select_15">
                <option value="True">נכון</option>
                <option value="False">לא נכון</option>
            </select>
            
            
        </p>
        <br>        
        <p class="Content">
            שאלה 16:
            אתר פנים חברה, פורטל ארגוני לאגד: הפורטל הארגוני של אגד מתוכנן להיות זמין לכל אחד באינטרנט
            <select id="select_16">
                <option value="True">נכון</option>
                <option value="False">לא נכון</option>
            </select>
            
            
        </p>
            <br>    
        <p class="Content">
            שאלה 17:
            מערכת לגיוס עובדים מתוכננת להיות מפותחת בתוך אגד ע"ב האורקל
            <select id="select_17">
                <option value="True">נכון</option>
                <option value="False">לא נכון</option>
            </select>
            
            
        </p>
                <br>
        <p class="Content">
            שאלה 18:
            הנגשת אתרים באגד כוללת גם את אתרי אגד הסעים ותיור, וצגי מידע באוטובוסים
            <select id="select_18">
                <option value="True">נכון</option>
                <option value="False">לא נכון</option>
            </select>
        </p>
                <br>
        <p class="Content">
            שאלה 19:
            אגד זכתה במכרז לתפעול הרכבת הקלה בתל אביב
            <select id="select_19">
                <option value="True">נכון</option>
                <option value="False">לא נכון</option>
            </select>
   
        </p>
                <br>
        <p class="Content">
            שאלה 20:
            SAFERIDE היא חברה העוסקת במיגון האוטובוסים מתקיפת סייבר ואגד רכשה את השליטה בה
            <select id="select_20">
                <option value="True">נכון</option>
                <option value="False">לא נכון</option>
            </select>
            

        </p>
                <br>
        <p class="Content">
            שאלה 21:
            מרכז השירות באגד מאויש 24/7
            <select id="select_21">
                <option value="True">נכון</option>
                <option value="False">לא נכון</option>
            </select>
        </p>
       
        
        
        <p class="Content">

            <input type="button" class="button_type" value="בדוק" onclick="Check();" >
            <span id = "answer">
            </span>
        </p>
                   <br><br>
        <div class="Content" style="text-align: center">
            <div style="text-decoration: underline">הקוד הוא: </div>
            <form id="final">
                <input type="text" class="mini_txt" id="final_1" maxlength="1" pattern ="[0-9]*" />
                <input type="text" class="mini_txt" id="final_2" maxlength="1" pattern ="[0-9]*" />
                <input type="text" class="mini_txt" id="final_3" maxlength="1" pattern ="[0-9]*" />
            </form>
            <input type="button" class="button_type" value="בדוק" onclick="CheckEnd();" />
            <div id="final_div">
            </div>
        </div>
        
    </body>
</html>
