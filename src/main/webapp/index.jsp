<%@ page import="java.util.List" %>
<%@ page import="main.resources.models.Item" %>
<style><%@include file="/WEB-INF/css/style.sass"%></style>
<html>
<head>
  <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
  <style><%@include file="/WEB-INF/css/style.css"%></style>
</head>
<body class="bckg">
<h1 class="index_title">CLIENT MANAGER</h1>


<div class="main">
<div class="read">
  <button class="read_addPersonBtn" value="person">add person</button>
  <%
    List<List<String>> emptyPerson = (List<List<String>>) request.getAttribute("emptyperson");
    List<List<String>> personsAndItems = (List<List<String>>) request.getAttribute("personsanditems");
    out.print("<div class=\"read_data\">");
    out.print("<div class=\"read_name\">");
    out.print("name");
    out.print("</div>");
    out.print("<div class=\"read_surname\">");
    out.print("surname");
    out.print("</div>");
    out.print("<div class=\"read_age\">");
    out.print("age");
    out.print("</div>");
    out.print("</div>");
    for (int i = 0; i < personsAndItems.size(); i++) {
      String whatIsIt = personsAndItems.get(i).get(0);
      String numberInTheList = String.valueOf(i);
      String readUpdateBtn = "read_updateBtn" + whatIsIt + numberInTheList;
      if (personsAndItems.get(i).get(0) == "Y") {
        out.print("<div class=\"read_person\">");

        out.print("<div class=\"read_data\">");
          out.print("<div class=\"read_name\">");
            out.print(personsAndItems.get(i).get(3));
          out.print("</div>");
          out.print("<div class=\"read_surname\">");
            out.print(personsAndItems.get(i).get(2));
          out.print("</div>");
          out.print("<div class=\"read_age\">");
            out.print(personsAndItems.get(i).get(4));
          out.print("</div>");
        out.print("</div>");
//        out.print("<div class=\"read_btns\");
        out.print("<div class=\"read_btns\">");
          out.print("<button class=\"read_UpdateBtn\" value =\""+whatIsIt+personsAndItems.get(i).get(1)+"\" >edit</button>");
          out.print("<button class=\"read_delete\" value =\""+whatIsIt+personsAndItems.get(i).get(1)+"\" >delete</button>");
        out.print("<button class=\"read_addItemBtn\" value =\""+personsAndItems.get(i).get(1)+"\" >add Item</button>");
        out.print("</div>");
        out.print("</div>");
      } else {
        out.print("<div class=\"read_item\">");
        out.print("<div class=\"read_dataItem\">");
          out.print("<div class=\"read_name\">");
            out.print(personsAndItems.get(i).get(2));
          out.print("</div>");
          out.print("<div class=\"read_price\">");
            out.print(personsAndItems.get(i).get(3)+" zlote");
          out.print("</div>");
        out.print("</div>");
        out.print("<div class=\"read_btns item_btns\">");
        out.print("<button class=\"read_UpdateBtn\" value =\""+whatIsIt+personsAndItems.get(i).get(1)+"\">edit</button>");
        out.print("</div>");
        out.print("</div>");
      }
    }
    for (int i = 0; i < emptyPerson.size(); i++) {
      out.print("<div class=\"read_person\">");
      out.print("<div class=\"read_name\">");
      out.print(emptyPerson.get(i).get(2));
      out.print("</div>");
      out.print("<div class=\"read_surname\">");
      out.print(emptyPerson.get(i).get(1));
      out.print("</div>");
      out.print("<div class=\"read_age\">");
      out.print(emptyPerson.get(i).get(3));
      out.print("</div>");
      out.print("<div class=\"read_btns\"");
        out.print("<button class=\"read_UpdateBtn\" value =\""+"Y"+emptyPerson.get(i).get(0)+"\" >edit</button>");
        out.print("<button class=\"read_delete\" value =\""+"Y"+emptyPerson.get(i).get(0)+"\" >delete</button>");
        out.print("<button class=\"read_addItemBtn\" value =\""+emptyPerson.get(i).get(0)+"\" >add Item</button>");
      out.print("</div>");
      out.print("</div>");
    }

  %>
</div>
<div class="items">
<%--  <div class="items tiitle"> items</div>--%>
  <button class="read_addPersonBtn" value="item">add item</button>
  <div class="items_box">
  <%
    List<Item> items = (List<Item>) request.getAttribute("items");
    for(int i = 0; i < items.size(); i++) {

      out.print(" <div class=\"items_item\">");
      out.print(" <div class=\"items_itemData\">");
      out.print(items.get(i).getName());
      out.print(items.get(i).getPrice());
      out.print("</div>");
      out.print(" <div class=\"items_btns\">");
     out.print("<button class=\"read_UpdateBtn\" value =\""+"N"+items.get(i).getID()+"\">edit</button>");
      out.print("<button class=\"read_delete\" value =\""+"N"+items.get(i).getID()+"\" >delete</button>");
      out.print("</div>");
      out.print("</div>");
    }



  %>
</div>
</div>
<div class="update"></div>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.30.1/moment.min.js"></script>

<script>
    $(document).ready(function () {
        $(".btn_1").click(function () {
    $.ajax({
        type: "GET",
        url: "http://localhost:8089/read",
        success: function (result) {
            $(".text_to_show").html(result);
        },
        error: function (error) {
            console.error("Ajax request failed: " + error);
        }
            });
        });
    });

    $(document).ready(function () {
        $(".read_UpdateBtn").click(function () {
            var thebuttonclicked =$(this).attr("value");
            var adressURL = "http://localhost:8089/update";
            console.log(thebuttonclicked);
            $.ajax({
                type: "GET",
                url: adressURL,
                data: { typeAndPlaceInDB: thebuttonclicked,
                   },
                success: function (result) {
                    $(".update").html(result);
                },
                error: function (error) {
                    console.error("Ajax request failed: " + error);
                }
            });
        });
    });

    $(document).ready(function () {
        $(".read_addPersonBtn").click(function () {
            var thebuttonclicked =$(this).attr("value");
            var adressURL = "http://localhost:8089/CreateWindow";
            console.log(thebuttonclicked);
            $.ajax({
                type: "GET",
                url: adressURL,
                data: {
                    toModify: thebuttonclicked,
                },
                success: function (result) {
                    $(".update").html(result);
                },
                error: function (error) {
                    console.error("Ajax request failed: " + error);
                }
            });
        });
    });

    $(document).ready(function () {
        $(".read_delete").click(function () {
            var thebuttonclicked =$(this).attr("value");
            var adressURL = "http://localhost:8089/Delete";
            console.log(thebuttonclicked);
            $.ajax({
                type: "GET",
                url: adressURL,
                data: {
                    toModify: thebuttonclicked,
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
    $(document).ready(function () {
        $(".read_addItemBtn").click(function () {
            var thebuttonclicked =$(this).attr("value");
            var adressURL = "http://localhost:8089/addItemToPerson";
            console.log(thebuttonclicked);
            $.ajax({
                type: "GET",
                url: adressURL,
                data: {
                    toModify: thebuttonclicked,
                },
                success: function (result) {
                    $(".update").html(result);
                    //reload();
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
<%--<script>--%>
<%--    function myFunction() {--%>
<%--        document.getElementById("demo").innerHTML = "Hello World";--%>
<%--    }--%>
<%--</script>--%>
</body>
</html>
