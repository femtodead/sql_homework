#1.Создайтепредставление,в которое попадет информация о пользователях(имя,фамилия, город и пол),которые нестарше 20 лет. 
create or replace view user_20 as
select u.firstname,u.lastname,p.hometown,p.gender from profiles as p
join users as u on u.id = p.user_id
 where birthday > '2003-01-01';
select * from user_20;
#2.Найдите кол-во,отправленных сообщений каждым пользователем и выведите ранжированный список пользователей,
#указав имя и фамилию пользователя,
#количество отправленных сообщений и место в рейтинге(первое место у пользователя с максимальным количеством сообщений).(используйте DENSE_RANK) 
create or replace view user_msg as
select u.firstname, u.lastname, m.from_user_id
,count(from_user_id) over(partition by from_user_id) as count_m 
 from messages as m
join users as u on u.id = m.from_user_id
order by u.id;
select  *,
 dense_rank() over (order by count_m desc) as rang from user_msg 
 group by from_user_id;
#3.Выберите все сообщения,отсортируйте сообщения по возрастанию даты отправления (created_at)и найдите разницу дат отправления между соседними сообщениями
#,получившегося списка.(используйте LEAD или LAG)
create or replace view date_m as
select *,  (lag(created_at,1,created_at) over (order by created_at)) as время_следующего_сообщения from messages;
select *,TIMESTAMPDIFF(minute, время_следующего_сообщения,created_at) as разница from date_m;
