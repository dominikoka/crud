package main.resources.models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Create {

  String firstname;
  String lastname;
  Integer age;

  String name;
  Integer price;

  public Create(Person person) {
    this.firstname = person.getFirstName();
    this.lastname = person.getLastName();
    this.age = person.getAge();
  }

  public Create(Item item) {
    this.name = item.getName();
    this.price = item.getPrice();
  }
  public Create()
  {}


  public void createPerson() {
    System.out.println("działamy w metodzie updatePerson");


    try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/clients", "root", "root")) {
      // Tworzenie zapytania SQL z miejscem na zmienną
      String query = "INSERT INTO persons (LastName, FirstName, Age) VALUES (?, ?, ?)";

      // Przygotowanie zapytania
      try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
        // Ustawienie wartości zmiennej


        preparedStatement.setString(1, firstname);
        preparedStatement.setString(2, lastname);
        preparedStatement.setInt(3, age);

        // Wykonanie zapytania
        int rowsAffected = preparedStatement.executeUpdate();
      }
    } catch (SQLException e) {
      // Obsługa wyjątków
      e.printStackTrace();
    }
  }

  public void createItem() {
    System.out.println("działamy w metodzie updatePerson");
    try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/clients", "root", "root")) {
      // Tworzenie zapytania SQL z miejscem na zmienną
      String query = "INSERT INTO items (name, price) VALUES (?, ?)";

      // Przygotowanie zapytania
      try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
        // Ustawienie wartości zmiennej


        preparedStatement.setString(1, name);
        preparedStatement.setInt(2, price);

        // Wykonanie zapytania
        int rowsAffected = preparedStatement.executeUpdate();
      }
    } catch (SQLException e) {
      // Obsługa wyjątków
      e.printStackTrace();
    }
  }

  public void createOrder(int person, int item) {

    try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/clients", "root", "root")) {
      String query = "INSERT INTO orders (persons_ID, items_ID) VALUES (?, ?)";
      try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
        preparedStatement.setString(1, String.valueOf(person));
        preparedStatement.setInt(2, item);
        int rowsAffected = preparedStatement.executeUpdate();
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }

  }

}
