Question 1

select department_name,count(employee_id) no_of_employees
from departments,employees
where departments.department_id=employees.department_id
group by department_name
having count(employee_id)>=20

Question 2

select employee_id,first_name,last_name,salary
from employees e1
where salary>(select avg(salary)
from employees e2
where e1.department_id=e2.department_id
group by e1.department_id)

Question 3

select employee_id,first_name,last_name,
       first_name||' '||last_name as fullname,salary,
       salary*0.1 as newsalary ,(salary*0.1-salary) as difference
from employees

Question 4

select a.employee_id,a.first_name,a.last_name,b.first_name as mgrname
from employees a left outer join employees b
on a.manager_id=b.employee_id(+)
where b.first_name is null

Question 5

select employee_id,first_name,salary
from(
select *
from employees
order by salary desc)
where rownum<=3
order by salary desc