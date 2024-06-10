use sakila;
select * from rental; #rental_id, customer_id,inventory_id
select * from customer;
	select distinct first_name, last_name, email from customer
		right join rental using (customer_id);
        
select * from payment;
select p.customer_id, concat(c.first_name," ",c.last_name) as name, avg(p.amount) from payment p
	join customer c using (customer_id)
		group by customer_id;

select * from rental; #rental_id, customer_id,inventory_id
select * from inventory; #inventory_id, film_id
select * from film_category; #film_id, category_id
select * from category; #category_id, name
select distinct first_name, last_name, email from customer
	join rental using(customer_id)
	join inventory using (inventory_id)
	join film_category using (film_id)
	join category c using (category_id)
		where c.name = 'Action';
select c.first_name, c.last_name, c.email from customer c 
	where customer_id in (select customer_id from rental where inventory_id in (select inventory_id from inventory 
	where film_id in (select film_id from film_category where category_id in (select category_id from category where name = 'Action'))));
    
select * from payment;
select *, case
when 0 <= amount < 2 then 'low'
when 2 <= amount < 4 then 'medium'
when amount >= 4 then 'high' 
	end as label
		from payment; 