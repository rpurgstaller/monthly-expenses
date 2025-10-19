CREATE VIEW monthly_expenses_v AS
    select ec.name as category,
           me.name as expense_name,
           case
               when ep.name = 'year' then round(amount/12, 2)
               when ep.name = 'month' then amount
           end as amount_per_month,
           case
               when ep.name = 'year' then amount
               when ep.name = 'month' then amount*12
           end as amount_per_year,
           case when me.is_tax_deductible then 'x' end as is_tax_deductible,
           me.cancellation_notes
    from monthly_expenses me
    join expense_category ec on me.expense_category_id = ec.id
    join expense_time_periods ep on me.expense_time_periods_id = ep.id
    order by ec.sort, me.name
;

CREATE VIEW monthly_expenses_md_v AS
    select me.category as Kategorie,
           me.expense_name as Ausgabe,
           me.amount_per_month as "Betrag pro Monat",
           me.amount_per_year as "Betrag pro Jahr",
           me.is_tax_deductible as "steuerlich absetzbar",
           me.cancellation_notes as "Kündigung/Fristen"
    from monthly_expenses_v me
    union all
    select null,
           null,
           round(sum(me_sum.amount_per_month), 2),
           round(sum(me_sum.amount_per_year), 2),
           null,
           null
    from monthly_expenses_v me_sum
;

CREATE VIEW monthly_expenses_tax_deductible_v AS
    select me.*
    from monthly_expenses_v me
    where is_tax_deductible = 'x'
;