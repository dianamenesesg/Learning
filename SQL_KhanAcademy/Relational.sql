/*Challenge: Bobby's Hobbies - Related tables */
CREATE TABLE persons (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    age INTEGER);

INSERT INTO persons
    (name, age)
VALUES
    ("Bobby McBobbyFace", 12);
INSERT INTO persons
    (name, age)
VALUES
    ("Lucy BoBucie", 25);
INSERT INTO persons
    (name, age)
VALUES
    ("Banana FoFanna", 14);
INSERT INTO persons
    (name, age)
VALUES
    ("Shish Kabob", 20);
INSERT INTO persons
    (name, age)
VALUES
    ("Fluffy Sparkles", 8);

CREATE table hobbies (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    person_id INTEGER,
    name TEXT);

INSERT INTO hobbies
    (person_id, name)
VALUES
    (1, "drawing");
INSERT INTO hobbies
    (person_id, name)
VALUES
    (1, "coding");
INSERT INTO hobbies
    (person_id, name)
VALUES
    (2, "dancing");
INSERT INTO hobbies
    (person_id, name)
VALUES
    (2, "coding");
INSERT INTO hobbies
    (person_id, name)
VALUES
    (3, "skating");
INSERT INTO hobbies
    (person_id, name)
VALUES
    (3, "rowing");
INSERT INTO hobbies
    (person_id, name)
VALUES
    (3, "drawing");
INSERT INTO hobbies
    (person_id, name)
VALUES
    (4, "coding");
INSERT INTO hobbies
    (person_id, name)
VALUES
    (4, "dilly-dallying");
INSERT INTO hobbies
    (person_id, name)
VALUES
    (4, "meowing");

/* new person */
insert into persons
    (name, age)
values
    ('marty mcfly', 17);
insert into hobbies
    (person_id, name)
values
    (6, 'fly');

select persons.name, hobbies.name
from persons
    join hobbies
    on persons.id = hobbies.person_id
;

select persons.name, hobbies.name
from persons
    join hobbies
    on persons.id = hobbies.person_id
where persons.name like '%Bobby%'
;

/*Challenge: Customer's orders - Left join*/
CREATE TABLE customers (
    id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, email TEXT);

INSERT INTO customers
    (name, email)
VALUES
    ("Doctor Who", "doctorwho@timelords.com");
INSERT INTO customers
    (name, email)
VALUES
    ("Harry Potter", "harry@potter.com");
INSERT INTO customers
    (name, email)
VALUES
    ("Captain Awesome", "captain@awesome.com");

CREATE TABLE orders (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    customer_id INTEGER,
    item TEXT,
    price REAL);

INSERT INTO orders
    (customer_id, item, price)
VALUES
    (1, "Sonic Screwdriver", 1000.00);
INSERT INTO orders
    (customer_id, item, price)
VALUES
    (2, "High Quality Broomstick", 40.00);
INSERT INTO orders
    (customer_id, item, price)
VALUES
    (1, "TARDIS", 1000000.00);

select customers.name, customers.email, orders.item, orders.price
from customers
    left outer join orders
    on customers.id = orders.customer_id
;
select customers.name, customers.email, sum(orders.price) as total
from customers
    left outer join orders
    on customers.id = orders.customer_id
group by customers.name
order by total desc
;

/*Challenge: Sequels in SQL - self join*/
CREATE TABLE movies (id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT,
    released INTEGER,
    sequel_id INTEGER);

INSERT INTO movies
VALUES
    (1, "Harry Potter and the Philosopher's Stone", 2001, 2);
INSERT INTO movies
VALUES
    (2, "Harry Potter and the Chamber of Secrets", 2002, 3);
INSERT INTO movies
VALUES
    (3, "Harry Potter and the Prisoner of Azkaban", 2004, 4);
INSERT INTO movies
VALUES
    (4, "Harry Potter and the Goblet of Fire", 2005, 5);
INSERT INTO movies
VALUES
    (5, "Harry Potter and the Order of the Phoenix ", 2007, 6);
INSERT INTO movies
VALUES
    (6, "Harry Potter and the Half-Blood Prince", 2009, 7);
INSERT INTO movies
VALUES
    (7, "Harry Potter and the Deathly Hallows – Part 1", 2010, 8);
INSERT INTO movies
VALUES
    (8, "Harry Potter and the Deathly Hallows – Part 2", 2011, NULL);

select *
from movies;

/* We've created a table with all the 'Harry Potter' movies, with a sequel_id column that matches the id of the sequel for each movie. Issue a SELECT that will show the title of each movie next to its sequel's title (or NULL if it doesn't have a sequel). */
select movies.title, movies_sequel.title as sequel
from movies
    left outer join movies movies_sequel
    on movies.sequel_id = movies_sequel.id
;

/*Challenge: FriendBook - Multiple join*/
CREATE TABLE persons (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    fullname TEXT,
    age INTEGER);

INSERT INTO persons
    (fullname, age)
VALUES
    ("Bobby McBobbyFace", "12");
INSERT INTO persons
    (fullname, age)
VALUES
    ("Lucy BoBucie", "25");
INSERT INTO persons
    (fullname, age)
VALUES
    ("Banana FoFanna", "14");
INSERT INTO persons
    (fullname, age)
VALUES
    ("Shish Kabob", "20");
INSERT INTO persons
    (fullname, age)
VALUES
    ("Fluffy Sparkles", "8");

CREATE table hobbies (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    person_id INTEGER,
    name TEXT);

INSERT INTO hobbies
    (person_id, name)
VALUES
    (1, "drawing");
INSERT INTO hobbies
    (person_id, name)
VALUES
    (1, "coding");
INSERT INTO hobbies
    (person_id, name)
VALUES
    (2, "dancing");
INSERT INTO hobbies
    (person_id, name)
VALUES
    (2, "coding");
INSERT INTO hobbies
    (person_id, name)
VALUES
    (3, "skating");
INSERT INTO hobbies
    (person_id, name)
VALUES
    (3, "rowing");
INSERT INTO hobbies
    (person_id, name)
VALUES
    (3, "drawing");
INSERT INTO hobbies
    (person_id, name)
VALUES
    (4, "coding");
INSERT INTO hobbies
    (person_id, name)
VALUES
    (4, "dilly-dallying");
INSERT INTO hobbies
    (person_id, name)
VALUES
    (4, "meowing");

CREATE table friends (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    person1_id INTEGER,
    person2_id INTEGER);

INSERT INTO friends
    (person1_id, person2_id)
VALUES
    (1, 4);
INSERT INTO friends
    (person1_id, person2_id)
VALUES
    (2, 3);

/* We've created a database for a friend networking site, with a table storing data on each person, a table on each person's hobbies, and a table of friend connections between the people. In this first step, use a JOIN to display a table showing people's names with their hobbies. */

select persons.fullname, hobbies.name
from persons
    join hobbies
    on persons.id = hobbies.person_id
;

/* Now, use another SELECT with a JOIN to show the names of each pair of friends, based on the data in the friends table. */

select pA_table.fullname, pB_table.fullname
from friends
    join persons pA_table
    on friends.person1_id = pA_table.id
    join persons pB_table
    on friends.person2_id = pB_table.id
;

/*Project: Famous people */
/* Create table about the people and what they do here */
/* In this project, you’re going to make your own table with some small set of “famous people”, then make more tables about things they do and join those to create nice human readable lists.

For example, here are types of famous people and the questions your data could answer:

Movie stars: What movies are they in? Are they married to each other?
Singers: What songs did they write? Where are they from?
Authors: What books did they write?
Fictional characters: How are they related to other characters? What books do they show up in? */

create table famous
(
    id integer primary key,
    artist_name text,
    manager_name text
);
insert into famous
    (artist_name, manager_name)
values
    ('JLo', 'Amanager');
insert into famous
    (artist_name, manager_name)
values
    ('beyonce', 'Bmanager');
insert into famous
    (artist_name, manager_name)
values
    ('Sia', 'Amanager');
insert into famous
    (artist_name, manager_name)
values
    ('Rhianna', 'Cmanager');
insert into famous
    (artist_name, manager_name)
values
    ('Corine', 'Cmanager');
insert into famous
    (artist_name, manager_name)
values
    ('Shakira', 'Kmanager');
insert into famous
    (artist_name, manager_name)
values
    ('Madona', 'Smanager');
insert into famous
    (artist_name, manager_name)
values
    ('Liniker', 'Jmanager');
insert into famous
    (artist_name, manager_name)
values
    ('Lafourcade', 'Zmanager');
insert into famous
    (artist_name, manager_name)
values
    ('Catalina Garcia', 'Dmanager');
insert into famous
    (artist_name, manager_name)
values
    ('Andrea Echeverry', 'Ymanager');
insert into famous
    (artist_name, manager_name)
values
    ('Bethania', 'Qmanager');
insert into famous
    (artist_name, manager_name)
values
    ('Omara Portuondo', 'Pmanager');
insert into famous
    (artist_name, manager_name)
values
    ('Gloria Trevi', 'Jmanager');
insert into famous
    (artist_name, manager_name)
values
    ('Mercedes Sosa', 'Emanager');
insert into famous
    (artist_name, manager_name)
values
    ('Marisa Montes', 'Lmanager');
select *
from famous;

create table bussines
(
    id integer primary key,
    artist_id integer,
    pricipal_field text
);
insert into bussines
    (artist_id, pricipal_field)
values
    (1, 'self reinvention');
insert into bussines
    (artist_id, pricipal_field)
values
    (2, 'show-woman');
insert into bussines
    (artist_id, pricipal_field)
values
    (3, 'be fabolous');
insert into bussines
    (artist_id, pricipal_field)
values
    (4, 'be complete');
insert into bussines
    (artist_id, pricipal_field)
values
    (5, 'Monsieur Perine');
insert into bussines
    (artist_id, pricipal_field)
values
    (6, 'businesswoman');
insert into bussines
    (artist_id, pricipal_field)
values
    (7, 'be fabolous');
insert into bussines
    (artist_id, pricipal_field)
values
    (8, 'warrior');
insert into bussines
    (artist_id, pricipal_field)
values
    (9, 'transformer');
insert into bussines
    (artist_id, pricipal_field)
values
    (10, 'Monsieur Perine');
insert into bussines
    (artist_id, pricipal_field)
values
    (11, 'activist');
insert into bussines
    (artist_id, pricipal_field)
values
    (12, 'pacifier');
insert into bussines
    (artist_id, pricipal_field)
values
    (13, 'be fantastic');
insert into bussines
    (artist_id, pricipal_field)
values
    (14, 'reinvention');
insert into bussines
    (artist_id, pricipal_field)
values
    (15, 'perfect singer');
insert into bussines
    (artist_id, pricipal_field)
values
    (16, 'multiinstrumentalist');
select *
from bussines;

create table artist_field
(
    id integer primary key,
    artist integer,
    field integer
);
insert into artist_field
    (artist, field)
values
    (1, 2);
insert into artist_field
    (artist, field)
values
    (2, 1);
insert into artist_field
    (artist, field)
values
    (3, 4);
insert into artist_field
    (artist, field)
values
    (4, 3);
insert into artist_field
    (artist, field)
values
    (5, 5);

insert into artist_field
    (artist, field)
values
    (6, 10);
insert into artist_field
    (artist, field)
values
    (7, 6);
insert into artist_field
    (artist, field)
values
    (8, 8);
insert into artist_field
    (artist, field)
values
    (9, 7);
insert into artist_field
    (artist, field)
values
    (10, 9);

insert into artist_field
    (artist, field)
values
    (11, 16);
insert into artist_field
    (artist, field)
values
    (12, 13);
insert into artist_field
    (artist, field)
values
    (13, 14);
insert into artist_field
    (artist, field)
values
    (14, 12);
insert into artist_field
    (artist, field)
values
    (15, 15);
insert into artist_field
    (artist, field)
values
    (16, 11);
select *
from artist_field;

select f.artist_name, b.pricipal_field
from artist_field
    join famous f
    on artist_field.artist = f.id
    join bussines b
    on artist_field.field = b.artist_id


