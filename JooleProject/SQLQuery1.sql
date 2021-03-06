
MERGE INTO [dbo].[User] AS Target
USING (VALUES 
        (1, 'Admin', 'admin@gmail.com', 'image', 'admin123')
) 
AS Source (User_ID, User_Name, User_Email, User_Image, User_Password) 
ON Target.User_ID = Source.User_ID 
WHEN NOT MATCHED BY TARGET THEN
INSERT (User_Name, User_Email, User_Image, User_Password) 
VALUES (User_Name, User_Email, User_Image, User_Password);


MERGE INTO Category AS Target 
USING (VALUES 
        (1, 'Mechanical'),
        (2, 'Electrical'),
        (3, 'Stationary'),
        (4,'Furniture')
) 
AS Source (Category_ID, Category_Name) 
ON Target.Category_ID = Source.Category_ID 
WHEN NOT MATCHED BY TARGET THEN 
INSERT (Category_ID, Category_Name) 
VALUES (Category_ID, Category_Name);


MERGE INTO SubCategory AS Target 
USING (VALUES 
        (1, 1, 'Fans'), 
        (2, 1, 'Vaccums'), 
        (3, 1, 'Toasters'),
        (4, 2, 'Laptops'),
        (5, 2, 'Tablets'),
        (6, 3, 'Notebooks'),
        (7, 3, 'Pens'),
        (8, 4, 'Sofas'),
        (9, 4, 'Desks'),
        (10, 4, 'Beds')
) 
AS Source (SubCategory_ID, Category_ID, SubCategory_Name) 
ON Target.SubCategory_ID = Source.SubCategory_ID 
WHEN NOT MATCHED BY TARGET THEN 
INSERT (SubCategory_ID, Category_ID, SubCategory_Name) 
VALUES (SubCategory_ID, Category_ID, SubCategory_Name);


MERGE INTO Product AS Target 
USING (VALUES 
        (1, 1, '70" Monte Carlo Maverick Max Matte Black Ceiling Fan', 'image', 'Monte Carlo', 'Model 1', '2021', 'Series 111'), 
        (2, 1, '60" Monte Carlo Maverick Super Max Matte Black Ceiling Fan', 'image', 'Monte Carlo', 'Model 2', '2021', 'Series 222'), 
        (3, 1, '52" Monte Carlo Maverick Grand Matte Black Ceiling', 'image', 'Monte Carlo', 'Model 3', '2021', 'Series 333'),
		(4, 2, 'Navigator Lift-Away DLX Vacuum Cleaner', 'image', 'Shark', 'Model 1', '2020', 'Series ABC'), 
        (5, 2, 'Navigator Lift-Away Self-Cleaning Brushroll Upright Vacuum', 'image','Shark', 'Model 2', '2020', 'Series DEF'), 
        (6, 2, 'Rotator Powered Lift-Away Upright Vacuum Cleaner', 'image', 'Shark', 'Model 3', '2020', 'Series XYZ'),
		(7, 3, 'Sunbeam 2 Slice Wide-Slot Toaster - Brushed Stainless Steel', 'image', 'Sunbeam', 'Model 1', '2020', 'Series 1'), 
        (8, 3, 'Cuisinart 4 Slice Classic Toaster - Black Stainless Steel', 'image', 'Cuisinart', 'Model 2', '2018', 'Series 2'), 
        (9, 3, 'Hamilton Beach Air Fry Sure-Crisp Toaster Oven ', 'image', 'Hamilton', 'Model 3', '2019', 'Series 3'),
        (10, 4, 'New Inspiron 15 3000 Laptop', 'image', 'Dell', 'Model 1', '2020', 'Series A'),
        (11, 5, 'Apple Ipad Air 4', 'image', 'Apple', 'Model 1', '2021', 'Series 1'),
        (12, 6, 'Black Notebook', 'image', 'Hello', 'Model 1', '2010', ''),
        (13, 6, 'Color Notebook', 'image', 'Hello', 'Model 2', '2010', ''),
        (14, 7, 'Black Pen', 'image', 'Hello', 'Model 1', '2010', ''),
        (15, 7, 'Blue Pen', 'image', 'Hello', 'Model 2', '2010', ''),
        (16, 8, 'Sectional Sofa', 'image', 'Casa Andrea Milano', 'Sectional', '2018', null),
        (17, 8, 'Recliner Sofa', 'image', 'JUMMICO', 'Recliner', '2019', null),
        (18, 9, 'Console Desk', 'image', 'VASAGLE', 'Console', '2020', null),
        (19, 10, 'Queen Size Bed', 'image', 'Ikea', 'Bed room', '2021', null)
        )
AS Source (Product_ID, SubCategory_ID, Product_Name, Product_Image, Series, Model, Model_Year, Series_Info) 
ON Target.Product_ID = Source.Product_ID 
WHEN NOT MATCHED BY TARGET THEN 
INSERT (Product_ID, SubCategory_ID, Product_Name, Product_Image, Series, Model, Model_Year, Series_Info) 
VALUES (Product_ID, SubCategory_ID, Product_Name, Product_Image, Series, Model, Model_Year, Series_Info);

MERGE INTO Property AS Target 
USING (VALUES 
        (1, 'Airflow', 0, 1), 
        (2, 'Weight', 0, 1), 
        (3, 'Blade Pitch', 0, 1),
		(4, 'Application', 1, 0), 
		(5, 'Product Height', 0, 1),
        (6, 'Product Weight', 0, 1),
		(7, 'Cleaning Path Width', 0, 1), 
        (8, 'Application', 1, 0),
		(9, 'Width in', 0, 1),
        (10, 'Height in', 0, 1),
		(11, 'Depth in', 0, 1), 
        (12, 'Application', 1, 0),
        (13, 'Color', 1, 0),
        (14, 'Weight', 0, 1),
        (15, 'Length', 0, 1),
        (16, 'Height', 0, 1),
        (17, 'Width', 0, 1),
        (18, 'Material', 0, 1),
        (19, 'Location', 1, 0),
        (20, 'Use_type', 1, 0),
        (21, 'Accessories', 1, 0),
        (22, 'Capacity', 0, 1),
        (23, 'Model year', 1, 0),
        (24, 'Commercial', 1, 0),
        (25, 'Size', 0, 1),
        (26,'Memory',0,1),
        (27,'Screen Size',0,1),
        (28,'Processor',0,1)

) 
AS Source (Property_ID, Property_Name, IsType, IsTechSpec) 
ON Target.Property_ID = Source.Property_ID 
WHEN NOT MATCHED BY TARGET THEN 
INSERT (Property_ID, Property_Name, IsType, IsTechSpec) 
VALUES (Property_ID, Property_Name, IsType, IsTechSpec) ;

MERGE INTO PropertyValue AS Target 
USING (VALUES 
        (1, 1, '5192'), 
        (1, 2, '4192'), 
        (1, 3, '5551'),
		(2, 1, '11.68'), 
        (2, 2, '10'), 
        (2, 3, '8.88'),
		(3, 1, '13'), 
        (3, 2, '13'), 
        (3, 3, '12'),
		(4, 1, 'Indoor'), 
        (4, 2, 'Indoor'), 
        (4, 3, 'Indoor'),
		(5, 4, '41.34'), 
        (5, 5, '44.5'), 
        (5, 6, '44.45'),
		(6, 4, '7.7'), 
        (6, 5, '10'), 
        (6, 6, '12.3'),
		(7, 4, '10.5'), 
        (7, 5, '12.5'), 
        (7, 6, '12.5'),
		(8, 4, 'Indoor'), 
        (8, 5, 'Indoor'), 
        (8, 6, 'Indoor'),
		(9, 4, '10.1'), 
        (9, 5, '10.35'), 
        (9, 6, '7.13'),
		(10, 7, '5.64'), 
        (10, 8, '8.13'), 
        (10, 9, '8.2'),
		(11, 7, '6.53'), 
        (11, 8, '8.13'), 
        (11, 9, '10.33'),
		(12, 7, 'Indoor'), 
        (12, 8, 'Indoor'), 
        (12, 9, 'Indoor'),
        (13, 16, 'black'),
        (13, 17, 'blue'),
        (13, 18, 'white'),
        (13, 19, 'wooden brown'),
        (14, 16, '60'),
        (14, 17, '80'),
        (14, 18, '30'),
        (14, 19, '95'),
        (15, 16, '35'),
        (15, 17, '27'),
        (15, 18, '36'),
        (15, 19, '32'),
        (16, 16, '32'),
        (16, 17, '41'),
        (16, 18, '19'),
        (16, 19, '33'),
        (17, 16, '17'),
        (17, 17, '22'),
        (17, 18, '25'),
        (17, 19, '31'),
        (18, 16, 'leather'),
        (18, 17, 'fabric'),
        (18, 18, 'wood'),
        (18, 19, 'metal'),
        (8, 16, 'indoor'),
        (8, 17, 'indoor'),
        (8, 18, 'indoor'),
        (8, 19, 'indoor'),
        (19, 16, 'living room'),
        (19, 17, 'living room'),
        (19, 18, 'bedroom'),
        (19, 19, 'bedroom'),
        (20, 16, 'family'),
        (20, 17, 'family'),
        (20, 18, 'family'),
        (20, 19, 'family'),
        (21, 16, 'with pillow'),
        (21, 17, null),
        (21, 18, null),
        (21, 19, 'with pillow and blanket'),
        (22, 16, '5'),
        (22, 17, '4'),
        (22, 18, '1'),
        (22, 19, '2'),
        (23, 16, '2018'),
        (23, 17, '2019'),
        (23, 18, '2020'),
        (23, 19, '2021'),
        (24, 10, 'Yes'),
        (27, 10, '13 inches'),
        (14, 10, '3'),
        (26, 10, '32GB'),
        (28, 10, 'Intel Core i5'),
        (24, 11, 'Yes'),
        (27, 11, '8 inches'),
        (14, 11, '1.2'),
        (26, 11, '8GB'),
        (28, 11, 'Apple m10'),
        (13, 12, 'Black'),
        (13, 13, 'Color'),
        (15, 12, '8'),
        (17, 12, '8'),
        (15, 13, '8'),
        (17, 13, '8'),
        (13, 14, 'Black'),
        (13, 15, 'Blue'),
        (15, 14, '3'),
        (15, 15, '3'),
        (25, 1, '50 inches'),
        (25, 2, '42 inches'),
        (25, 3, '46 inches')

)  
AS Source (Property_ID , Product_ID, Value) 
ON Target.Property_ID = Source.Property_ID AND Target.Product_ID = Source.Product_ID
WHEN NOT MATCHED BY TARGET THEN 
INSERT (Property_ID , Product_ID, Value)  
VALUES (Property_ID , Product_ID, Value);


MERGE INTO TypeFilter AS Target 
USING (VALUES 
        (4, 1, 'Application', 'Indoor;Outdoor'),
        (19, 8, 'Location', 'Living Room;Bedroom'),
        (19, 9, 'Location', 'Living Room;Bedroom'),
        (19, 10, 'Location', 'Living Room;Bedroom')
) 
AS Source (Property_ID, SubCategory_ID, Type_Name, Type_Options) 
ON Target.Property_ID = Source.Property_ID AND Target.SubCategory_ID = Source.SubCategory_ID
WHEN NOT MATCHED BY TARGET THEN 
INSERT (Property_ID, SubCategory_ID, Type_Name, Type_Options)  
VALUES (Property_ID, SubCategory_ID, Type_Name, Type_Options);


MERGE INTO TechSpecFilter AS Target 
USING (VALUES 
        (1, 1, 3000, 8000), 
        (2, 1, 5, 15),
        (3, 1, 10, 15),
		(5, 2, 40, 45),
        (6, 2, 5, 15),
		(7, 2, 10, 15), 
		(9, 2, 5, 15),
        (10, 3, 5, 10),
		(11, 3, 5, 15), 
        (14, 4, 0, 100),
        (15, 4, 30, 45),
        (16, 4, 10, 50),
        (17, 4, 10, 50),
        (22, 8, 0, 5),
        (22, 9, 0, 5),
        (22, 10, 0, 5)
) 
AS Source (Property_ID, SubCategory_ID, Min_Value, Max_Value) 
ON Target.Property_ID = Source.Property_ID AND Target.SubCategory_ID = Source.SubCategory_ID
WHEN NOT MATCHED BY TARGET THEN 
INSERT (Property_ID, SubCategory_ID, Min_Value, Max_Value)  
VALUES (Property_ID, SubCategory_ID, Min_Value, Max_Value);