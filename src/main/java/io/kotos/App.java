package io.kotos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class App 
{
    // mysql credentials
    private final static String url = "jdbc:mysql://localhost:3307/city_directory?useSSL=false&allowPublicKeyRetrieval=true";
    private final static String user = "root";
    private final static String password = "password";

    public static void main(String[] args)
    {
        try {
            Connection connection = App.getDatabaseConnection();
            MunicipalityRepository municipalityRepository = App.getMunicipalityRepository(connection);
            Municipality municipality = municipalityRepository.getMunicipality();

            System.out.println("Selected municipality:");
            System.out.println(
                "id: " + municipality.getMunicipalityId() + ", " +
                "name: " + municipality.getName() + ", " +
                "type: " + municipality.getType()
            );
            System.exit(0);
        } catch (SQLException ex) {
            Logger logger = Logger.getLogger(App.class.getName());
            logger.log(Level.SEVERE, ex.getMessage(), ex);
            System.exit(1);
        }
    }

    private static Connection getDatabaseConnection() throws SQLException
    {
        return DriverManager.getConnection(url, user, password);
    }

    private static MunicipalityRepository getMunicipalityRepository(Connection databaseConnection)
    {
        return new MunicipalityRepository(databaseConnection);
    }
}
