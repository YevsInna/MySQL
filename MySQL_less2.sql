-- 1.Вибрати усіх клієнтів, чиє ім'я має менше ніж 6 символів.
select FirstName from bank.client where length(firstName) < 6;

-- 2.Вибрати львівські відділення банку.
select DepartmentCity from bank.department where DepartmentCity = 'Lviv';

-- 3.Вибрати клієнтів з вищою освітою та посортувати по прізвищу.
select * from bank.client where education = 'high'order by LastName;

-- 4.Виконати сортування у зворотньому порядку над таблицею Заявка і вивести 5 останніх елементів.
select * from bank.application order by idApplication desc limit 5;

-- 5.Вивести усіх клієнтів, чиє прізвище закінчується на OV чи OVA.
select * from bank.client where LastName like '%ov' or LastName like '%ova';

-- 6.Вивести клієнтів банку, які обслуговуються київськими відділеннями.
select *from bank.client where Department_idDepartment = 1 or Department_idDepartment = 4;

-- 7.Знайти унікальні імена клієнтів.
select distinct firstName from bank.client;

-- 8.Вивести дані про клієнтів, які мають кредит більше ніж на 5000 тисяч гривень.
select * from client
 join application on client.idClient=application.Client_idClient
 where Sum > 5000 and Currency like 'Gryvnia';
    
-- 9.Порахувати кількість клієнтів усіх відділень та лише львівських відділень.
select count(Department_idDepartment), Department_idDepartment from client group by Department_idDepartment;
select count(department_idDepartment) from client where Department_idDepartment = 2;

-- 10.Знайти кредити, які мають найбільшу суму для кожного клієнта окремо.

    
   
	
    
-- 11. Визначити кількість заявок на крдеит для кожного клієнта.
select count(idApplication), Client_idClient from application group by Client_idClient;

-- 12. Визначити найбільший та найменший кредити.
select max(sum), min(sum) from application;

-- 13. Порахувати кількість кредитів для клієнтів,які мають вищу освіту.
select count(idApplication) from application
	join client 
    on application.Client_idClient = client.idClient
    where Education = 'high';
    
-- 14. Вивести дані про клієнта, в якого середня сума кредитів найвища.
select*from client
	join application
    on client.idClient = application.Client_idClient
    order by sum desc limit 1;
    
    
-- 15. Вивести відділення, яке видало в кредити найбільше грошей
select sum(sum) from application
	join client
    on application.Client_idClient = client.idClient
    join department
    on client.Department_idDepartment = department.idDepartment
    order by sum desc limit 1;
    
        
-- 16. Вивести відділення, яке видало найбільший кредит.
select idDepartment, DepartmentCity from department
	join client
    on department.idDepartment = client.Department_idDepartment
    join application
    on client.idClient = application.Client_idClient
    order by sum desc limit 1;
    
    
-- 17. Усім клієнтам, які мають вищу освіту, встановити усі їхні кредити у розмірі 6000 грн.
    -- update application set sum = 6000    
    -- where education = 'high' limit 1000;
    -- як зєднати ці два рядки?
    
-- 18. Усіх клієнтів київських відділень пересилити до Києва.
update client set city = 'Kyiv' where Department_idDepartment = 1 or Department_idDepartment = 4;

-- 19. Видалити усі кредити, які є повернені.
delete from application where CreditState = 'Returned' limit 1000;

-- 20. Видалити кредити клієнтів, в яких друга літера прізвища є голосною.

-- 21.Знайти львівські відділення, які видали кредитів на загальну суму більше ніж 5000
select idDepartment, DepartmentCity, sum from department 
join client
on department.idDepartment = client.Department_idDepartment
join application
on client.idClient = application.Client_idClient
where sum > 5000;


-- 22.Знайти клієнтів, які повністю погасили кредити на суму більше ніж 5000



-- 23.Знайти максимальний неповернений кредит.
select max(sum) from application where CreditState = 'Not returned';

-- 24.Знайти клієнта, сума кредиту якого найменша
select * from client
	join application
	on client.idClient = application.Client_idClient
    order by sum limit 1;
    
    
-- 25.Знайти кредити, сума яких більша за середнє значення усіх кредитів
select sum from application where sum > (select avg(sum) from application);

-- 26. Знайти клієнтів, які є з того самого міста, що і клієнт, який взяв найбільшу кількість кредитів

-- 27. Місто клієнта з найбільшою кількістю кредитів