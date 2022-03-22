create table restaurant(
  id integer primary key,
  name varchar(20),
  description varchar(100),
  rating decimal,
  telephone char(10),
  hours varchar(100)
);

create table address(
  id integer primary key,
  street_number varchar(10),
  street_name varchar(20),
  city varchar(20),
  state varchar(15),
  google_map_link varchar(50),
  restaurant_id integer references restaurant(id) unique
);

create table category(
  id char(2) primary key,
  name varchar(20),
  description varchar(200)
);

create table dish(
  id integer primary key,
  name varchar(50),
  description varchar(200),
  hot_and_spicy boolean
);

create table review(
  id integer,
  rating decimal,
  description varchar(100),
  date date,
  restaurant_id integer references restaurant(id)
);

create table categories_dishes(
  dish_category char(2) references category(id),
  dishes integer references dish(id),
  price money,
  primary key (dish_category,dishes)
);


/* 
 *--------------------------------------------
 Insert values for restaurant
 *--------------------------------------------
 */
INSERT INTO restaurant VALUES (
  1,
  'Bytes of China',
  'Delectable Chinese Cuisine',
  3.9,
  '6175551212',
  'Mon - Fri 9:00 am to 9:00 pm, Weekends 10:00 am to 11:00 pm'
);

/* 
 *--------------------------------------------
 Insert values for address
 *--------------------------------------------
 */
INSERT INTO address VALUES (
  1,
  '2020',
  'Busy Street',
  'Chinatown',
  'MA',
  'http://bit.ly/BytesOfChina',
  1
);

/* 
 *--------------------------------------------
 Insert values for review
 *--------------------------------------------
 */
INSERT INTO review VALUES (
  1,
  5.0,
  'Would love to host another birthday party at Bytes of China!',
  '05-22-2020',
  1
);

INSERT INTO review VALUES (
  2,
  4.5,
  'Other than a small mix-up, I would give it a 5.0!',
  '04-01-2020',
  1
);

INSERT INTO review VALUES (
  3,
  3.9,
  'A reasonable place to eat for lunch, if you are in a rush!',
  '03-15-2020',
  1
);

/* 
 *--------------------------------------------
 Insert values for category
 *--------------------------------------------
 */
INSERT INTO category VALUES (
  'C',
  'Chicken',
  null
);

INSERT INTO category VALUES (
  'LS',
  'Luncheon Specials',
  'Served with Hot and Sour Soup or Egg Drop Soup and Fried or Steamed Rice  between 11:00 am and 3:00 pm from Monday to Friday.'
);

INSERT INTO category VALUES (
  'HS',
  'House Specials',
  null
);

/* 
 *--------------------------------------------
 Insert values for dish
 *--------------------------------------------
 */
INSERT INTO dish VALUES (
  1,
  'Chicken with Broccoli',
  'Diced chicken stir-fried with succulent broccoli florets',
  false
);

INSERT INTO dish VALUES (
  2,
  'Sweet and Sour Chicken',
  'Marinated chicken with tangy sweet and sour sauce together with pineapples and green peppers',
  false
);

INSERT INTO dish VALUES (
  3,
  'Chicken Wings',
  'Finger-licking mouth-watering entree to spice up any lunch or dinner',
  true
);

INSERT INTO dish VALUES (
  4,
  'Beef with Garlic Sauce',
  'Sliced beef steak marinated in garlic sauce for that tangy flavor',
  true
);

INSERT INTO dish VALUES (
  5,
  'Fresh Mushroom with Snow Peapods and Baby Corns',
  'Colorful entree perfect for vegetarians and mushroom lovers',
  false
);

INSERT INTO dish VALUES (
  6,
  'Sesame Chicken',
  'Crispy chunks of chicken flavored with savory sesame sauce',
  false
);

INSERT INTO dish VALUES (
  7,
  'Special Minced Chicken',
  'Marinated chicken breast sauteed with colorful vegetables topped with pine nuts and shredded lettuce.',
  false
);

INSERT INTO dish VALUES (
  8,
  'Hunan Special Half & Half',
  'Shredded beef in Peking sauce and shredded chicken in garlic sauce',
  true
);

/*
 *--------------------------------------------
 Insert valus for cross-reference table, categories_dishes
 *--------------------------------------------
 */
INSERT INTO categories_dishes VALUES (
  'C',
  1,
  6.95
);

INSERT INTO categories_dishes VALUES (
  'C',
  3,
  6.95
);

INSERT INTO categories_dishes VALUES (
  'LS',
  1,
  8.95
);

INSERT INTO categories_dishes VALUES (
  'LS',
  4,
  8.95
);

INSERT INTO categories_dishes VALUES (
  'LS',
  5,
  8.95
);

INSERT INTO categories_dishes VALUES (
  'HS',
  6,
  15.95
);

INSERT INTO categories_dishes VALUES (
  'HS',
  7,
  16.95
);

INSERT INTO categories_dishes VALUES (
  'HS',
  8,
  17.95
);

-- selecting restaurant name, telephone, street number and street address from both tables
select restaurant.name, restaurant.telephone, address.street_number, address.street_name
from restaurant
left join address
on restaurant.id = address.restaurant_id;

-- retrieving date from three tables
select dish.name as dish_name,categories_dishes.price, category.name as category
from dish
left join categories_dishes 
on dish.id = categories_dishes.dishes
left join category 
on category.id = categories_dishes.dish_category;


SELECT MAX(rating) AS best_rating FROM review;

SELECT dish.name 
AS dish_name,categories_dishes.price 
AS price,category.name 
AS category  
FROM dish INNER 
JOIN categories_dishes 
ON dish.id =categories_dishes.dish_id 
INNER JOIN category 
ON categories_dishes.category_id=category.id 
ORDER BY 1;


SELECT category.name AS category,dish.name AS dish_name,categories_dishes.price AS price 
FROM dish 
INNER JOIN categories_dishes 
ON dish.id =categories_dishes.dish_id INNER 
JOIN category 
ON categories_dishes.category_id=category.id 
ORDER BY 1;

SELECT category.name 
AS category,dish.name 
AS dish_name,categories_dishes.price 
AS price 
FROM dish 
INNER JOIN categories_dishes 
ON dish.id =categories_dishes.dish_id 
INNER JOIN category 
ON categories_dishes.category_id=category.id 
ORDER BY 1;


SELECT dish.name AS spicy_dish_name,category.name AS category,categories_dishes.price AS price  
FROM dish 
INNER JOIN categories_dishes 
ON dish.hot_and_spicy=TRUE AND dish.id =categories_dishes.dish_id 
INNER JOIN category ON categories_dishes.category_id=category.id 
ORDER BY 1;



SELECT dish_id , 
COUNT(dish_id) 
FROM categories_dishes 
GROUP BY dish_id;
SELECT dish_id , 
COUNT(dish_id) 
FROM categories_dishes 
GROUP BY dish_id 
HAVING COUNT(dish_id)>1;

SELECT dish.name 
AS dish_name ,
COUNT(categories_dishes.dish_id) AS dish_count
FROM dish ,categories_dishes
GROUP BY dish.id ,dish.name ,categories_dishes.dish_id
HAVING COUNT(categories_dishes.dish_id)>1 
AND categories_dishes.dish_id= dish.id ;

SELECT rating AS best_rating, description
FROM review
WHERE  rating = ( SELECT MAX(rating) from review );






