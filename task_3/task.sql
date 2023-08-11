create table staff(
id int unique auto_increment,
firstname varchar(45) not null,
lastname varchar(45) not null,
post varchar(45) not null,
seniority int null,
salary int,
age int
);



insert into staff (firstname,lastname,post,seniority,salary,age) values
('Вася', 'Петров', 'Начальник', '40', 100000, 60),
('Петр', 'Власов', 'Начальник', '8', 70000, 30),
('Катя', 'Катина', 'Инженер', '2', 70000, 25),
('Саша', 'Сасин', 'Инженер', '12', 50000, 35),
('Иван', 'Иванов', 'Рабочий', '40', 30000, 59),
('Петр', 'Петров', 'Рабочий', '20', 25000, 40),
('Сидр', 'Сидоров', 'Рабочий', '10', 20000, 35),
('Антон', 'Антонов', 'Рабочий', '8', 19000, 28),
('Юрий', 'Юрков', 'Рабочий', '5', 15000, 25),
('Максим', 'Максимов', 'Рабочий', '2', 11000, 22),
('Юрий', 'Галкин', 'Рабочий', '3', 12000, 24),
('Людмила', 'Маркина', 'Уборщик', '10', 10000, 49);

#1. Отсортируйте данные по полюзаработная плата (salary) в порядке: убывания; возрастания 
select * from staff order by salary;
select * from staff order by salary desc;
#2. Выведите 5 максимальных заработных плат (saraly) 
select * from staff order by salary desc limit 5;
#3. Посчитайте суммарную зарплату (salary)по каждой специальности(роst) 
select post,sum(salary) from staff group by post;
#4. Найдите кол-во сотрудников с специальностью (post)«Рабочий»в возрасте от 24 до 49 лет включительно. 
select count(post) from staff where post = "Рабочий" and age >=24 and age <=49;
#5. Найдите количество специальностей 
select count(DISTINCT post) from staff;
#6. Выведите специальности, у которых средний возраст сотрудников меньше 30 лет 
select post, avg(age) from staff group by post having avg(age) <= 30;
