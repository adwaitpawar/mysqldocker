# Use the official Microsoft SQL Server 2019 image as the base image
FROM mcr.microsoft.com/mssql/server:2019-latest

# Set environment variables for SQL Server configuration
ENV SA_PASSWORD=password@12345
ENV ACCEPT_EULA=Y
ENV MSSQL_PID=Express

# Create a directory to copy initialization scripts
WORKDIR /usr/src/app

# Copy the SQL Server initialization script into the container
COPY init.sql .

# Grant permissions for the SQL Server initialization script
RUN chmod +x ./init.sql

# Run the SQL Server initialization script when the container starts
CMD /bin/bash ./entrypoint.sh
