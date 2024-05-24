package main.resources.models;

import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public class Read {


  public List<Person> showAllPersons() {
    List<Person> persons = new ArrayList<>();
    try {
      Class.forName("com.mysql.cj.jdbc.Driver");
      Connection connection = DriverManager.getConnection(
          "jdbc:mysql://localhost:3306/clients", "root", "root"
      );
      Statement statement = connection.createStatement();
      ResultSet resultSet = statement.executeQuery("select * from persons");
      while (resultSet.next()) {
        System.out.println(resultSet.getInt(1) + " " + resultSet.getString(2) + " " + resultSet.getString(3) + " " + resultSet.getString(4));
        Person person = new Person(resultSet.getInt(1), resultSet.getString(2), resultSet.getString(3), Integer.parseInt(resultSet.getString(4)));
        persons.add(person);
      }
      connection.close();
    } catch (Exception e) {
      System.out.println(e);
    }
    return persons;
  }

  public List<Item> showAllItems() {
    List<Item> items = new ArrayList<>();
    try {
      Class.forName("com.mysql.cj.jdbc.Driver");
      Connection connection = DriverManager.getConnection(
          "jdbc:mysql://localhost:3306/clients", "root", "root"
      );
      Statement statement = connection.createStatement();
      ResultSet resultSet = statement.executeQuery("select * from items");
      while (resultSet.next()) {
        System.out.println(resultSet.getInt(1) + " " + resultSet.getString(2) + " " + resultSet.getString(3));
        Item item = new Item(resultSet.getInt(1), resultSet.getString(2), resultSet.getInt(3));
        items.add(item);
      }
      connection.close();
    } catch (Exception e) {
      System.out.println(e);
    }
    return items;
  }

  public List<List<String>> showOrders(List<Item> items, List<Person> persons) {
    List<List<String>> result = new ArrayList<>();
    List<String> record;
    String orderId;
    try {
      Class.forName("com.mysql.cj.jdbc.Driver");
      Connection connection = DriverManager.getConnection(
          "jdbc:mysql://localhost:3306/clients", "root", "root"
      );
      Statement statement = connection.createStatement();
      ResultSet resultSet = statement.executeQuery("select * from orders");
      while (resultSet.next()) {
        System.out.println(resultSet.getInt(1) + " " + resultSet.getString(2) + " " + resultSet.getString(3));
        orderId = String.valueOf(resultSet.getInt(1));
        int personId = resultSet.getInt(2);
        String personIdString = String.valueOf(personId);
//        String userName = persons.get(personId).getFirstName();
//        String lastName = persons.get(personId).getLastName();
//        String age = String.valueOf(persons.get(personId).getAge());
        int itemId = resultSet.getInt(3);
        String itemIdString = String.valueOf(itemId);
        String itemName = "";
        String price = "";
        String userName = "";
        String lastName = "";
        String age = "";
        for (Person person : persons) {
          if (personId == person.getID()) {
            userName = person.getFirstName();
            lastName = person.getLastName();
            age = String.valueOf(person.getAge());
          }
        }
        for (Item item : items) {
          if (itemId == item.getID()) {
            itemName = item.getName();
            price = String.valueOf(item.getPrice());
          }
        }


        System.out.println(resultSet.getInt(1) + " " + resultSet.getString(2) + " " + resultSet.getString(3));

        record = new ArrayList<>(Arrays.asList(personIdString, userName, lastName, age, itemIdString, itemName, price,orderId));
        result.add(record);
      }
      connection.close();
    } catch (Exception e) {
      System.out.println(e);
    }
    return result;
  }

  public List<List<String>> showEmptyPersons(List<List<String>> orders, List<Person> persons) {
    List<List<String>> result = new ArrayList<List<String>>();
    for (int i = 0; i < persons.size(); i++) {
      List<String> record = new ArrayList<>();
      int counter = 0;
      for (int j = 0; j < orders.size(); j++) {
        Integer personID = persons.get(i).getID();
        System.out.println(personID);
        Integer orderPersonID = Integer.parseInt(orders.get(j).get(0));
        System.out.println(orderPersonID);
        if (orderPersonID == personID) {
          counter++;
        }
      }
      if (counter == 0) {
        record.add(String.valueOf(persons.get(i).getID() ));
        record.add(persons.get(i).getFirstName());
        record.add(persons.get(i).getLastName());
        record.add(String.valueOf(persons.get(i).getAge()));
        result.add(record);
      }
      counter = 0;
    }
    return result;
  }

  public List<List<String>> sortListOrders(List<List<String>> list) {


    int id_user = 0;
    boolean newUser = true;
    List<List<String>> result = new ArrayList<>();
    List<String> oneRecord;

    //int i=0;
    while (list.size() != 0) {

      for (int i = 0; i < list.size(); i++) {
        if (list.get(i).get(0).equals(String.valueOf(id_user))) {
          if (newUser) {
            oneRecord = new ArrayList<>(Arrays.asList("Y", list.get(i).get(0), list.get(i).get(1), list.get(i).get(2), list.get(i).get(3)));
            newUser = false;
            result.add(oneRecord);
            oneRecord = new ArrayList<>(Arrays.asList("N", list.get(i).get(4), list.get(i).get(5), list.get(i).get(6),list.get(i).get(7)));
            result.add(oneRecord);
            list.remove(i);
            i = -1;
          } else {
            oneRecord = new ArrayList<>(Arrays.asList("N", list.get(i).get(4), list.get(i).get(5), list.get(i).get(6),list.get(i).get(7)));
            result.add(oneRecord);
            list.remove(i);
            i = -1;

            //          oneRecord = new ArrayList<>(Arrays.asList("N",String.valueOf(items.get(i).getID()),items.get(j).getName(),String.valueOf(items.get(j).getPrice())));
          }
        }

      }
      id_user++;
      newUser = true;
    }

    return result;
  }


}