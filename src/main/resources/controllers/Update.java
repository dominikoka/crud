package main.resources.controllers;

import java.io.*;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.util.ArrayList;
import java.util.List;

import main.resources.models.*;
import main.resources.models.Person;

@WebServlet("/update")
public class Update extends HttpServlet {
  public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    System.out.println("tutej dziala klasa update");
    Read read = new Read();
    List<Person> persons = read.showAllPersons();
    List<Item> items = read.showAllItems();

    List<List<String>> increasePersonsAndItems = read.showOrders(items, persons);
    List<String> record;


    String typeAndPlaceInDB = request.getParameter("typeAndPlaceInDB");
    System.out.println(typeAndPlaceInDB);

    String personOrItem = typeAndPlaceInDB.substring(0,1);
    int numberInDB =Integer.parseInt(typeAndPlaceInDB.substring(1, typeAndPlaceInDB.length()));
    //record = new ArrayList<>();
//    for(int i=1;i<increasePersonsAndItems.get(numberInDB).size();i++)
//    {
//      String nameAtribute = "atr" + i;
//      record.add(increasePersonsAndItems.get(numberInDB).get(i));
//      request.setAttribute(nameAtribute,increasePersonsAndItems.get(numberInDB).get(i));
//    }

      request.setAttribute("typeAndPlace",typeAndPlaceInDB);

    if (personOrItem.equals("Y")) {

      //String jd = persons.get(numberInDB).getFirstName();

      for (Person person : persons) {

        if(person.getID() == numberInDB) {
          request.setAttribute("atr1",person.getFirstName());
          request.setAttribute("atr2",person.getLastName());
          request.setAttribute("atr3",String.valueOf(person.getAge()));
        }
      }

      RequestDispatcher req = request.getRequestDispatcher("WEB-INF/views/person.jsp");
      System.out.println("wczytuuje");
      try {

        req.forward(request,response);

      }catch(Exception e){
        e.printStackTrace();
      }


    }
    else
    {
      for (Item item : items) {
        if(item.getID() == numberInDB) {
          System.out.println(item.getName());
          System.out.println(item.getPrice());
          request.setAttribute("atr1",item.getName());
          request.setAttribute("atr2",item.getPrice());
        }
      }

      RequestDispatcher req = request.getRequestDispatcher("WEB-INF/views/item.jsp");
      System.out.println("wczytuuje");
      try {

        req.forward(request,response);

      }catch(Exception e){
        e.printStackTrace();
      }


      System.out.println("kliknales item");
    }

  }
}
