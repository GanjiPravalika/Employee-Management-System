#!/bin/bash

echo "Setting up the Database for the application...."
echo "Make sure you have the mysql server running and mysql client installed on your machine"

mysql -u root -p < /Resources/Script.sql
