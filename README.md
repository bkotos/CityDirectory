# CityDirectory
## Getting Started
This project requires you to have the following installed:
```
java >= 11
maven >= 3.6.0
docker-ce >= 19
docker-compose >= 1.24.1
```

To run this application, do the following:

1. Start the MySQL database:
```
make start-db
```

2. Compile the Java code:
```
make compile
```

3. Run the project:
```
make run
```

## Project Structure
- [App.java](src/main/java/io/kotos/App.java) - Project entry point, which interacts with dependencies and writes to stdout.
- [Municipality.java](src/main/java/io/kotos/Municipality.java) - POJO mapping to the result of our SQL query.
- [MunicipalityRepository.java](src/main/java/io/kotos/MunicipalityRepository.java) - Data access layer logic for querying our MySQL database.
- [schema.sql](docker/mysql/schema.sql) - MySQL database schema.
