----------
-- Querey_1
----------
SELECT 
  Genre.Name, 
  count(*) AS frequency 
FROM 
  Track 
  JOIN Genre ON Track.GenreId = Genre.GenreId 
GROUP BY 
  Genre.Name 
ORDER BY 
  frequency DESC 
LIMIT 
  4;


----------
-- Querey_2
----------
SELECT 
  Name, 
  COUNT(Artist.Name) Albums 
FROM 
  Artist 
  JOIN Album ON Artist.ArtistId = Album.ArtistId 
GROUP By 
  Name 
ORDER BY 
  Albums DESC 
LIMIT 
  7;


----------
-- Querey_3
----------
SELECT 
  strftime('%Y', InvoiceDate) AS years, 
  customer.country AS Country, 
  count(*) PurchasingTimes 
FROM 
  Customer 
  JOIN Invoice ON Invoice.CustomerId = Customer.CustomerId 
WHERE 
  years = '2013' 
GROUP BY 
  years, 
  Country 
ORDER BY 
  PurchasingTimes DESC;



----------
-- Querey_4
----------
SELECT 
  table1.Countrys, 
  Nofcustomers, 
  PurchasingTimes 
FROM 
  (
    SELECT 
      country AS countrys, 
      count(*) AS Nofcustomers 
    FROM 
      customer 
    GROUP BY 
      1
  ) table1 
  Join (
    SELECT 
      BillingCountry, 
      count(BillingCountry) AS PurchasingTimes 
    FROM 
      Invoice 
    GROUP BY 
      1
  ) Table2 ON table1.Countrys = Table2.BillingCountry 
ORDER BY 
  3 DESC 
LIMIT 
  9;

