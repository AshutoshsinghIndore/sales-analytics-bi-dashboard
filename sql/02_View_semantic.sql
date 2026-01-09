# Creating Dimension Table: Customers
Create View dim_customer AS
	SELECT 
		Customernumber as CustomerID, 
        CustomerName as CustomerName, 
        Coalesce(City, 'Unknown') As City, 
        Coalesce(State, "Unknown") As State, 
        country as Country, 
        PostalCode, 
        SalesRepEmployeeNumber AS SalesRepID, 
        creditlimit
	FROM customers;

#Creating Dimension Table: Employees
    Create View dim_employees AS
		SELECT  
			`employeeNumber` AS EmployeeID, 
            Concat(`firstname`, ' ', `lastname`) AS EmployeeName,  
            `officeCode`, 
            `reportsTo`, 
            `jobTitle` AS Designation
		FROM employees;
        
# Creating Dimension View: Offices
CREATE VIEW dim_offices AS
	SELECT 
		`offices`.`officeCode`,
		`offices`.`city`,
		COALESCE(`offices`.`state`, 'Unknown') AS State,
		`offices`.`country` AS Country,
		`offices`.`postalCode` AS PostalCode,
		CASE 
			WHEN `offices`.`territory` = 'APAC'
				THEN 'Asia - Pacific'
			WHEN `offices`.`territory` = 'NA'
				THEN 'North America'
			WHEN `offices`.`territory` = 'EMEA'
				THEN 'Europe, Middle East & Africa'
			WHEN `offices`.`country` IN ('USA','United States','Canada','Mexico')
				THEN 'North America'
			WHEN `offices`.`country` IN ('France','UK','Germany')
				THEN 'Europe, Middle East & Africa'
			WHEN `offices`.`country` IN ('Japan','Australia','India','China')
				THEN 'Asia-Pacific'
			ELSE 'Unknown'
        END AS Territory
	FROM `sales_analytics`.`offices`;

# FACT_SALES
CREATE VIEW fact_sales AS 
	SELECT 
		od.ordernumber AS OrderNumber, 
        od.productcode AS ProductCode, 
        od.quantityOrdered AS Quantity, 
        od.priceeach AS Price, 
        (od.quantityOrdered * od.priceeach) as Sales, 
        o.orderdate AS OrderedDate, 
        o.requireddate AS RequiredDate, 
        o.shippedDate AS ShippedDate, 
        o.Status As ShipmentStatus, 
        o.CustomerNumber AS CustomerID
	FROM orderdetails od
    Inner Join orders o 
    ON o.ordernumber = od.ordernumber;
    
# FACT_Payments
CREATE VIEW fact_payments AS
	SELECT 
		customernumber AS CustomerID, 
        checknumber AS CheckNumber, 
        paymentdate AS PaymentDate, 
        Amount AS Amount
	FROM payments;
    
#DIM_Products
CREATE VIEW dim_product AS
	SELECT 
		productCode AS ProductCode, 
        productName AS ProductName, 
        productLine AS ProductCategory, 
        productScale AS ProductScale, 
        productVendor AS ProductVendor, 
        productDescription AS ProductDescription, 
        quantityInStock AS QuantityInStock, 
        buyPrice AS BuyPrice, 
        MSRP AS MSRP
	FROM products;
    

		