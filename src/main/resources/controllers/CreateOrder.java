package main.resources.controllers;


import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import main.resources.models.*;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@WebServlet("/CreateOrder")
public class CreateOrder extends HttpServlet {

  public void doGet(HttpServletRequest request, HttpServletResponse response) {
    String name = request.getParameter("name");
    String surname = request.getParameter("surname");
    String age = request.getParameter("age");
    String email = request.getParameter("email");
    String fileToSave = request.getParameter("checkbox");
    System.out.println(age);
    String orderList = request.getParameter("items");
    Create creator;
    Gson gson = new Gson();
    List<String> itemsList = gson.fromJson(orderList, new TypeToken<List<String>>() {
    }.getType());
    Person person = new Person(surname, name, Integer.parseInt(age));
    creator = new Create(person);
    creator.createPerson();
//    List<Item> items = new ArrayList<>();
    if(fileToSave.equals("true")) {
      System.out.println("czeba zapisac");
    }

    Read read = new Read();
    int idNewPerson = read.showAllPersons().get(read.showAllPersons().size() - 1).getID();
    for (String itemString : itemsList) {
      String[] partsItemString = itemString.split(" ");
      Item item = new Item(partsItemString[0], Integer.parseInt(partsItemString[2]));
      creator = new Create(item);
      creator.createItem();
      int idNewItem = read.showAllItems().get(read.showAllItems().size() - 1).getID();
      creator.createOrder(idNewPerson, idNewItem);
    }
    String itemsOrdered = orderList.replace("[","");
    itemsOrdered = orderList.replace("]","\n");
    itemsOrdered = itemsOrdered.replace("[","");
    itemsOrdered = itemsOrdered.replace("\"", "");

    if(!email.equals("")) {
      EmailSender emailSender = new EmailSender();
      emailSender.sendEmail(email,name+" " + surname+"\n",itemsOrdered,"poczta.o2.pl","465","osabeznosa@o2.pl","665test665");
    }
    if(fileToSave.equals("true")) {
      ListToFile listToFile = new ListToFile();
      listToFile.saveListToFile(name+" "+surname+"\n"+itemsOrdered,"Order.txt");
    }


  }

}
