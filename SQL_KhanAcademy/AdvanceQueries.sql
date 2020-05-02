/*Challenge: Karaoke song selector - More complex queries with AND/OR*/
CREATE TABLE songs
(
    id INTEGER PRIMARY KEY,
    title TEXT,
    artist TEXT,
    mood TEXT,
    duration INTEGER,
    released INTEGER
);

INSERT INTO songs
    (title, artist, mood, duration, released)
VALUES
    ("Bohemian Rhapsody", "Queen", "epic", 60, 1975);
INSERT INTO songs
    (title, artist, mood, duration, released)
VALUES
    ("Let it go", "Idina Menzel", "epic", 227, 2013);
INSERT INTO songs
    (title, artist, mood, duration, released)
VALUES
    ("I will survive", "Gloria Gaynor", "epic", 198, 1978);
INSERT INTO songs
    (title, artist, mood, duration, released)
VALUES
    ("Twist and Shout", "The Beatles", "happy", 152, 1963);
INSERT INTO songs
    (title, artist, mood, duration, released)
VALUES
    ("La Bamba", "Ritchie Valens", "happy", 166, 1958);
INSERT INTO songs
    (title, artist, mood, duration, released)
VALUES
    ("I will always love you", "Whitney Houston", "epic", 273, 1992);
INSERT INTO songs
    (title, artist, mood, duration, released)
VALUES
    ("Sweet Caroline", "Neil Diamond", "happy", 201, 1969);
INSERT INTO songs
    (title, artist, mood, duration, released)
VALUES
    ("Call me maybe", "Carly Rae Jepsen", "happy", 193, 2011);

select title
from songs;
select title
from songs
where mood = "epic" or released > 1990;
select title
from songs
where mood = "epic" and released > 1990 and duration < 4*60;

/*Challenge: Playlist maker - Querying IN subqueries*/
CREATE TABLE artists (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    country TEXT,
    genre TEXT);

INSERT INTO artists
    (name, country, genre)
VALUES
    ("Taylor Swift", "US", "Pop");
INSERT INTO artists
    (name, country, genre)
VALUES
    ("Led Zeppelin", "US", "Hard rock");
INSERT INTO artists
    (name, country, genre)
VALUES
    ("ABBA", "Sweden", "Disco");
INSERT INTO artists
    (name, country, genre)
VALUES
    ("Queen", "UK", "Rock");
INSERT INTO artists
    (name, country, genre)
VALUES
    ("Celine Dion", "Canada", "Pop");
INSERT INTO artists
    (name, country, genre)
VALUES
    ("Meatloaf", "US", "Hard rock");
INSERT INTO artists
    (name, country, genre)
VALUES
    ("Garth Brooks", "US", "Country");
INSERT INTO artists
    (name, country, genre)
VALUES
    ("Shania Twain", "Canada", "Country");
INSERT INTO artists
    (name, country, genre)
VALUES
    ("Rihanna", "US", "Pop");
INSERT INTO artists
    (name, country, genre)
VALUES
    ("Guns N' Roses", "US", "Hard rock");
INSERT INTO artists
    (name, country, genre)
VALUES
    ("Gloria Estefan", "US", "Pop");
INSERT INTO artists
    (name, country, genre)
VALUES
    ("Bob Marley", "Jamaica", "Reggae");

CREATE TABLE songs (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    artist TEXT,
    title TEXT);

INSERT INTO songs
    (artist, title)
VALUES
    ("Taylor Swift", "Shake it off");
INSERT INTO songs
    (artist, title)
VALUES
    ("Rihanna", "Stay");
INSERT INTO songs
    (artist, title)
VALUES
    ("Celine Dion", "My heart will go on");
INSERT INTO songs
    (artist, title)
VALUES
    ("Celine Dion", "A new day has come");
INSERT INTO songs
    (artist, title)
VALUES
    ("Shania Twain", "Party for two");
INSERT INTO songs
    (artist, title)
VALUES
    ("Gloria Estefan", "Conga");
INSERT INTO songs
    (artist, title)
VALUES
    ("Led Zeppelin", "Stairway to heaven");
INSERT INTO songs
    (artist, title)
VALUES
    ("ABBA", "Mamma mia");
INSERT INTO songs
    (artist, title)
VALUES
    ("Queen", "Bicycle Race");
INSERT INTO songs
    (artist, title)
VALUES
    ("Queen", "Bohemian Rhapsody");
INSERT INTO songs
    (artist, title)
VALUES
    ("Guns N' Roses", "Don't cry");


select title
from songs
where artist = "Queen";
select name
from artists
where genre = "Pop";
select title
from songs
where artist in (select name
from artists
where genre = "Pop");

/*Challenge: The wordiest author - Having restriction*/
CREATE TABLE books (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    author TEXT,
    title TEXT,
    words INTEGER);

INSERT INTO books
    (author, title, words)
VALUES
    ("J.K. Rowling", "Harry Potter and the Philosopher's Stone", 79944);
INSERT INTO books
    (author, title, words)
VALUES
    ("J.K. Rowling", "Harry Potter and the Chamber of Secrets", 85141);
INSERT INTO books
    (author, title, words)
VALUES
    ("J.K. Rowling", "Harry Potter and the Prisoner of Azkaban", 107253);
INSERT INTO books
    (author, title, words)
VALUES
    ("J.K. Rowling", "Harry Potter and the Goblet of Fire", 190637);
INSERT INTO books
    (author, title, words)
VALUES
    ("J.K. Rowling", "Harry Potter and the Order of the Phoenix", 257045);
INSERT INTO books
    (author, title, words)
VALUES
    ("J.K. Rowling", "Harry Potter and the Half-Blood Prince", 168923);
INSERT INTO books
    (author, title, words)
VALUES
    ("J.K. Rowling", "Harry Potter and the Deathly Hallows", 197651);

INSERT INTO books
    (author, title, words)
VALUES
    ("Stephenie Meyer", "Twilight", 118501);
INSERT INTO books
    (author, title, words)
VALUES
    ("Stephenie Meyer", "New Moon", 132807);
INSERT INTO books
    (author, title, words)
VALUES
    ("Stephenie Meyer", "Eclipse", 147930);
INSERT INTO books
    (author, title, words)
VALUES
    ("Stephenie Meyer", "Breaking Dawn", 192196);

INSERT INTO books
    (author, title, words)
VALUES
    ("J.R.R. Tolkien", "The Hobbit", 95022);
INSERT INTO books
    (author, title, words)
VALUES
    ("J.R.R. Tolkien", "Fellowship of the Ring", 177227);
INSERT INTO books
    (author, title, words)
VALUES
    ("J.R.R. Tolkien", "Two Towers", 143436);
INSERT INTO books
    (author, title, words)
VALUES
    ("J.R.R. Tolkien", "Return of the King", 134462);

select author, sum(words) as "total_words"
from books
group by author
having total_words > 1000000
;
select author, avg(words) as "avg_words"
from books
group by author
having avg_words > 150000
;

/*Challenge: Gradebook - Case*/
CREATE TABLE student_grades (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    number_grade INTEGER,
    fraction_completed REAL);

INSERT INTO student_grades
    (name, number_grade, fraction_completed)
VALUES
    ("Winston", 90, 0.805);
INSERT INTO student_grades
    (name, number_grade, fraction_completed)
VALUES
    ("Winnefer", 95, 0.901);
INSERT INTO student_grades
    (name, number_grade, fraction_completed)
VALUES
    ("Winsteen", 85, 0.906);
INSERT INTO student_grades
    (name, number_grade, fraction_completed)
VALUES
    ("Wincifer", 66, 0.7054);
INSERT INTO student_grades
    (name, number_grade, fraction_completed)
VALUES
    ("Winster", 76, 0.5013);
INSERT INTO student_grades
    (name, number_grade, fraction_completed)
VALUES
    ("Winstonia", 82, 0.9045);

select name, number_grade, round(fraction_completed*100) as percent_completed
from student_grades;

select count(*),
    case
        when number_grade > 90 then "A"
        when number_grade > 80 then "B"
        when number_grade > 70 then "C"
        else "F"
    end as letter_grade
from student_grades
group by letter_grade
;

/*Project: Data ding*/
/* Put your data in here and query it! */
/*
Earned Badges
This table contains badges earned by a user, including the most recent date achieved, the type, the name, the # of energy points earned, and the activity earned from.
Collected by: https://www.khanacademy.org/profile/chopsor/
*/

CREATE TABLE badges
(
    date TEXT,
    badge_type TEXT,
    badge_name TEXT,
    energy_points INTEGER
);

INSERT INTO badges
    (date, badge_type, badge_name, energy_points)
VALUES
    ("2015, 04/12", "Sun", "Oracle", 0);
INSERT INTO badges
    (date, badge_type, badge_name, energy_points)
VALUES
    ("2015, 04/28", "Earth", "Incredible Inspiration", 5000);
INSERT INTO badges
    (date, badge_type, badge_name, energy_points)
VALUES
    ("2015, 01/29", "Challenge Patch", "Intro to JS: Drawing & Animation Mastery", 0);
INSERT INTO badges
    (date, badge_type, badge_name, energy_points)
VALUES
    ("2014, 12/05", "Meteorite", "Thumbs Up", 0);
INSERT INTO badges
    (date, badge_type, badge_name, energy_points)
VALUES
    ("2015, 04/28", "Moon", "1000 Kelvin", 1000);
INSERT INTO badges
    (date, badge_type, badge_name, energy_points)
VALUES
    ("2015, 04/25", "Earth", "299,792,458 Meters per Second", 5000);
INSERT INTO badges
    (date, badge_type, badge_name, energy_points)
VALUES
    ("2015, 03/20", "Sun", "Da Vinci", 200000);
INSERT INTO badges
    (date, badge_type, badge_name, energy_points)
VALUES
    ("2015, 03/02", "Sun", "Newton", 150000);
INSERT INTO badges
    (date, badge_type, badge_name, energy_points)
VALUES
    ("2015, 03/02", "Sun", "Hypatia", 125000);
INSERT INTO badges
    (date, badge_type, badge_name, energy_points)
VALUES
    ("2015, 02/24", "Sun", "Kepler", 125000);
INSERT INTO badges
    (date, badge_type, badge_name, energy_points)
VALUES
    ("2015, 02/24", "Sun", "Copernicus", 80000);
INSERT INTO badges
    (date, badge_type, badge_name, energy_points)
VALUES
    ("2015, 02/07", "Sun", "Sally Ride", 35000);
INSERT INTO badges
    (date, badge_type, badge_name, energy_points)
VALUES
    ("2015, 01/06", "Sun", "Magellan", 30000);
INSERT INTO badges
    (date, badge_type, badge_name, energy_points)
VALUES
    ("2015, 02/24", "Earth", "Guru", 0);
INSERT INTO badges
    (date, badge_type, badge_name, energy_points)
VALUES
    ("2014, 12/29", "Earth", "Work Horse", 14000);
INSERT INTO badges
    (date, badge_type, badge_name, energy_points)
VALUES
    ("2014, 10/20", "Moon", "Redwood", 0);
INSERT INTO badges
    (date, badge_type, badge_name, energy_points)
VALUES
    ("2013, 10/20", "Meteorite", "Cypress", 0);
INSERT INTO badges
    (date, badge_type, badge_name, energy_points)
VALUES
    ("2015, 03/18", "Sun", "Millionaire", 0);
INSERT INTO badges
    (date, badge_type, badge_name, energy_points)
VALUES
    ("2015, 02/27", "Earth", "Five Times Ten to the Fifth", 0);
INSERT INTO badges
    (date, badge_type, badge_name, energy_points)
VALUES
    ("2015, 04/04", "Earth", "Investigator", 0);

select *
from badges;
select badge_type, max(energy_points), avg(energy_points)
from badges
group by badge_type
;

select badge_name, avg(energy_points) as avg_energy
from badges
group by badge_name
having avg_energy > 0
;

select energy_points,
    case
        when date like '%2015%' and energy_points > 0 then "Energy by 2015"
        when date like '%2014%' and energy_points > 0 then "Energy by 2014"
        when date like '%2013%' and energy_points > 0 then "Energy by 2013"
        when energy_points = 0 then "Some years doesn't have Energy"
    end as energy_by_year
from badges
group by energy_by_year
;
