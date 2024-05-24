<%@ page import="java.util.List" %>
<%@ page import="main.resources.models.Item" %>
<style>
  <%@include file="/WEB-INF/css/style.sass" %>
</style>
<html>
<head>
  <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
  <style>
    <%@include file="/WEB-INF/css/style.css" %>
  </style>
</head>
<body class="bckg">
<h1 class="main_title index_titleefect">CLIENT MANAGERe</h1>


<div class="main">
  <div class="main_column">
    <div class="read">
      <div class="read_box">
        <div class="read_title items_title"> ORDERS</div>
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
              out.print("<div class=\"read_name \">");
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
              out.print("<button class=\"read_UpdateBtn btneffect btneffect_edit\" value =\"" + whatIsIt + personsAndItems.get(i).get(1) + "\" >edit</button>");
              out.print("<button class=\"read_delete read_delete btneffect btneffect_delete\" value =\"" + whatIsIt + personsAndItems.get(i).get(1) + "\" >delete</button>");
              out.print("<button class=\"read_addItemBtn btneffect btneffect_add\" value =\"" + personsAndItems.get(i).get(1) + "\" >add</button>");
              out.print("</div>");
              out.print("</div>");
            } else {

              out.print("<div class=\"read_item\">");
              out.print("<div class=\"read_dataItem\">");
              out.print("<div class=\"read_name read_itemName\">");

              out.print(personsAndItems.get(i).get(2));
              out.print("</div>");
              out.print("<div class=\"read_price\">");
              out.print(personsAndItems.get(i).get(3) + " zlote");
              out.print("</div>");
              out.print("</div>");
              out.print("<div class=\"read_btns item_btns\">");
//            out.print("<button class=\"read_UpdateBtn\" value =\"" + whatIsIt + personsAndItems.get(i).get(1) + "\">edit</button>");
              out.print("<button class=\"read_deleteOrder btneffect btneffect_delete\" value =\"" + "O" + personsAndItems.get(i).get(4) + "\">delete</button>");
              out.print("</div>");
              out.print("</div>");
            }
          }
          for (int i = 0; i < emptyPerson.size(); i++) {
            out.print("<div class=\"read_person\">");
            out.print("<div class=\"read_data\">");
            out.print("<div class=\"read_name\">");
            out.print(emptyPerson.get(i).get(2));
            out.print("</div>");
            out.print("<div class=\"read_surname\">");
            out.print(emptyPerson.get(i).get(1));
            out.print("</div>");
            out.print("<div class=\"read_age\">");
            out.print(emptyPerson.get(i).get(3));
            out.print("</div>");
            out.print("</div>");
            out.print("<div class=\"read_btns\">");
            out.print("<button class=\"read_UpdateBtn btneffect btneffect_edit\" value =\"" + "Y" + emptyPerson.get(i).get(0) + "\" >edit</button>");
            out.print("<button class=\"read_delete read_delete btneffect btneffect_delete\" value =\"" + "Y" + emptyPerson.get(i).get(0) + "\" >delete</button>");
            out.print("<button class=\"read_addItemBtn btneffect btneffect_add\" value =\"" + emptyPerson.get(i).get(0) + "\" >add</button>");
            out.print("</div>");
            out.print("</div>");
          }

        %>
        <div class="read_addItemBtnMainBox">
          <button class="read_addPersonBtn btneffect read_addItemBtnMain" value="person">add person</button>
        </div>
      </div>
    </div>
    <div class="items">
      <%--  <div class="items tiitle"> items</div>--%>
      <div class="items_title">ITEMS</div>
      <div class="items_box">
        <%
          List<Item> items = (List<Item>) request.getAttribute("items");
          for (int i = 0; i < items.size(); i++) {

            out.print(" <div class=\"items_item\">");
            out.print(" <div class=\"items_itemData\">");
            out.print(items.get(i).getName());
            out.print(items.get(i).getPrice());
            out.print("</div>");
            out.print(" <div class=\"items_btns\">");
            out.print("<button class=\"read_UpdateBtn btneffect btneffect_edit\" value =\"" + "N" + items.get(i).getID() + "\">edit</button>");
            out.print("<button class=\"read_delete btneffect btneffect_delete\" value =\"" + "N" + items.get(i).getID() + "\" >delete</button>");
            out.print("</div>");
            out.print("</div>");
          }
        %>
        <div class="read_addItemBtnMainBox">
          <button class="read_addPersonBtn btneffect read_addItemBtnMain" value="item">add item</button>
        </div>
      </div>

    </div>
  </div>
  <div class="main_column">

    <div class="form">
      <div class="form_box">
        <div class="form_title">Create new Order</div>
        <div class="form_person">
          <input type="text" name="form_name" id="form_name" class="form_name" placeholder="name">
          <input type="text" name="form_surnname" id="form_surname" class="form_surnname" placeholder="surname">
          <div class="form_ageBox">
            <div class="form_ageTitle">Age</div>
            <input type="range" id="ageRange" name="ageRange" min="0" max="99" value="0"
                   oninput="displayAge(this.value)">
            <div class="age-display" id="ageDisplay">0</div>
          </div>
        </div>
        <div class="form_items">
          <div class="form_itemsTitle"> Items</div>
          <ul id="form_list"></ul>
          <div class="form_item">
            <input type="text" name="form_itemName" id="form_itemName" class="form_itemName" placeholder="name">
            <input type="text" name="form_itemPrice" id="form_itemPrice" class="form_itemPrice" placeholder="price">
            <button id="form_addBtn" class="btneffect btneffect_add">add</button>
            <button id="form_removeBtn" class="btneffect btneffect_delete">del</button>
          </div>
          <div class="form_email">
            <label>
              <input type="checkbox" id="emailCheckbox" onchange="toggleEmailField()"> do you want recive email with
              order?
            </label>
            <div class="form_emailField" id="emailField">
              <label for="email">Email:</label>
              <input type="email" id="email" name="email" class="form_emailInput" placeholder="email">
            </div>
          </div>
          <div class="form_txt">
            <label>
              <input type="checkbox" id="email_txt" onchange="toggleEmailField()"> do you want to save the order to a txt file?
            </label>
            <div class="form_emailField" id="emailField">
              <label for="form_file">Email:</label>
              <input type="email" id="form_file" name="email" placeholder="email">
            </div>
          </div>
          <div class="form_sendBtnBox">
            <button class="form_sendBtn read_addPersonBtn btneffect read_addItemBtnMain"> send</button>
          </div>
        </div>
      </div>
    </div>

  </div>

  <div class="update"></div>
  <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.30.1/moment.min.js"></script>

  <script>
      function toggleEmailField() {
          var checkbox = document.getElementById('emailCheckbox');
          var emailField = document.getElementById('emailField');
          if (checkbox.checked) {
              emailField.style.display = 'block';
          } else {
              emailField.style.display = 'none';
          }
      }

      const item_Name = document.getElementById("form_itemName");
      const item_Price = document.getElementById("form_itemPrice");
      const item_addBtn = document.getElementById("form_addBtn");
      const item_removeBtn = document.getElementById("form_removeBtn");
      const list_items = document.getElementById("form_list");


      let itemsList = [];

      item_addBtn.addEventListener('click', () => {
          const newItem = document.createElement('li');
          newItem.textContent = item_Name.value + " " + item_Price.value + " zl";
          if (item_Name.value != "" && item_Price.value != "") {
              list_items.appendChild(newItem);

              itemsList.push(item_Name.value + "  " + item_Price.value);

              item_Name.value = '';
              item_Price.value = '';
          }

      })
      item_removeBtn.addEventListener('click', () => {
              const lastItem = list_items.lastElementChild;
              if (lastItem) {
                  list_items.removeChild(lastItem);
                  itemsList.pop();
              }
          }
      )

      function displayAge(value) {
          document.getElementById('ageDisplay').innerText = value;
      }
  </script>
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
              var thebuttonclicked = $(this).attr("value");
              var adressURL = "http://localhost:8089/update";
              console.log(thebuttonclicked);
              $.ajax({
                  type: "GET",
                  url: adressURL,
                  data: {
                      typeAndPlaceInDB: thebuttonclicked,
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
              var thebuttonclicked = $(this).attr("value");
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
              var thebuttonclicked = $(this).attr("value");
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
          $(".read_deleteOrder").click(function () {
              var thebuttonclicked = $(this).attr("value");
              console.log(thebuttonclicked);
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
              var thebuttonclicked = $(this).attr("value");
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

      $(document).ready(function () {
          $(".form_sendBtn").click(function () {
              var listOrder = JSON.stringify(itemsList);
              var namePerson = document.getElementById("form_name");
              var surnamePerson = document.getElementById("form_surname");
              var email = document.getElementById("email");
              var agePerson = document.getElementById("ageDisplay").innerHTML;
              var checkbox = document.getElementById('email_txt');
              let checboxValue = false;
              if(checkbox.checked)
              {
                  checboxValue = true;
              }

              console.log(namePerson.value + surnamePerson.value + agePerson);

              var adressURL = "http://localhost:8089/CreateOrder";

              $.ajax({
                  type: "GET",
                  url: adressURL,
                  data: {
                      name: namePerson.value,
                      surname: surnamePerson.value,
                      age: agePerson,
                      items: listOrder,
                      email: email.value,
                      checkbox: checboxValue
                  },
                  success: function (result) {
                      // $(".update").html(result);
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

</body>
</html>
