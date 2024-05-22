

import java.io.*;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.util.List;

import main.resources.models.*;




@WebServlet("")
public class Read extends HttpServlet {

  public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException  {
    System.out.println("to jest aa");
//    testing test = new testing();

//    TestModels models = new TestModels();
//    models.showX(2);

    main.resources.models.Read mode = new main.resources.models.Read();

    //JavaJDBC jdbc = new JavaJDBC();
    //mode.showe(5);
    //try {
      //mode.readPerson();
      //jdbc.db();
      List<Person> persons =  mode.showAllPersons();
      List<Item> items =  mode.showAllItems();

//      List<List<String>> increasePersonsAndItems = mode.showIncreaseResultPersonAndItem(items,persons);
      List<List<String>> orders = mode.showOrders(items,persons);
    List<List<String>> emptyPerson = mode.showEmptyPersons(orders,persons);
      List<List<String>> sordList = mode.sortListOrders(orders);


     // mode.showItem
   // }
//    catch(SQLException e)
//    {
//      e.printStackTrace();
//    }

//    System.out.println("dziala");
     response.setContentType("text/plain");
//    response.getWriter().write("greetings");
      request.setAttribute("personsanditems", sordList);
      request.setAttribute("emptyperson", emptyPerson);
      request.setAttribute("items", items);
      RequestDispatcher req = request.getRequestDispatcher("index.jsp");
      try {
        req.forward(request,response);
      }catch(Exception e){
        e.printStackTrace();
      }

  }
}



