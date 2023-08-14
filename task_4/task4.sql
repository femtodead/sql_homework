#1. Подсчитать общее количество лайков, которые получилипользователи младше 12 лет.
select u.firstname ,p.birthday, count(*) as alllick from likes as l
join media as m on m.id = l.media_id
join users as u on m.user_id = u.id
join profiles as p on u.id = p.user_id
where p.birthday > '2011-01-01'group by firstname,p.birthday;

#Определить кто больше поставиллайков(всего): мужчины или женщины.
select gender, count(*) as licks from likes as l
join media as m on m.id = l.media_id
join users as u on m.user_id = u.id
join profiles as p on l.user_id = p.user_id
group by gender;

#Вывести всех пользователей, которые не отправляли сообщения.

select * from users where id not in (select from_user_id from messages);
