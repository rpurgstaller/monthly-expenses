#! /usr/bin/bash

sqlite3 data.db ".read sql/monthly-expenses-to-md.sql" > monthly_expenses.md
