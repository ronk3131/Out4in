var IMG_WIDTH = 720;
var IMG_HEIGHT = 1027;
var CODES = ["341568", "144", "130", "178", "169", "543", "121", "749"];

function InitScreen(width, height)
{
    var width_scale = width / IMG_WIDTH;
    var height_scale = height / IMG_HEIGHT;
    
    var area_tags = document.getElementsByTagName("area");
    
    for(var i = 0; i < area_tags.length; i++)
    {
        var c = area_tags[i].coords;
        var x_and_y = c.split(",");
        x_and_y[0] = Math.floor(width_scale * x_and_y[0]);
        x_and_y[2] = Math.floor(width_scale * x_and_y[2]);
        x_and_y[1] = Math.floor(height_scale * x_and_y[1]);
        x_and_y[3] = Math.floor(height_scale * x_and_y[3]);
        area_tags[i].coords = x_and_y.join(",");
    }
    
}

function CheckCode() {
    var inp = document.getElementById("code");
    var v = inp.value;
    for (var i = 0; i < CODES.length; i++) {
        if (v.localeCompare(CODES[i]) === 0) {
            document.getElementById("answer").innerHTML = "���� ����!";
            return;
        }
    }
    document.getElementById("answer").innerHTML = "���� �� ����";
}

function Show() {
    var s = "����� ���:";
    s += '<br>';
    s += "\"������ ����� ���� ��� ���� ������. ���� ����� ����� ����� ������� ��� ������ ���� ����� ����� �����. ����� ������ ����� ����� ����� ��� ����� �� �� ���� �����\"";
    s += "<br /><b>";
    s += "���� ����";
    s += "";
    document.getElementById("final").innerHTML = s;
}