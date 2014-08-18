create table restaurant_menu (
    menu_id text primary key,
	menu_name text,
	menu_type text,
	menu_price numeric
);


insert into restaurant_menu(menu_id, menu_name, menu_type, menu_price)
    values ('1-000', 'grilled squid', 'viand', 180)
	      ,('1-001', 'babyback ribs', 'viand', 200)
		  ,('1-002', 'battered chicken', 'viand', 120)
		  ,('1-003', 'beef steak', 'viand', 150)
		  ,('2-000', 'plain rice', 'rice', 15)
		  ,('2-001', 'garlic rice', 'rice', 20)
		  ,('2-002', 'organic rice', 'rice', 30)
		  ,('3-000', 'pineapple juice', 'drinks', 50)
		  ,('3-001', 'sprite', 'drinks', 50)
		  ,('3-002', 'fruit shake', 'drinks', 80)
		  ,('3-003', 'ice-cold beer', 'drinks', 75);

create or replace function get_order(in text 
        out text, out text, out numeric) returns setof record as
$$
   
      select menu_name, menu_type, menu_price from restaurant_menu where
          menu_id = $1;
  
$$
  language 'sql';
  
--HOW TO USE:

select * from get_order('1-000') union
select * from get_order('2-001') union
select * from get_order('3-002');

--returns
--garlic rice rice 20
--grilled squid viand 180
--fruit shake drinks 80


