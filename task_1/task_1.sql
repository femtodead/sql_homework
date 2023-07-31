#1Создайте таблицу с мобильными телефонами, используя графический интерфейс. Заполните БД данными
CREATE TABLE `new_test`.`mobile_phones` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `product_name` VARCHAR(45) NOT NULL,
  `manufacturer` VARCHAR(45) NOT NULL,
  `product_count` INT NOT NULL,
  `preice` DOUBLE NOT NULL,
  PRIMARY KEY (`id`));

INSERT INTO `new_test`.`mobile_phones` (`id`, `product_name`, `manufacturer`, `product_count`, `preice`) VALUES ('1', 'iPhone X', 'Apple', '3', '76000');
INSERT INTO `new_test`.`mobile_phones` (`id`, `product_name`, `manufacturer`, `product_count`, `preice`) VALUES ('2', 'iPhone 8', 'Apple', '2', '51000');
INSERT INTO `new_test`.`mobile_phones` (`id`, `product_name`, `manufacturer`, `product_count`, `preice`) VALUES ('3', 'Galaxy S9', 'Samsung', '2', '56000');
INSERT INTO `new_test`.`mobile_phones` (`id`, `product_name`, `manufacturer`, `product_count`, `preice`) VALUES ('4', 'Galaxy S8', 'Samsung', '1', '41000');
INSERT INTO `new_test`.`mobile_phones` (`id`, `product_name`, `manufacturer`, `product_count`, `preice`) VALUES ('5', 'P20 Pro', 'Huawei', '5', '36000');

#Выведите название, производителя и цену для товаров, количество которых превышает 2
SELECT product_name,manufacturer,preice FROM new_test.mobile_phones WHERE product_count > 2;
#Выведите весь ассортимент товаров марки “Samsung”
SELECT * FROM new_test.mobile_phones WHERE manufacturer = "Samsung";
