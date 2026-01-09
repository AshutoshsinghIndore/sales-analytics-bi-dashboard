# Checking Null Values in dim_Customer
SELECT 
	SUM(customerNumber IS NULL)  			AS NULL_CUSTOMER_ID_Count, 
    SUM(CustomerName IS NULL)  				AS NULL_CUSTOMER_Name_Count, 
    SUM(City IS NULL)  						AS NULL_City_Count, 
    SUM(State IS NULL)  					AS NULL_State_Count, 
    SUM(Country IS NULL)  					AS NULL_Country_Count,
    SUM(PostalCode IS NULL)  				AS NULL_PostalCode_Count,
    SUM(salesrepemployeenumber IS NULL)  	AS NULL_SalesRepID_Count,
    SUM(CreditLimit IS NULL)  				AS NULL_CreditLimit_Count
FROM customers;

# Null Entries Found
# Postal Code: 7 
# SalesRepID: 22 
# State: 73 Updating: "Unknown"

SELECT 
	SUM(`employees`.`employeeNumber` IS NULL) AS NULL_EmployeeID,
    SUM(`employees`.`lastName` IS NULL) AS NULL_LastName,
    SUM(`employees`.`firstName` IS NULL) AS NULL_FirstName,
    SUM(`employees`.`extension` IS NULL) AS NULL_extension,
    SUM(`employees`.`email` IS NULL) AS NULL_email,
    SUM(`employees`.`officeCode` IS NULL) AS NULL_OfficeCode,
    SUM(`employees`.`reportsTo` IS NULL) AS NULL_ReportsTo,
    SUM(`employees`.`jobTitle` IS NULL) AS NULL_JobTitle
FROM `sales_analytics`.`employees`;
# Null Entries Found
# Report To: 1 (President : Top Management ) Leave NULL since Data_type INT

DESC offices;
#Null Entry Found
# Replacing with 'Unknown'
select * from offices;

DESC orderdetails;
#No NULL Entries

