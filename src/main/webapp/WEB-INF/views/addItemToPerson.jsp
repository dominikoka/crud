<%@ page import="java.util.List" %>
<%@ page import="javax.swing.*" %>
<%@ page import="main.resources.models.Item" %>
<%@ page import="java.io.Console" %>
<style><%@include file="/WEB-INF/css/style.css"%></style>

<div class="item">

  <%

    String atr2 = "aaa";
    String atr1 = "bbb";
    String typeAndPlace = "cccc";
    request.setAttribute("type",typeAndPlace);
    String type = typeAndPlace;
    List<Item> items = (List<Item>) request.getAttribute("items");
    String nbPerson = (String) request.getAttribute("numberDB");
    System.out.println("z mojego jsp" + nbPerson);

//    <select id="ddlViewBy">
//    <option value="1">test1</option>
//    <option value="2" selected="selected">test2</option>
//    <option value="3">test3</option>
//    </select>
    out.print("<button class=\"person_CloseBtn item_addItemBtn item_closeBtn\">X</button>");
    out.print("<div class=\"item_title\">ADD ITEM</div>");
    out.print("<select id=\"item_select\" class=\"item_select\">");
      for (Item item : items) {
        out.print("<option value=\"" + item.getID() + "\">" + item.getName() + " - " + item.getPrice() + "</option>");
      }
    out.print("</select>");




//    out.print("<div class=\"person_surname\">");
//    out.print("<input type=\"text\" id=\"Name\" name=\"Name\" value=\""+atr1+"\">");
//    out.print("</div>");
//    out.print("<div class=\"person_name\">");
//    out.print("<input type=\"text\" id=\"Price\" name=\"Price\" value=\""+atr2+"\">");
//    out.print("</div>");
    out.print("<button class=\"item_addItem item_addItemClose\">ADD</button>");
//    out.print(atr1);

  %>

</div>
<script>

    $(".person_CloseBtn").click(function () {
        const div = document.querySelector(".item");
        div.innerHTML="";
        // $('.emailSender,.header,.footer').css('filter', 'blur(0px)');
    })

    $(document).ready(function () {


        $(".item_addItem").click(function () {
            var person = "<%= nbPerson %>";
            console.log("personee" + person);
            var e = document.getElementById("item_select");
            var item = e.value;

            // const name = document.querySelector('#Name').value;
            // const price = document.querySelector('#Price').value;

            //
            // console.log(firstName + "1 imnie zmienione");
            // console.log(lastName + "2 imnie zmienione");
            // console.log(age + "wiek");
            //console.log(userId + "numer db");
            var adressURL = "http://localhost:8089/AddItem";
            $.ajax({
                type: "GET",
                url: adressURL,
                data: {
                    // name : name,
                    // price: price,
                    // // age: age,
                    // dbID: dbID
                    item:item,
                    person:person,
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