--Create Aggregate Sales Table
create table KimiaFarmaVirtualIntern..aggregate_sales_table
(
id_invoice nvarchar(10),
tanggal date,
nama nvarchar(100),
cabang_sales nvarchar(50),
group_sales nvarchar(15),
nama_barang nvarchar(50),
harga int,
brand nvarchar(50),
jumlah_barang int,
revenue int
);

--Insert Data to Aggregate Sales Table
insert into KimiaFarmaVirtualIntern..aggregate_sales_table
select id_invoice, tanggal, nama, cabang_sales, group_sales, nama_barang, 
harga, brand, convert(int, jumlah_barang) as jumlah_barang, convert(int, (harga*jumlah_barang)) as revenue
from KimiaFarmaVirtualIntern..table_base_penjualan
where brand = 'SLCYL'
order by tanggal asc

select*from KimiaFarmaVirtualIntern..aggregate_sales_table