DROP TABLE IF exists KimiaFarmaVirtualIntern..table_base_penjualan
create table KimiaFarmaVirtualIntern..table_base_penjualan
(
id_invoice nvarchar(10),
tanggal date,
id_customer nvarchar(10),
nama nvarchar(100),
group_sales nvarchar(15),
cabang_sales nvarchar(50),
kode_barang nvarchar(10),
nama_barang nvarchar(50),
harga int,
brand nvarchar(50),
jumlah_barang int
);

insert into KimiaFarmaVirtualIntern..table_base_penjualan
select pj.id_invoice, convert(date, pj.tanggal) as tanggal, pl.id_customer, pl.nama, pl.group_sales, 
pl.cabang_sales, brg.kode_barang, brg.nama_barang, brg.harga, brg.brand, convert(int, pj.jumlah_barang) as jumlah_barang
from KimiaFarmaVirtualIntern..penjualan_ds$ pj
join KimiaFarmaVirtualIntern..pelanggan_ds$ pl
on pj.id_customer = pl.id_customer
join KimiaFarmaVirtualIntern..barang_ds$ brg
on pj.id_barang = brg.kode_barang

select*from KimiaFarmaVirtualIntern..table_base_penjualan