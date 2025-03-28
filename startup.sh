#!/bin/bash

# Configuration - Set these values!
DB_USER="devops"
DB_HOST="localhost"
SQL_FILE="./db/init.sql"  # Path to your SQL file

# Execute the SQL script
psql -h "$DB_HOST" -U "$DB_USER" -d postgres -f "$SQL_FILE"

echo "Database initialization complete!"