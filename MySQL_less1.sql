-- найти все машины старше 2000 г
select * from cars where year > 2000;

-- найти все машины младше 2015 г
select * from cars where year < 2015;

-- найти все машины не с этих годов 2008, 2009, 2010 годов
select * from cars where year not in(2008,2009,2010);

-- найти все машины год которых совпадает с ценой
select * from cars where year = price;

-- найти все машины bmw старше 2014 года
select * from cars where model = 'bmw' and year < 2014;

-- найти все машины audi младше 2014 года
select * from cars where model = 'audi' and year > 2014;

-- найти первые 5 машин
select * from cars order by id limit 5;

-- найти последние 5 машин
select * from cars order by id DESC limit 5;

-- найти среднее арифметическое цен машин модели KIA
select avg(price) from cars where model = 'KIA';

-- найти среднее арифметическое цен каждой машины
select avg(price) as avrPrice, model from cars group by model;

-- посчитать количество каждой марки машин
select count(model), model from cars group by model;

-- найти марку машины количество которых больше всего
-- ??????
 

-- найти все машины в модели которых вторая и предпоследняя буква "а"
select * from cars where model like '_a%a';

-- найти все машины модели которых больше 8 символов
select * from cars where length(model)> 8;

-- ***найти машины цена которых больше чем цена среднего арифметического всех машин
-- ?????