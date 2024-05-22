package main.resources.models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DeleteModel {
  Integer id;

  public DeleteModel(Integer id) {
    this.id = id;
  }


  public void deletePerson()
  {


    try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/clients", "root", "root")) {
      // Tworzenie zapytania SQL z miejscem na zmienną
      String query = "DELETE FROM persons WHERE id = ?";
      String query2 = "DELETE FROM orders WHERE persons_ID = ?";


      try (PreparedStatement preparedStatement = connection.prepareStatement(query2))
      {
        preparedStatement.setInt(1, id);
        int rowsAffected = preparedStatement.executeUpdate();
      }

      // Przygotowanie zapytania
      try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
        // Ustawienie wartości zmiennej
        preparedStatement.setInt(1, id);


        // Wykonanie zapytania
        int rowsAffected = preparedStatement.executeUpdate();
        if (rowsAffected > 0) {
          System.out.println("Rekord o id " + id + " został pomyślnie usunięty.");
        } else {
          System.out.println("Nie znaleziono rekordu o id " + id + " do usunięcia.");
        }
      }
    } catch (SQLException e) {
      // Obsługa wyjątków
      e.printStackTrace();
    }
  }


  public void deleteItem() {
    try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/clients", "root", "root")) {
      // Tworzenie zapytania SQL z miejscem na zmienną
      String query = "DELETE FROM items WHERE id = ?";
      //String query2 = "DELETE FROM orders WHERE items_ID = ?";


//      try (PreparedStatement preparedStatement = connection.prepareStatement(query2))
//      {
//        preparedStatement.setInt(1, id+1);
//        int rowsAffected = preparedStatement.executeUpdate();
//      }

      // Przygotowanie zapytania
      try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
        // Ustawienie wartości zmiennej
        preparedStatement.setInt(1, id);


        // Wykonanie zapytania
        int rowsAffected = preparedStatement.executeUpdate();
        if (rowsAffected > 0) {
          System.out.println("Rekord o id " + id + " został pomyślnie usunięty.");
        } else {
          System.out.println("Nie znaleziono rekordu o id " + id + " do usunięcia.");
        }
      }
    } catch (SQLException e) {
      // Obsługa wyjątków
      e.printStackTrace();
    }
  }
}
