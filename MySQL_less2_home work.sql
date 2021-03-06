 #найти самого старого клиента
select * from client order by Age desc limit 1;

# посчитать количество кредитов каждой валюты
select count(idApplication), Currency from application group by Currency;

# Найти клиентов которые проживают в том же городе что и отделение банка
select FirstName, City, DepartmentCity from client
	join department
    on client.Department_idDepartment = department.idDepartment
    where Department_idDepartment = idDepartment;
    
# Найти клиентов которые проживают в том же городе что и отделение банка
# но исключить из поиска Киев
select FirstName, City, DepartmentCity from client
	join department
    on client.Department_idDepartment = department.idDepartment
    where Department_idDepartment = idDepartment and City != 'Kyiv';


# найти прошлого запроса, клиента с самый больший долларовым кредитом
select * from client
	join application
    on client.idClient = application.Client_idClient
    where application.Sum = (select max(sum) from application) and Currency = 'Dollar';
    

