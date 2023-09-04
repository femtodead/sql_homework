CREATE TABLE `semimar_4`.`user_old` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(45) NOT NULL,
  `lastname` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE); # создал таблицу
  
  DROP PROCEDURE IF EXISTS transfer_user;
  
  DELIMITER //
  
  create procedure transfer_user (user_id int)
  begin 
  
  start transaction;
  insert into user_old (firstname,lastname,email) values
  ((select firstname from users where id = user_id),
  (select lastname from users where id = user_id),
  (select email from users where id = user_id));
	commit ;
    
  end //
  
   DELIMITER ;
   
   call transfer_user(2); # выбираем id полдьзователя из таблици users и процедура дабаляет его в новую табличкуalter
   
   
   # 2
   
DROP FUNCTION IF EXISTS hello;

DELIMITER //

CREATE FUNCTION hello()
RETURNS VARCHAR(45) READS SQL DATA
BEGIN
SET @time = (SELECT CURTIME()); 

SET @hello = (
case 
when @time > '06:00:00' and  @time < '11:59:59' then  "Доброе утро"
when @time > '12:00:00' and  @time < '17:59:59' then  "Добрый день"
when @time > '18:00:00' and  @time < '23:59:59' then  "Добрый вечер"
when @time > '00:00:00' and  @time < '05:59:59' then  "Доброй ночи"
end
); # в зависимости от времени записываем в переменную текст
RETURN @hello; # возвращаем текст
END //

DELIMITER ;
SELECT hello();
