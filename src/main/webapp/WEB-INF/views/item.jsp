<%@ page import="java.util.List" %>
<%@ page import="javax.swing.*" %>
<style>
  <%@include file="/WEB-INF/css/style.css" %>
</style>

<div class="item">
  <div class="item_box">
    <%

      Double atr2 = 22.2;
      String atr1 = (String) request.getAttribute("atr1");
      String typeAndPlace = (String) request.getAttribute("typeAndPlace");
      request.setAttribute("type", typeAndPlace);
      String type = typeAndPlace;

      out.print("<button class=\"person_CloseBtn\">X</button>");
      out.print("<div class=\"person_surname\">");
      out.print("<input type=\"text\" id=\"Name\" name=\"Name\" value=\"" + atr1 + "\">");
      out.print("</div>");
      out.print("<div class=\"person_name\">");
      out.print("<input type=\"text\" id=\"Price\" name=\"Price\" value=\"" + atr2 + "\">");
      out.print("</div>");
      out.print("<button class=\"person_SendBtn \">SEND!!!</button>");
//    out.print(atr1);

    %>
  </div>
</div>
<script>

    $(".person_CloseBtn").click(function () {
        const div = document.querySelector(".item");
        div.innerHTML = "";
        // $('.emailSender,.header,.footer').css('filter', 'blur(0px)');
    })

    $(document).ready(function () {
        var dbID = "<%= typeAndPlace %>";
        $(".person_SendBtn").click(function () {

            const name = document.querySelector('#Name').value;
            const price = document.querySelector('#Price').value;

            //
            // console.log(firstName + "1 imnie zmienione");
            // console.log(lastName + "2 imnie zmienione");
            // console.log(age + "wiek");
            //console.log(userId + "numer db");
            var adressURL = "http://localhost:8089/changeValues";
            $.ajax({
                type: "GET",
                url: adressURL,
                data: {
                    name: name,
                    price: price,
                    // age: age,
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