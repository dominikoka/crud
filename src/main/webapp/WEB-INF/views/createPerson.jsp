<%@ page import="java.util.List" %>
<%@ page import="javax.swing.*" %>
<style><%@include file="/WEB-INF/css/style.css"%></style>

<div class="createPerson">
  <div class="createPerson_box">

  <%
    String atr1 = "name";
    String atr2 = "surname";
    String atr3 = "age";
    String typeAndPlace = (String) request.getAttribute("typeAndPlace");
    request.setAttribute("type",typeAndPlace);
    String type = typeAndPlace;
    out.print("<div class=\"createPerson_CloseBtnBox \">");

    out.print("<button class=\"createPerson_CloseBtn reset-Button\">X</button>");
    out.print("</div>");
    out.print("<div class=\"createPerson_title\">CREATE PERSON</div>");
    out.print("<div class=\"createPerson_surnameBox\">");
    out.print("<input type=\"text\" id=\"firstName\" class=\"createPerson_surname\" name=\"firstName\" placeholder=\""+atr1+"\" >");
    out.print("</div>");
    out.print("<div class=\"createPerson_nameBox\">");
    out.print("<input type=\"text\" id=\"lastName\" class=\"createPerson_name\" name=\"lastName\" placeholder=\""+atr2+"\">");
    out.print("</div>");
    out.print("<div class=\"createPerson_ageBox\">");
    out.print("<input type=\"text\" id=\"age\" name=\"age\" class=\"createPerson_age\" placeholder=\""+atr3+"\">");
    out.print("</div>");
    //String type = request.getAuthType(typeAndPlace);

    out.print("<div class=\"createPerson_SendBtnBox\">");


    out.print("<button class=\"createPerson_SendBtn reset-Button\">SEND!!!</button>");
    out.print("</div>");

  %>
  </div>

</div>
<script>
    var dbID = "<%= typeAndPlace %>";
    $(".createPerson_CloseBtn").click(function () {
        const div = document.querySelector(".createPerson");
        div.innerHTML="";
        // $('.emailSender,.header,.footer').css('filter', 'blur(0px)');
    })

    $(document).ready(function () {
        $(".createPerson_SendBtn").click(function () {

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