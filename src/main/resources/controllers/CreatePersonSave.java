package main.resources.controllers;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import main.resources.models.Create;
import main.resources.models.Item;
import main.resources.models.Person;

@WebServlet("/createPersonSave")
public class CreatePersonSave extends HttpServlet {

  public void doGet(HttpServletRequest request, HttpServletResponse response) {

    String type = request.getParameter("type");


    System.out.println(type);
    if (type.equals("person")) {
      String firstName = request.getParameter("firstName");
      String lastName = request.getParameter("lastName");
      Integer age = Integer.valueOf(request.getParameter("age"));
      System.out.println("z klasy kreate person" + firstName + " " + lastName + " " + age);
      Person person = new Person(firstName, lastName, age);
      Create create = new Create(person);
      create.createPerson();
    } else {
      String name = request.getParameter("name");
      String price = request.getParameter("price");
      Item item = new Item(name, Integer.parseInt(price));
      Create create = new Create(item);
      create.createItem();
    }

  }

}
