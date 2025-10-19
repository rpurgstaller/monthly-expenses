#! /usr/bin/bash

DB_NAME="data.db"

sqlite3 "$DB_NAME" <<EOF
.read sql/ddl.sql
.read sql/create_views.sql
.read sql/data.sql
EOF

echo "Database '$DB_NAME' initialized."
