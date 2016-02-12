USE student2;
/*customerDimension Table*/
INSERT INTO student2.customerdimensioneayb(customerNumber,customerName,contactLastName,contactFirstName,phone,addressLine1,addressLine2,city,state,postalCode,country,salesRepEmployeeNumber,creditLimit,customerLocation)
SELECT * FROM classicmodels.customers;
INSERT INTO student2.customerdimensioneayb(checkNumber,amount)
SELECT classicmodels.payments.checkNumber,classicmodels.payments.amount 
FROM classicmodels.payments JOIN student2.customerdimensioneayb ON classicmodels.payments.customerNumber = student2.customerdimensioneayb.customerNumber;



SELECT classicmodels.payments.customerNumber, classicmodels.payments.checkNumber,classicmodels.payments.amount 
FROM classicmodels.payments JOIN student2.customerdimensioneayb ON classicmodels.payments.customerNumber = student2.customerdimensioneayb.customerNumber;


SET FOREIGN_KEY_CHECKS = 0; 
TRUNCATE customerdimensioneayb; 
SET FOREIGN_KEY_CHECKS = 1;
INSERT INTO student2.customerdimensioneayb
SELECT classicmodels.customers.customerNumber,customerName,contactLastName,contactFirstName,phone,addressLine1,addressLine2,city,state,postalCode,country,salesRepEmployeeNumber,creditLimit,customerLocation,checkNumber,amount 
FROM classicmodels.customers JOIN classicmodels.payments
USING (customerNumber);
 
 
 
/*RIGHT CODE*/ 
INSERT INTO student2.customerdimensioneayb
SELECT classicmodels.customers.customerNumber,customerName,contactLastName,contactFirstName,phone,addressLine1,addressLine2,city,state,postalCode,country,salesRepEmployeeNumber,creditLimit,customerLocation, classicmodels.payments.checkNumber, classicmodels.payments.amount,@dummy
FROM classicmodels.customers JOIN classicmodels.payments
USING (customerNumber);