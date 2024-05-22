package main.resources.models;

//import com.sun.net.httpserver.Request;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import main.resources.models.Person;

import java.io.IOException;


@WebServlet("/changeValues")
public class ChangeValues extends HttpServlet {
  public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

   String typeAndPlace = request.getParameter("dbID");


    //System.out.println("z mojej klasy change value + " +firstName + " + lastName + " + age + " + dbID" );


    Update update;


    if(typeAndPlace.substring(0,1).equals("Y"))
    {
      String firstName = request.getParameter("firstName");
      String lastName = request.getParameter("lastName");
      String age = request.getParameter("age");
      int nbDB = Integer.parseInt(typeAndPlace.substring(1));
      Person person = new Person(nbDB,firstName,lastName, Integer.parseInt(age));
      update  = new Update(person);
      update.updatePerson();
    }
    else
    {
      int nbDB = Integer.parseInt(typeAndPlace.substring(1,2));
      String name = request.getParameter("name");
      System.out.println(name);
      String price = request.getParameter("price");
      System.out.println(price);
      Item item = new Item(nbDB,name,Integer.parseInt(price));
      update = new Update(item);
      update.updateItem();
      //Item item = new Item()
    }





  }

}
