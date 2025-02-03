
# Task Management Helper Application

This is a Task Management Helper Application built using Java Servlets and JSP. The application allows users to create projects and tasks, assign them to users, and manage task statuses. The architecture is based on the **MVC (Model-View-Controller)** pattern, providing a clear separation of concerns and ensuring easy maintenance and scalability.

## Features
- Create users
- Create projects
- Create and manage project tasks.
- Assign projects and tasks to users.
- Validate input using service layer.
- Persistent data storage using PostgreSQL database.

## Architecture Overview
The architecture of the application is designed following the **MVC** pattern:
- **Model**: Data entities represented by POJOs (Plain Old Java Objects).
- **View**: JSP pages responsible for rendering the UI.
- **Controller**: Servlets that handle incoming HTTP requests and interact with the service layer and DAO layer to process business logic.

### Components
- **Servlets**: Handle user requests and interact with the service layer to process business logic.
- **DAO Layer**: Handles database operations such as saving, updating, and retrieving tasks from the PostgreSQL database.
- **Service Layer**: Contains business logic and validation rules.
- **Filters**: Used to intercept requests and perform tasks such as authentication or logging.
- **POJOs**: Represent the task and user entities.

## Database Setup
The PostgreSQL database is managed with Docker. The necessary database schema script is included in the `/resources` folder.

### To Set Up the Database:
1. Ensure Docker is installed.
2. Navigate to the `resources` folder.
3. Run the `docker-compose.yml` file to start the PostgreSQL container.
   ```bash
   docker-compose up
   ```
4. The database will be automatically set up with the required schema.

## Project Setup

### Prerequisites:
- JDK 8 or higher
- Apache Tomcat
- pgAdmin (optional)
- Docker (for setting up the database)

### Steps to Run:
1. Clone the repository to your local machine.
2. Compile the project using Maven or your preferred build tool.
3. Deploy the WAR file to your Tomcat server.
4. Access the application through `http://localhost:8080/taskManagementHelper/home`.

### Running the Docker PostgreSQL Container:
1. Run the following command in the terminal to start the database:
   ```bash
   docker-compose up
   ```
2. The database will be available at `localhost:5433`(you can change the port by changing the port in the docker-compose file and config.property file).

## Directory Structure

```
/src/main/java
    /com/techbydev
        /model (POJOs)
        /dao (DAO layer for DB operations)
        /services (Service layer for business logic and validations)
        /servlets (Servlets)
        /filter (Filters for requests)
        /utils (Configuration loads)
    /resources
        - docker-compose.yml (for setting up PostgreSQL)
        - db_script.sql (Database schema script)
        - config.properties (project global configurations)
    /webapp (include jsp files)
```

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

