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
    select null, null, round(sum(me_sum.amount_per_month), 2), round(sum(me_sum.amount_per_year), 2), null, null
    from monthly_expenses_v me_sum
;

CREATE VIEW monthly_expenses_tax_deductible_v AS
    select me.*
    from monthly_expenses_v me
    where is_tax_deductible = 'x'
;

CREATE VIEW personal_data_access_v AS
    select pde.id as entity_id,
           pde.name as entity_name,
           pdt.id as type_id,
           pdt.name as type_name
    from personal_data_access a
    join personal_data_type pdt on a.personal_data_type_id = pdt.id
    join personal_data_entity pde on a.personal_data_entity_id = pde.id
;
drop view personal_data_access_v
;
select * from personal_data_access_v order by entity_name
;

insert into personal_data_entity (name)
values ('oebb'), ('economist'), ('profil'), ('sparkasse'), ('flatex'), ('scalable')
     , ('willbe'), ('helpm'), ('Voestalpine'), ('City Adventure Center'), ('Uniqa'), ('ÖGK')
     , ('Finanzonline'), ('Alpenverein'), ('Sportunion Graz')

;

insert into personal_data_access (personal_data_type_id, personal_data_entity_id)
select 4, id from personal_data_entity
where name in ('Uniqa', 'City Adventure Center', 'Voestalpine')

delete from personal_data_access where personal_data_entity_id = 17 and personal_data_type_id = 4
