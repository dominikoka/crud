package main.resources.models;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

public class ListToFile {
  public void saveListToFile(String item, String filePath) {
    try (PrintWriter writer = new PrintWriter(filePath)) {
      writer.println(item);
      writer.close();
    } catch (IOException e) {
      e.printStackTrace();
    }
  }
}
