<%@ page import="java.util.List" %>
<%@ page import="javax.swing.*" %>
<style><%@include file="/WEB-INF/css/style.css"%></style>

<div class="createPerson">
  <div class="person_box">
  <%
    String atr1 = (String) request.getAttribute("atr1");
    System.out.println("z nojego jsp atr1" + atr1);
    String atr2 = (String) request.getAttribute("atr2");
    System.out.println("z nojego jsp atr2" + atr2);
    String atr3 = (String) request.getAttribute("atr3");
    System.out.println("z nojego jsp atr3" + atr3);
    String typeAndPlace = (String) request.getAttribute("typeAndPlace");
    System.out.println("z nojego jsp typeandplace" + typeAndPlace);
    request.setAttribute("type",typeAndPlace);
    String type = typeAndPlace;
    out.print("<button class=\"person_CloseBtn person_editCloseBtn\">X</button>");
    out.print("<div class=\"createPerson_title\">EDIT PERSON</div>");
    out.print("<div class=\"person_surname\">");
      out.print("<input type=\"text\" class=\"person_surnameInput\" id=\"firstName\" name=\"firstName\" value=\""+atr2+"\">");
    out.print("</div>");
    out.print("<div class=\"person_name\">");
      out.print("<input type=\"text\" id=\"lastName\" class=\"person_lastNameInput\" name=\"lastName\" value=\""+atr1+"\">");
    out.print("</div>");
    out.print("<div class=\"person_age\">");
      out.print("<input type=\"text\" id=\"age\" class=\"person_ageInput\" name=\"age\" value=\""+atr3+"\">");
    out.print("</div>");
    //String type = request.getAuthType(typeAndPlace);

    out.print("<div class=\"person_changeBtn\">");
//      String url = "http://localhost:8089/changeValues?"+"a1="+fName+"&a2="+atr2+"&a3="+atr3+"&type="+typeAndPlace;
      String url = "http://localhost:8089/changeValues";
//      out.print("<a href=\""+url+"\">Change Values</a>");
    out.print("<button class=\"person_SendBtn \">SEND!!!</button>");
    out.print("</div>");

  %>
  </div>

</div>
<script>
    var dbID = "<%= typeAndPlace %>";
    $(".person_CloseBtn").click(function () {
        const div = document.querySelector(".createPerson");
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
            var adressURL = "http://localhost:8089/changeValues";
            $.ajax({
                type: "GET",
                url: adressURL,
                data: {
                    firstName : firstName,
                    lastName: lastName,
                    age: age,
                    dbID: dbID
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