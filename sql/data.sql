-- CATEGORIES
INSERT INTO expense_category (id, name, sort)
VALUES (1, 'living', 1);
INSERT INTO expense_category (id, name, sort)
VALUES (2, 'mobility', 2);
INSERT INTO expense_category (id, name, sort)
VALUES (3, 'insurance', 3);
INSERT INTO expense_category (id, name, sort)
VALUES (4, 'personal', 4);
INSERT INTO expense_category (id, name, sort)
VALUES (5, 'leisure', 5);
INSERT INTO expense_category (id, name, sort)
VALUES (6, 'donations', 7);
INSERT INTO expense_category (id, name, sort)
VALUES (7, 'clubs', 6);

-- TIME PERIODS
INSERT INTO expense_time_periods (id, name)
VALUES (1, 'month');
INSERT INTO expense_time_periods (id, name)
VALUES (2, 'year');


-- MONTHLY EXPENSES
INSERT INTO monthly_expenses (id, expense_category_id, name, amount, is_tax_deductible, cancellation_notes,
                              expense_time_periods_id)
VALUES (1, 1, 'Rent', 300, 0, '3 Monate Kündingsfrist', 1);
INSERT INTO monthly_expenses (id, expense_category_id, name, amount, is_tax_deductible, cancellation_notes,
                              expense_time_periods_id)
VALUES (3, 2, 'Klimaticket', 1179, 0, 'valid for 1 year', 2);
INSERT INTO monthly_expenses (id, expense_category_id, name, amount, is_tax_deductible, cancellation_notes,
                              expense_time_periods_id)
VALUES (7, 4, 'cellphone provider', 6, 0, 'end of month', 1);
INSERT INTO monthly_expenses (id, expense_category_id, name, amount, is_tax_deductible, cancellation_notes,
                              expense_time_periods_id)
VALUES (8, 4, 'Internet', 25, 1, 'todo: check', 1);
INSERT INTO monthly_expenses (id, expense_category_id, name, amount, is_tax_deductible, cancellation_notes,
                              expense_time_periods_id)
VALUES (9, 5, 'Alpenverein', 60, 0, 'end of year', 2);
INSERT INTO monthly_expenses (id, expense_category_id, name, amount, is_tax_deductible, cancellation_notes,
                              expense_time_periods_id)
VALUES (10, 5, 'music provider', 10, 0, 'always', 1);
INSERT INTO monthly_expenses (id, expense_category_id, name, amount, is_tax_deductible, cancellation_notes,
                              expense_time_periods_id)
VALUES (11, 5, 'Obsidian', 99, 1, 'end of year', 2);
INSERT INTO monthly_expenses (id, expense_category_id, name, amount, is_tax_deductible, cancellation_notes,
                              expense_time_periods_id)
VALUES (13, 6, 'Amnesty', 80, 1, 'always', 2);
INSERT INTO monthly_expenses (id, expense_category_id, name, amount, is_tax_deductible, cancellation_notes,
                              expense_time_periods_id)
VALUES (24, 6, 'Greenpeace', 80, 1, 'always', 2);
INSERT INTO monthly_expenses (id, expense_category_id, name, amount, is_tax_deductible, cancellation_notes,
                              expense_time_periods_id)
VALUES (25, 5, 'newspaper', 200, 0, 'end of year', 2);
INSERT INTO monthly_expenses (id, expense_category_id, name, amount, is_tax_deductible, cancellation_notes,
                              expense_time_periods_id)
VALUES (26, 3, 'health insurance', 50, 0, 'very weird terms...', 1);
INSERT INTO monthly_expenses (id, expense_category_id, name, amount, is_tax_deductible, cancellation_notes,
                              expense_time_periods_id)
VALUES (27, 3, 'accident insurance', 20, 0, 'also weird terms', 1);
