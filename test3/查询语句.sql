--查询数据匹配条数
select count(*) from orders a,order_details b where a.order_id=b.order_id;

-- 查询匹配数据
select * from orders a,order_details b where a.order_id=b.order_id;