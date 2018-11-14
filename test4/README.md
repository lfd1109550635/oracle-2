# 实验四

为用户分配表空间
```sql
ALTER USER xiaoqingyu QUOTA UNLIMITED ON USERS;
ALTER USER xiaoqingyu QUOTA UNLIMITED ON USERS02;
ALTER USER xiaoqingyu QUOTA UNLIMITED ON USERS03;
ALTER USER xiaoqingyu ACCOUNT UNLOCK;
```
结果
![分配表空间结果](./用户分配表空间.png)

为用户分配权限
```sql
GRANT "CONNECT" TO xiaoqingyu WITH ADMIN OPTION;
GRANT "RESOURCE" TO xiaoqingyu WITH ADMIN OPTION;
ALTER USER xiaoqingyu DEFAULT ROLE "CONNECT","RESOURCE";
```
结果
![分配权限结果](./分配权限.png)