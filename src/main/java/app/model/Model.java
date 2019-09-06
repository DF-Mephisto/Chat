package app.model;

import app.entities.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Model {
    private static Model instance = new Model();

    private final String instanceName;
    private final String databaseName;
    private final String userName;
    private final String pass;
    private final String connectionUrl;
    private final String connectionString;

    private Model()
    {
        instanceName = "MEPHISTO-PK\\SQLEXPRESS:1433";
        databaseName = "Registration_Model";
        userName = "TestUser";
        pass = "123456";
        connectionUrl = "jdbc:sqlserver://%1$s;databaseName=%2$s;user=%3$s;password=%4$s;";
        connectionString = String.format(connectionUrl, instanceName, databaseName, userName, pass);

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        } catch (final ClassNotFoundException e) {
            // Should not happen.
            e.printStackTrace();
        }
    }

    public static Model getInstance()
    {
        return instance;
    }

    synchronized public void add(User user)
    {
        try(Connection con = DriverManager.getConnection(connectionString))  {

            PreparedStatement stmt = con.prepareStatement("INSERT INTO Users " +
                                                              "VALUES (?, ?);");
            stmt.setString(1, user.getName());
            stmt.setString(2, user.getPassword());
            stmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<String> list()
    {
        List<String> list = new ArrayList<>();

        try(Connection con = DriverManager.getConnection(connectionString);
            Statement stmt = con.createStatement())  {

            ResultSet res = stmt.executeQuery("SELECT * FROM Users");
            while (res.next()) {
                String name = res.getString("UserName");
                list.add(name);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public String getpwd(String name)
    {
        String pwd = null;

        try(Connection con = DriverManager.getConnection(connectionString))  {

            PreparedStatement stmt = con.prepareStatement("SELECT UserPassword " +
                                                              "FROM Users " +
                                                              "WHERE UserName = ?;");
            stmt.setString(1, name);
            ResultSet res = stmt.executeQuery();
            if (res.next()) pwd = res.getString("UserPassword");

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return pwd;
    }
}