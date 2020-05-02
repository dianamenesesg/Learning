/*Challenge: Dynamic Documents - Changing rows*/
CREATE table documents (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT,
    content TEXT,
    author TEXT);

INSERT INTO documents
    (author, title, content)
VALUES
    ("Puff T.M. Dragon", "Fancy Stuff", "Ceiling wax, dragon wings, etc.");
INSERT INTO documents
    (author, title, content)
VALUES
    ("Puff T.M. Dragon", "Living Things", "They're located in the left ear, you know.");
INSERT INTO documents
    (author, title, content)
VALUES
    ("Jackie Paper", "Pirate Recipes", "Cherry pie, apple pie, blueberry pie.");
INSERT INTO documents
    (author, title, content)
VALUES
    ("Jackie Paper", "Boat Supplies", "Rudder - guitar. Main mast - bed post.");
INSERT INTO documents
    (author, title, content)
VALUES
    ("Jackie Paper", "Things I'm Afraid Of", "Talking to my parents, the sea, giant pirates, heights.");

SELECT *
FROM documents;

update documents 
    set title = "Jackie Draper"
    where title like "%Jackie Paper%"
;
SELECT *
FROM documents;

delete from documents
    where title like "%Things I'm Afraid Of%"
;
select *
from documents

/*Challenge: Clothing alterations - Alter after creation*/
CREATE TABLE clothes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    type TEXT,
    design TEXT);

INSERT INTO clothes
    (type, design)
VALUES
    ("dress", "pink polka dots");
INSERT INTO clothes
    (type, design)
VALUES
    ("pants", "rainbow tie-dye");
INSERT INTO clothes
    (type, design)
VALUES
    ("blazer", "black sequin");

alter table clothes
    add price integer
    default "unknow"
    ;
select *
from clothes;

update clothes set price = 10 where id = 1;
update clothes set price = 20 where id = 2;
update clothes set price = 30 where id = 3;
select *
from clothes;

insert into clothes
    (type, design, price)
values('scarf', 'my_self', 100)
;
select *
from clothes;

/*Project: App impersonator*/
/* What does the app's SQL look like? */
/* Pocket */

create table pck
(
    id integer primary key,
    user_name text,
    site_stored text,
    date text
);

begin transaction;
insert into pck
    (user_name, site_stored, date)
values
    ('Diana', 'khanacademy.org', '01-05-2019');
insert into pck
    (user_name, site_stored, date)
values
    ('Diana', 'Udacity.com', '25-11-2018');
insert into pck
    (user_name, site_stored, date)
values
    ('Binario', 'Whiskas.com', '24-04-2017');
insert into pck
    (user_name, site_stored, date)
values
    ('Binario', 'food_really_expenseive.com', '31-10-2018');
insert into pck
    (user_name, site_stored, date)
values
    ('Binario', 'petz_promotions', '04-03-2020');
commit;

select *
from pck;

update pck 
    set site_stored = 'purina.com'
    where id = 3
;

delete from pck
    where 
    site_stored = 'food_really_expenseive.com'
    and
    user_name = 'Binario'
;
select *
from pck;

