# 实验二
#### 创建完成后角色和用户
```flow js
  用户：xiaoqingyu
  角色：xqy
  密码：123
```

1. 第一步
>以system登录到pdborcl，创建角色和用户 ，并进行授权和分配空间
```sql
$ sqlplus system/123@pdborcl
SQL> CREATE ROLE con_res_view;
Role created.
SQL> GRANT connect,resource,CREATE VIEW TO xqy;
Grant succeeded.
SQL> CREATE USER xiaoqingyu IDENTIFIED BY 123 DEFAULT TABLESPACE users TEMPORARY TABLESPACE temp;
User created.
SQL> ALTER USER xiaoqingyu QUOTA 50M ON users;
User altered.
SQL> GRANT xqy TO xiaoqingyu;
Grant succeeded.
SQL> exit
```
2. 第二步
>使用新用户连接到pdborcl，创建表mytable和视图myview，插入数据，最后将myview的SELECT对象权限授予hr用户
```sql
$ sqlplus xiaoqingyu/123@pdborcl
SQL> show user;
USER is "NEW_USER"
SQL> CREATE TABLE mytable (id number,name varchar(50));
Table created.
SQL> INSERT INTO mytable(id,name)VALUES(1,'zhang');
1 row created.
SQL> INSERT INTO mytable(id,name)VALUES (2,'wang');
1 row created.
SQL> INSERT INTO mytable(id,name)VALUES (3,'xiao');
1 row created.
SQL> CREATE VIEW myview AS SELECT name FROM mytable;
View created.
SQL> SELECT * FROM myview;
NAME
--------------------------------------------------
zhang
wang
xiao
SQL> GRANT SELECT ON myview TO hr;
Grant succeeded.
SQL>exit
```
3. 第三步
>用户hr连接到pdborcl，查询新用户授予它的视图myview
```sql
$ sqlplus hr/123@pdborcl
SQL> SELECT * FROM xiaoqingyu.myview;
NAME
--------------------------------------------------
zhang
wang
xiao
SQL> exit
```
4. 第四步
>测试一下同学用户之间的表的共享

