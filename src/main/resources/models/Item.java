package main.resources.models;

public class Item {

  private int ID;
  private int Price;
  private String Name;

  public Item(int ID, String name,int price) {
    this.ID = ID;

    Price = price;
    Name = name;
  }
  public Item( String name,int price) {
    Price = price;
    Name = name;
  }

  public int getID() {
    return ID;
  }

  public void setID(int ID) {
    this.ID = ID;
  }


  public int getPrice() {
    return Price;
  }

  public void setPrice(int price) {
    Price = price;
  }

  public String getName() {
    return Name;
  }

  public void setName(String name) {
    Name = name;
  }
}