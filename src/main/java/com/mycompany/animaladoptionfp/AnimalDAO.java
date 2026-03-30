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
            String sql = "SELECT * FROM Animals";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Animal a = new Animal();
                a.setId(rs.getInt("id"));
                a.setName(rs.getString("name"));
                a.setSpecies(rs.getString("species"));
                a.setBreed(rs.getString("breed"));
                a.setAge(rs.getInt("age"));

                animals.add(a);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return animals;
    }
}
