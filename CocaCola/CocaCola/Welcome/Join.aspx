<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Join.aspx.cs" Inherits="Welcome_Join" %>

<html xmlns="http://www.w3.org/1999/xhtml">
    
    <head runat="server">

        <script>
            function chooseGroup() {
                var groupID = prompt("Enter Group Name: ");
                var groupPassword, usedGroupID;

                document.getElementById("<% = groupID.ClientID %>").value = groupID;
                if (groupID.length == 0) {
                    alert("Invalid Group Name Format.");
                    return false;
                }

                usedGroupID = '<% = string.Join(", ", usedGroupID) %>';

                if (usedGroupID.split(', ').indexOf(groupID) == -1) {
                    groupPassword = prompt("You are the group leader. Enter a new password: ");
                }
                else {
                    groupPassword = prompt("This name has already been taken. Enter the password to join this group: ");
                } 

                if (groupPassword.length == 0) {
                    alert("Invalid Password Format.");
                    return false;
                }

                document.getElementById("<% = groupPass.ClientID %>").value = groupPassword;
                document.getElementById("<% = groupIDbutton.ClientID %>").click();
                return true;
            }
        </script>

        <meta http-equiv="Content-Type" content="text/html, charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="style.css" />
        <script type="application/javascript" src="initScreen.js"></script>
        <title></title>
    </head> 
    
    <body onload="while(!chooseGroup()) {}">
        <form id="groupForm" runat="server" style="width:0; height:0; margin:0; padding:0;">
            <asp:HiddenField runat="server" ID="groupID" Value="" />
            <asp:HiddenField runat="server" ID="groupPass" Value="" />
            <asp:Button runat="server" ID="groupIDbutton" CssClass="hidden" OnClick="groupIDbutton_Click"/>
        </form>
        <img src = "../resource/logo.png" class="background" usemap="#background_map" />

    </body>
</html>