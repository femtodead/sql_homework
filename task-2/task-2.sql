# Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными

create table sales(id int unique auto_increment not null, order_data date, count_product int);
insert into sales (order_data,count_product) values 
('2022-01-01', 156),
('2022-01-02', 180),
('2022-01-03', 21),
('2022-01-04', 124),
('2022-01-05', 341)
;

# Сгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 и больше 300.

select id "id заказа", 
if (count_product < 100, "Маленький заказ", 
if ((count_product > 100 and count_product < 300), "Средний заказ", 
"Большой заказ")) as "Тип заказа" from sales;

# Создайте таблицу “orders”, заполните ее значениями. Покажите “полный” статус заказа, используя оператор CASE

create table orders(id int unique auto_increment not null, employee_id varchar(45), amount double, order_status varchar(45));

insert into orders (employee_id,amount,order_status) values 
('e03', 15.00,'open'),
('e01', 25.50,'open'),
('e05', 100.70,'closed'),
('e02', 22.18,'open'),
('e04', 9.50,'cancelled')
;

select 
case
	when order_status = 'open'
		then 'Order is in open state'
	when order_status = 'closed'
		then 'Order is closed'
	when order_status = 'cancelled'
		then 'Order is cancelled'
	end as "full_order_status"
    from orders;
