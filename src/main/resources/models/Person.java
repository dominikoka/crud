package main.resources.models;

public class Person {

  private int ID;
  private String LastName;
  private String FirstName;
  private int Age;


  public Person(int ID, String lastName, String firstName, int age) {
    this.ID = ID;
    LastName = lastName;
    FirstName = firstName;
    Age = age;
  }
  public Person(String lastName, String firstName, int age) {
    this.ID = ID;
    LastName = lastName;
    FirstName = firstName;
    Age = age;
  }

  public int getID() {
    return ID;
  }

  public void setID(int ID) {
    this.ID = ID;
  }

  public String getLastName() {
    return LastName;
  }

  public void setLastName(String lastName) {
    LastName = lastName;
  }

  public String getFirstName() {
    return FirstName;
  }

  public void setFirstName(String firstName) {
    FirstName = firstName;
  }

  public int getAge() {
    return Age;
  }

  public void setAge(int age) {
    Age = age;
  }
}