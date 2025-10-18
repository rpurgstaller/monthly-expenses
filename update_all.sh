#! /usr/bin/bash

sqlite3 data.db ".read sql/data_as_md.sql" > monthly_expenses.md
