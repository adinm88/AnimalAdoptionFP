/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
 /*
 * @author adinm
 */
package com.mycompany.animaladoptionfp;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {
    public List<User> getAllUsers() {
        List<User> users = new ArrayList<>();

        try (Connection conn = DBConnection.getConnection()) {
            System.out.println("Connection successful");
            String sql = "SELECT * FROM USERS";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            System.out.println("Running query to get users...");
            int count = 0;
            while (rs.next()) {
                count++;
                System.out.println("Found user: " + rs.getString("username"));
                User a = new User();
                a.setId(rs.getInt("id"));
                a.setUsername(rs.getString("username"));
                a.setRole(rs.getString("role"));
                users.add(a);
            }
            System.out.println("Total users fetched: " + count);

            } catch (Exception e) {
                e.printStackTrace();
            }

        return users;
    }
    public User validate(String username, String password) {
        User user = null;
        String sql = "SELECT * FROM USERS WHERE username = ? AND password = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, username);
            stmt.setString(2, password);

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setRole(rs.getString("role"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
}
