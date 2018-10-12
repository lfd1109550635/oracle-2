# oracle 实验一
## 1.查询语句一
```sql
SELECT d.department_name，count(e.job_id)as "部门总人数"，
avg(e.salary)as "平均工资"
from hr.departments d，hr.employees e
where d.department_id = e.department_id
and d.department_name in ('IT'，'Sales')
GROUP BY department_name;
```
### 查询结果
![帐号输入](./result.png)
### 优化指导
>创建一个或多个索引来改进当前语句的执行计划，考虑运行可以改进物理方案设计的访问指导或者创建推荐的索引。
## 2.查询语句二
```sql
SELECT d.department_name，count(e.job_id)as "部门总人数"，
avg(e.salary)as "平均工资"
FROM hr.departments d，hr.employees e
WHERE d.department_id = e.department_id
GROUP BY department_name
HAVING d.department_name in ('IT'，'Sales');
```
### 查询结果
![帐号输入](./result.png)
### 优化指导
>无
