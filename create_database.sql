CREATE TABLE "Sales Person" (
  "sales_id" SERIAL,
  "first_name" VARCHAR(100),
  "last_name" VARCHAR(100),
  PRIMARY KEY ("sales_id")
);

CREATE TABLE "Customer" (
  "customer_id" SERIAL,
  "first_name" VARCHAR(100),
  "last_name" VARCHAR(100),
  PRIMARY KEY ("customer_id")
);

CREATE TABLE "Car" (
  "car_id" SERIAL,
  "make" VARCHAR(50),
  "model" VARCHAR(50),
  "year" VARCHAR(4),
  PRIMARY KEY ("car_id")
);

CREATE TABLE "Invoice" (
  "invoice_number" SERIAL,
  "sales_id" Integer,
  "service_id" Integer,
  "customer_id" Integer,
  "car_id" Integer,
  "payment_amount" NUMERIC(10,2),
  "invoice_date" DATE default CURRENT_DATE,
  PRIMARY KEY ("invoice_number"),
  CONSTRAINT "FK_Invoice.sales_id"
    FOREIGN KEY ("sales_id")
      REFERENCES "Sales Person"("sales_id"),
  CONSTRAINT "FK_Invoice.car_id"
    FOREIGN KEY ("car_id")
      REFERENCES "Car"("car_id"),
  CONSTRAINT "FK_Invoice.customer_id"
    FOREIGN KEY ("customer_id")
      REFERENCES "Customer"("customer_id")
);

CREATE TABLE "Parts" (
  "parts_id" SERIAL,
  PRIMARY KEY ("parts_id")
);

CREATE TABLE "Service" (
  "service_id" SERIAL,
  "mechanic_id" Integer,
  "car_id" Integer,
  "parts_id" Integer,
  PRIMARY KEY ("service_id"),
  CONSTRAINT "FK_Service.car_id"
    FOREIGN KEY ("car_id")
      REFERENCES "Car"("car_id"),
  CONSTRAINT "FK_Service.parts_id"
    FOREIGN KEY ("parts_id")
      REFERENCES "Parts"("parts_id")
);

CREATE TABLE "Mechanic" (
  "mechanic_id" SERIAL,
  PRIMARY KEY ("mechanic_id")
);