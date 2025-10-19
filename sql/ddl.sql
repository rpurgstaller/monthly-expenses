create table expense_category
(
    id   integer
        primary key autoincrement,
    name,
    sort integer
);

create table expense_time_periods
(
    id   integer
        primary key autoincrement,
    name TEXT(64)
);

create table monthly_expenses
(
    id                      integer
        primary key autoincrement,
    expense_category_id     integer
        references expense_category,
    name                    varchar2(128),
    amount                  float,
    is_tax_deductible       boolean default 0,
    cancellation_notes      text,
    expense_time_periods_id integer
        references expense_time_periods
);

