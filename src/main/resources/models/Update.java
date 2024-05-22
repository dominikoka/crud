package main.resources.models;

import java.sql.*;

public class Update {

  Person person;
  Item item;

  public Update(Person person)
  {
    this.person = person;
  }
  public Update(Item item)
  {
    this.item = item;
  }

  public void updatePerson()
  {
    System.out.println("działamy w metodzie updatePerson");
    int personID = person.getID();
    String firstName = person.getFirstName();
    String lastName = person.getLastName();
    int age = person.getAge();

    try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/clients", "root", "root")) {
      // Tworzenie zapytania SQL z miejscem na zmienną
      String query = "UPDATE persons SET FirstName=?, LastName=?, Age=? WHERE ID=?";

      // Przygotowanie zapytania
      try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
        // Ustawienie wartości zmiennej
        ///preparedStatement.setInt(1, personID);

        preparedStatement.setString(1, firstName);
        preparedStatement.setString(2, lastName);
        preparedStatement.setInt(3, age);
        preparedStatement.setInt(4, personID);

        // Wykonanie zapytania
        int rowsAffected = preparedStatement.executeUpdate();
      }
    } catch (SQLException e) {
      // Obsługa wyjątków
      e.printStackTrace();
    }
  }

  public void updateItem()
  {
    System.out.println("działamy w metodzie updateItem");
    int itemID = item.getID();
    String name = item.getName();
    String price = String.valueOf(item.getPrice());


    try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/clients", "root", "root")) {
      // Tworzenie zapytania SQL z miejscem na zmienną
      String query = "UPDATE items SET name=?, price=? WHERE id=?";

      // Przygotowanie zapytania
      try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
        // Ustawienie wartości zmiennej
        preparedStatement.setInt(1, itemID);

        preparedStatement.setString(1, name);
        preparedStatement.setString(2, price);
        preparedStatement.setInt(3, itemID);

        // Wykonanie zapytania
        int rowsAffected = preparedStatement.executeUpdate();
      }
    } catch (SQLException e) {
      // Obsługa wyjątków
      e.printStackTrace();
    }

  }

}
