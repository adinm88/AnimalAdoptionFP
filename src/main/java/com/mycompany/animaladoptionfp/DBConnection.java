/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.animaladoptionfp;

/**
 *
 * @author adinm
 */
import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    private static String url =
        "jdbc:mysql://localhost:3306/animal_adoption?zeroDateTimeBehavior=CONVERT_TO_NULL";
    private static String user = "root";
    private static String password = "Mypassword!";

    public static Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(url, user, password);
    }
}
