package io.kotos;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class MunicipalityRepository
{
    private Connection databaseConnection;

    public MunicipalityRepository(Connection databaseConnection)
    {
        this.databaseConnection = databaseConnection;
    }

    public Municipality getMunicipality() throws SQLException
    {
        String query = "SELECT municipality_id, name, type FROM municipality WHERE name = 'Bridgeport' AND type = 'city';";
        Statement statement = databaseConnection.createStatement();
        ResultSet resultSet = statement.executeQuery(query);

        if (resultSet.next()) {
            Municipality municipality = new Municipality();
            municipality.setMunicipalityId(resultSet.getInt(1));
            municipality.setName(resultSet.getString(2));
            municipality.setType(resultSet.getString(3));

            return municipality;
        }

        return null;
    }
}
