-- Insert 3 people into "Sales Person"
insert into "Sales Person" (
	"sales_id",
	"first_name",
	"last_name"
) values (
	1,
	'Bob',
	'Dole'
);

insert into "Sales Person" (
	"sales_id",
	"first_name",
	"last_name"
) values (
	2,
	'Shenia',
	'Twain'
);

insert into "Sales Person" (
	sales_id,
	first_name,
	last_name
) values (
	3,
	'Wayne',
	'Carter'
);

-- Show they've been entered
select * from "Sales Person"


-------------------------------------------------------


-- Use stored function to insert data into the customer table
create or replace function add_customer(_customer_id INTEGER, _first_name VARCHAR(100), _last_name VARCHAR(100))
returns void
as $MAIN$
begin 
	insert into "Customer"(customer_id, first_name, last_name)
	values(_customer_id, _first_name, _last_name);
end;
$MAIN$
language plpgsql;

-- Add Customer(s)
select add_customer(1, 'Xiala', 'Teek');
select add_customer(2, 'Serapio', 'Odosado');

-- Show they've been entered
select * from "Customer";


-- Use stored function to insert data into the car table
create or replace function add_car(_car_id INTEGER, _make VARCHAR(50), _model VARCHAR(50), _year_ VARCHAR(4))
returns void
as $MAIN$
begin 
	insert into "Car"(car_id, make, model, year)
	values(_car_id, _make, _model, _year_);
end;
$MAIN$
language plpgsql;

--Add cars(s)
select add_car(1, 'Honda', 'Civic', '1982');
select add_car(2, 'Tesla', 'X', '2020');

-- Show they've been updated
select * from "Car";


---------------------------------------------



-- Invoice (Wait on it and see if the foreign keys will automatically populate from everything else? )
insert into "Invoice" (
	"invoice_number",
	"sales_id",
	"service_id",
	"customer_id",
	"car_id",
	"payment_amount"
) values (
	1,
	1,
	1,
	1,
	1,000.00
);

-- update payment amount for invoice 1
update "Invoice"
set "payment_amount" = 1000
where "invoice_number" = 1;


insert into "Invoice" (
	"invoice_number",
	"sales_id",
	"service_id",
	"customer_id",
	"car_id",
	"payment_amount"
) values (
	2,
	2,
	2,
	2,
	2,
	10000
);

select * from "Invoice";

-- Parts
insert into "Parts" (
	"parts_id"
) values (
	1
);

insert into "Parts" (
	"parts_id"
) values (
	2
);

select * from "Parts";

-----------------------------------------------


-- Service
insert into "Service" (
	"service_id",
	"mechanic_id",
	"car_id",
	"parts_id"
) values (
	1,
	1,
	1,
	1
);

insert into "Service" (
	"service_id",
	"mechanic_id",
	"car_id",
	"parts_id"
) values (
	2,
	2,
	2,
	2
);

select * from "Service";



-----------------------------------------------
-- Mechanic
insert into "Mechanic" (
	"mechanic_id"
) values (
	1
);

insert into "Mechanic" (
	"mechanic_id"
) values (
	2
);

select * from "Mechanic";



