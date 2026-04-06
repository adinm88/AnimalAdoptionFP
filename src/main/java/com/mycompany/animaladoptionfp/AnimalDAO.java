/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.animaladoptionfp;

/**
 *
 * @author adinm
 */
import java.sql.*;
import java.util.*;

public class AnimalDAO {

    public List<Animal> getAllAnimals() {
        List<Animal> animals = new ArrayList<>();

        try (Connection conn = DBConnection.getConnection()) {
            System.out.println("Connection successful");
            String sql = "SELECT * FROM animals";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            System.out.println("Running query to get animals...");
            int count = 0;
            while (rs.next()) {
                count++;
                System.out.println("Found animal: " + rs.getString("name"));
                Animal a = new Animal();
                a.setId(rs.getInt("id"));
                a.setName(rs.getString("name"));
                a.setSpecies(rs.getString("species"));
                a.setAge(rs.getInt("age"));
                animals.add(a);
            }
            System.out.println("Total animals fetched: " + count);

            } catch (Exception e) {
                e.printStackTrace();
            }

        return animals;
    }
    public void createAnimal(String name, String species, int age) {
        String sql = "INSERT INTO animals (name, species, age) VALUES (?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, name);
            stmt.setString(2, species);
            stmt.setInt(3, age);

            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
