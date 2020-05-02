/* Challenge: Book list database - Creating a table and inserting data*/
CREATE TABLE favorite_books
(
    id INTEGER PRIMARY KEY,
    name TEXT,
    rating INTEGER
);

INSERT INTO favorite_books
VALUES
    (1, 'CIEN ANHOS DE SOLEDAD', 5);
INSERT into favorite_books
values
    (2, 'le petit prince', 4);
INSERT into favorite_books
values
    (3, 'Meu pe de laranja lima', 0);

select *
from favorite_books

/*Challenge: Box office hits database - Querying the table*/
CREATE TABLE movies
(
    id INTEGER PRIMARY KEY,
    name TEXT,
    release_year INTEGER
);
INSERT INTO movies
VALUES
    (1, "Avatar", 2009);
INSERT INTO movies
VALUES
    (2, "Titanic", 1997);
INSERT INTO movies
VALUES
    (3, "Star Wars: Episode IV - A New Hope", 1977);
INSERT INTO movies
VALUES
    (4, "Shrek 2", 2004);
INSERT INTO movies
VALUES
    (5, "The Lion King", 1994);
INSERT INTO movies
VALUES
    (6, "Disney's Up", 2009);

select *
from movies;
select *
from movies
where release_year >= 2000
order by release_year;

/*Challenge: TODO list database stats - Aggregating list*/
CREATE TABLE todo_list
(
    id INTEGER PRIMARY KEY,
    item TEXT,
    minutes INTEGER
);
INSERT INTO todo_list
VALUES
    (1, "Wash the dishes", 15);
INSERT INTO todo_list
VALUES
    (2, "vacuuming", 20);
INSERT INTO todo_list
VALUES
    (3, "Learn some stuff on KA", 30);
insert into todo_list
values
    (4, "Laundry", 5);

select sum(minutes)
from todo_list;

/*Project: Design a store database*/
create table restaurant
(
    ID integer primary key,
    name text,
    vegetarian text,
    price numeric,
    raiting real
);

insert into restaurant
values
    (1, 'rice', 'yes', 1.5, 5);
insert into restaurant
values
    (2, 'meat soup', 'no', 5, 5);
insert into restaurant
values
    (3, 'bean soup', 'yes', 3, 4);
insert into restaurant
values
    (4, 'fried chiken', 'no', 8, 5);
insert into restaurant
values
    (5, 'fried chips', 'yes', 2, 1);
insert into restaurant
values
    (6, 'shrimp salad', 'no', 10, 4);
insert into restaurant
values
    (7, 'kebab', 'no', 5.5, 3);
insert into restaurant
values
    (8, 'natural juice', 'yes', 5, 5);
insert into restaurant
values
    (9, 'hamburger', 'no', 6, 5);
insert into restaurant
values
    (10, 'chocolat dessert', 'yes', 3.5, 5);
insert into restaurant
values
    (11, 'caesar salad', 'no', 10.5, 3);
insert into restaurant
values
    (12, 'cuscus', 'no', 3, 4.5);
insert into restaurant
values
    (13, 'hot dog', 'no', 3.9, 5);
insert into restaurant
values
    (14, 'pizza', 'no', 8.2, 4);
insert into restaurant
values
    (15, 'wine', 'yes', 80, 4.5);

select name, price
from restaurant
order by raiting;
select vegetarian, avg(price)
from restaurant
group by vegetarian;
