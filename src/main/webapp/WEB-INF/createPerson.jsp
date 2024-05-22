<%@ page import="java.util.List" %>
<%@ page import="javax.swing.*" %>
<style><%@include file="/WEB-INF/css/style.css"%></style>

<div class="person">
  <%
    String atr1 = "name";
    String atr2 = "surname";
    String atr3 = "age";
    String typeAndPlace = (String) request.getAttribute("typeAndPlace");
    request.setAttribute("type",typeAndPlace);
    String type = typeAndPlace;
    out.print("<button class=\"person_CloseBtn\">X</button>");
    out.print("<div class=\"person_surname\">");
    out.print("<input type=\"text\" id=\"firstName\" name=\"firstName\" value=\""+atr1+"\">");
    out.print("</div>");
    out.print("<div class=\"person_name\">");
    out.print("<input type=\"text\" id=\"lastName\" name=\"lastName\" value=\""+atr2+"\">");
    out.print("</div>");
    out.print("<div class=\"person_age\">");
    out.print("<input type=\"text\" id=\"age\" name=\"age\" value=\""+atr3+"\">");
    out.print("</div>");
    //String type = request.getAuthType(typeAndPlace);

    out.print("<div class=\"person_changeBtn\">");
//      String url = "http://localhost:8089/changeValues?"+"a1="+fName+"&a2="+atr2+"&a3="+atr3+"&type="+typeAndPlace;
    String url = "http://localhost:8089/changeValues";

    out.print("<button class=\"person_SendBtn \">SEND!!!</button>");
    out.print("</div>");

  %>


</div>
<script>
    var dbID = "<%= typeAndPlace %>";
    $(".person_CloseBtn").click(function () {
        const div = document.querySelector(".person");
        div.innerHTML="";
        // $('.emailSender,.header,.footer').css('filter', 'blur(0px)');
    })

    $(document).ready(function () {
        $(".person_SendBtn").click(function () {

            const firstName = document.querySelector('#firstname').value;
            const lastName = document.querySelector('#lastname').value;
            const age = document.querySelector('#age').value;

            console.log(firstName + "1 imnie zmienione");
            console.log(lastName + "2 imnie zmienione");
            console.log(age + "wiek");
            //console.log(userId + "numer db");
            var adressURL = "http://localhost:8089/createPersonSave";
            $.ajax({
                type: "GET",
                url: adressURL,
                data: {
                    firstName : firstName,
                    lastName: lastName,
                    age: age,
                    type: "person" ,
                   // dbID: dbID
                },
                success: function (result) {
                    $(".update").html(result);
                    reload();
                },
                error: function (error) {
                    console.error("Ajax request failed: " + error);
                }
            });
        });
    });

    function reload() {
        location.reload();
    }

</script>