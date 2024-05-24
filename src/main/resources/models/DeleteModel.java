package main.resources.models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DeleteModel {
  Integer id;
  String url;
  String user;
  String pass;

  public DeleteModel(Integer id) {
    this.id = id;
  }


  public void deletePerson(int idPerson) {
    try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/clients", "root", "root")) {
      String query = "DELETE FROM persons WHERE ID = ?";
      String query2 = "DELETE FROM orders WHERE persons_ID = ?";
      try (PreparedStatement preparedStatement = connection.prepareStatement(query2)) {
        preparedStatement.setInt(1, idPerson);
        int rowsAffected = preparedStatement.executeUpdate();
      }
      try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
        preparedStatement.setInt(1, idPerson);
        int rowsAffected = preparedStatement.executeUpdate();
        if (rowsAffected > 0) {
          System.out.println("Rekord o id " + idPerson + " został pomyślnie usunięty.");
        } else {
          System.out.println("Nie znaleziono rekordu o id " + idPerson + " do usunięcia.");
        }
      }
    } catch (SQLException e) {
      // Obsługa wyjątków
      e.printStackTrace();
    }
  }


  public void deleteItem(int itemID) {
    try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/clients", "root", "root")) {
      String query = "DELETE FROM items WHERE id = ?";
      try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
        preparedStatement.setInt(1, itemID);
        int rowsAffected = preparedStatement.executeUpdate();
        if (rowsAffected > 0) {
          System.out.println("Rekord o id " + itemID + " został pomyślnie usunięty.");
        } else {
          System.out.println("Nie znaleziono rekordu o id " + itemID + " do usunięcia.");
        }
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }

  public void deleteOrder(int orderID)
  {
    try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/clients", "root", "root")) {
      String query = "DELETE FROM orders WHERE order_id = ?";
      try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
        preparedStatement.setInt(1, orderID);
        int rowsAffected = preparedStatement.executeUpdate();
        if (rowsAffected > 0) {
          System.out.println("Rekord o id " + orderID + " został pomyślnie usunięty.");
        } else {
          System.out.println("Nie znaleziono rekordu o id " + orderID + " do usunięcia.");
        }
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }
}
