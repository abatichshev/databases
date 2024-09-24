create database lab2;

create table countries(
    country_id serial primary key,
    country_name varchar(30),
    region_id int,
    population int
);

insert into countries (country_name, region_id, population)
values
('Belgium',57 , 84848485);

insert into countries (country_id, country_name)
values
(2,'Mexico');

insert into countries (country_name, region_id, population)
values ('Unknown Country', NULL, 55555);

insert into countries (country_name, region_id, population)
values
('USA','5', 30050000),
('UK','17', 27000000),
('Latvia','7', 4250000);

alter table countries
alter country_name set default 'Kazakhstan';

insert into countries (region_id, population)
values
(15, 19700000);

insert into countries default values;

create table countries_new (like countries including all);

insert into countries_new select * from countries;

update countries
set region_id = 1
where region_id is NULL;

select country_name, population * 1.10 as "New Population"
from countries;

delete from countries
where population < 100000
returning *;

delete from countries_new
where country_id in (select country_id from countries)
returning *;

delete from countries
returning *;