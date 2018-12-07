﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Welcome_Index" %>

<html xmlns="http://www.w3.org/1999/xhtml">
    
    <head runat="server">
        <meta http-equiv="Content-Type" content="text/html, charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="style.css" />
        <script type="application/javascript" src="initScreen.js"></script>
        <title></title>
        
        <script>

            function SendToInit() {
                var iw = window.innerWidth, ih = window.innerHeight;
                var count = 0;
                var stationStatus;
                var img_id

                InitScreen(iw, ih);
                if (window.innerHeight < window.innerWidth) {
                    alert("העבר את הפלאפון למצב עומד בשביל חווית משחק מירבית!");
                    //window.location.reload(false);
                }

                stationStatus = '<%= string.Join(", ", StationStatus) %>';
                stationStatus = stationStatus.split(", ");

                for (var i = 1; i <= CODES.length; i++) {
                    if (stationStatus[i - 1] == "True") {
                        img_id = "img_for_" + i;
                        document.getElementById(img_id).src = "green_dot.png";
                        count++;
                    }
                }

                if (count === 8) {
                    document.getElementById("FinalButton").disabled = false;
                }
            }

        </script>
    </head> 
    
    <body onload="SendToInit();">

        <img src = "background.png" class="background" usemap="#background_map" />
        
        <map name="#background_map">
            <area shape="rect" coords="165,600,236,675" id="number_1" href="../StationOne/index.aspx">
            <area shape="rect" coords="268,600,341,675" id="number_2" href="../StationTwo/index.aspx">           
            <area shape="rect" coords="393,600,464,675" id="number_3" href="../StationThree/index.aspx">
            <area shape="rect" coords="503,600,576,675" id="number_4" href="../StationFour/index.aspx">
            <area shape="rect" coords="166,691,237,766" id="number_5" href="../StationFive/index.aspx">
            <area shape="rect" coords="269,691,340,766" id="number_6" href="../StationSix/index.aspx">
            <area shape="rect" coords="394,691,465,766" id="number_7" href="../StationSeven/index.aspx">
            <area shape="rect" coords="503,691,576,766" id="number_8" href="../StationEight/index.aspx">
            <area shape="rect" coords="199,863,272,939" id="help" href="../Help/index.html">
            <area shape="rect" coords="73,863,142,934" id="welcome" href="../WelcomePage/index.html">
            <area shape="rect" coords="529,32,594,99" href="#" id="finalCode" data-toggle="modal" data-target="#FinalCode">
        </map>



        <div class="modal fade" id="FinalCode" tabindex="-1" role="dialog" aria-labelledby="FinalCodeLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" >הקוד הסופי</h5>
                    </div>
                    <div class="modal-body">
                        <table style="width: 100%; text-align: center;">
                            <tr>
                                <td>
                                    1 <br> <img src="red_dot.png" id="img_for_1">
                                </td>
                                <td>
                                    2 <br> <img src="red_dot.png" id="img_for_2">
                                </td>
                                <td>
                                    3 <br> <img src="red_dot.png" id="img_for_3">
                                </td>
                                <td>
                                    4 <br> <img src="red_dot.png" id="img_for_4">
                                </td>
                            </tr>
                            <tr style="margin-top: 10px">
                                <td>
                                    5 <br> <img src="red_dot.png" id="img_for_5">
                                </td>
                                <td>
                                    6 <br> <img src="red_dot.png" id="img_for_6">
                                </td>
                                <td>
                                    7 <br> <img src="red_dot.png" id="img_for_7">
                                </td>
                                <td>
                                    8 <br> <img src="red_dot.png" id="img_for_8">
                                </td>
                            </tr>

                        </table>
                        <br> <br> <br>
                  
                        <p class="Content">
                            <input type="button" value="חשוף את משפט הסיום"  disabled class="button_type" id="FinalButton" onclick="Show();">
                            <br>
                            <span id="final"></span>
                        </p>
                    </div>
                
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">סגור</button>                
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>