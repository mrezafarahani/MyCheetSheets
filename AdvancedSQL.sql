-- Advanced SQL
-- PARTITION BY
select v.*, (count(*) over (Partition by v.make) / @aa) AS make_count  from Vehicle_Type v


-- ROW_NUMBER()
-- Creare an ever-increasing  integral values
ROW_Number() OVER (.... ORDER BY var1, var2, ...)
select v.*, ROW_Number() OVER (ORDER BY make, model) as RNUM from Vehicle_Type v
select v.*, ROW_Number() OVER (partition by make ORDER BY model) as RNUM from Vehicle_Type v
 
 -- LSITAGG()
 -- Concatinates values appearing in a single column
 
 --LEAD()
 --LAG()
 LEAD(columnName, nbrRowsToLead, defValue ) over (...)
 LAG(columnName, nbrRowsToLead, defValue ) over (...)
 
 select o.TIMESTAMP, o.Speed LEAD(o.Speed, 1, -1) over (order by o.timestamp) as Lead_speed_1
 from obd_data o