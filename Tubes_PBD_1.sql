CREATE TABLE customer (
    customer_id       INTEGER NOT NULL,
    nama_customer     VARCHAR2(4000),
    alamat_customer   VARCHAR2(4000),
    jenis_kelamin     VARCHAR2(4000),
    no_handphone      INTEGER,
    email_customer    VARCHAR2(4000),
    poin_customer     INTEGER,
    ttl_customer      VARCHAR2(4000)
);
ALTER TABLE customer ADD CONSTRAINT customer_pk PRIMARY KEY ( customer_id );

CREATE TABLE layanan (
    id_layanan     INTEGER NOT NULL,
    nama_layanan   VARCHAR2(4000),
    tagihan        VARCHAR2(4000)
);
ALTER TABLE layanan ADD CONSTRAINT layanan_pk PRIMARY KEY ( id_layanan );

CREATE TABLE membayar (
    customer_id   INTEGER NOT NULL,
    id_layanan    INTEGER NOT NULL,
    pk_membayar   VARCHAR2(4000) NOT NULL
);
ALTER TABLE membayar ADD CONSTRAINT memilih_pk PRIMARY KEY ( pk_membayar );
ALTER TABLE membayar ADD CONSTRAINT membayar_customer_fk FOREIGN KEY ( customer_id ) REFERENCES customer ( customer_id );
ALTER TABLE membayar ADD CONSTRAINT membayar_layanan_fk FOREIGN KEY ( id_layanan ) REFERENCES layanan ( id_layanan );

CREATE TABLE pembayaran (
    no_pesanan           INTEGER NOT NULL,
    periode_pembayaran   VARCHAR2(11 CHAR),
    kode_pembayaran      INTEGER,
    rincian_pembayaran   VARCHAR2(4000)
);
ALTER TABLE pembayaran ADD CONSTRAINT pembayaran_pk PRIMARY KEY ( no_pesanan );

CREATE TABLE memiliki (
    pk_memiliki             VARCHAR2(4000) NOT NULL,
    membayar_pk_membayar    VARCHAR2(4000) NOT NULL,
    pembayaran_no_pesanan   INTEGER NOT NULL
);
ALTER TABLE memiliki ADD CONSTRAINT memiliki_pk PRIMARY KEY ( pk_memiliki );
ALTER TABLE memiliki ADD CONSTRAINT memiliki_membayar_fk FOREIGN KEY ( membayar_pk_membayar ) REFERENCES membayar ( pk_membayar );
ALTER TABLE memiliki ADD CONSTRAINT memiliki_pembayaran_fk FOREIGN KEY ( pembayaran_no_pesanan ) REFERENCES pembayaran ( no_pesanan );

CREATE TABLE MyBills (
    list_tagihan   VARCHAR2(4000),
    id_layanan     INTEGER NOT NULL
);
ALTER TABLE MyBills ADD CONSTRAINT MyBills_PK PRIMARY KEY ( id_layanan );
ALTER TABLE MyBills ADD CONSTRAINT MyBills_Layanan_FK FOREIGN KEY ( id_layanan ) REFERENCES layanan ( id_layanan );

CREATE TABLE TopUpandDataPack (
    no_destinasi       INTEGER,
    jenis_simcard      VARCHAR2(4000),
    paket_data         VARCHAR2(4000),
    Nominal_TopUp      REAL,
    harga_paket        REAL,
    id_layanan         INTEGER NOT NULL
);
ALTER TABLE TopUpandDataPack ADD CONSTRAINT TopUpandDataPack_PK PRIMARY KEY ( id_layanan );
ALTER TABLE TopUpandDataPack ADD CONSTRAINT TopUpandDataPack_Layanan_FK FOREIGN KEY ( id_layanan ) REFERENCES layanan ( id_layanan );

CREATE TABLE mobile_postpaid (
    no_handphone   INTEGER,
    id_layanan     INTEGER NOT NULL
);
ALTER TABLE mobile_postpaid ADD CONSTRAINT mobile_postpaid_pk PRIMARY KEY ( id_layanan );
ALTER TABLE mobile_postpaid ADD CONSTRAINT mobile_postpaid_layanan_fk FOREIGN KEY ( id_layanan ) REFERENCES layanan ( id_layanan );

CREATE TABLE PLN_Electricity (
    meter_number   INTEGER,
    tipe_produk    VARCHAR2(4000),
    id_layanan     INTEGER NOT NULL
);
ALTER TABLE PLN_Electricity ADD CONSTRAINT PLN_Electricity_PK PRIMARY KEY ( id_layanan );
ALTER TABLE PLN_Electricity ADD CONSTRAINT PLN_Electricity_Layanan_FK FOREIGN KEY ( id_layanan ) REFERENCES layanan ( id_layanan );

CREATE TABLE bpjs_kesehatan (
    periode_bayar   VARCHAR2(4000),
    id_layanan      INTEGER NOT NULL
);
ALTER TABLE bpjs_kesehatan ADD CONSTRAINT bpjs_kesehatan_pk PRIMARY KEY ( id_layanan );
ALTER TABLE bpjs_kesehatan ADD CONSTRAINT bpjs_kesehatan_layanan_fk FOREIGN KEY ( id_layanan ) REFERENCES layanan ( id_layanan );

CREATE TABLE telkom (
    "No_Telepon Rumah"   INTEGER,
    id_layanan           INTEGER NOT NULL
);
ALTER TABLE telkom ADD CONSTRAINT telkom_pk PRIMARY KEY ( id_layanan );
ALTER TABLE Telkom ADD CONSTRAINT telkom_layanan_fk FOREIGN KEY ( id_layanan ) REFERENCES layanan ( id_layanan );

CREATE TABLE PDAM (
    nama_perusahaan   VARCHAR2(4000),
    id_layanan        INTEGER NOT NULL
);
ALTER TABLE PDAM ADD CONSTRAINT PDAM_pk PRIMARY KEY ( id_layanan );
ALTER TABLE PDAM ADD CONSTRAINT PDAM_layanan_fk FOREIGN KEY ( id_layanan ) REFERENCES layanan ( id_layanan );

CREATE TABLE voucher_game (
    platform_game     VARCHAR2(4000),
    nominal_voucher   REAL,
    id_layanan        INTEGER NOT NULL
);
ALTER TABLE voucher_game ADD CONSTRAINT voucher_game_pk PRIMARY KEY ( id_layanan );
ALTER TABLE voucher_game ADD CONSTRAINT voucher_game_layanan_fk FOREIGN KEY ( id_layanan ) REFERENCES layanan ( id_layanan );

CREATE TABLE kartu_kredit (
    No_Kartu_Kredit   INTEGER NOT NULL,
    form_pembayaran     VARCHAR2(4000),
    no_pesanan          INTEGER NOT NULL
);
ALTER TABLE kartu_kredit ADD CONSTRAINT kartu_kredit_pk PRIMARY KEY ( No_Kartu_Kredit );
ALTER TABLE kartu_kredit ADD CONSTRAINT kartu_kredit_pembayaran_fk FOREIGN KEY ( no_pesanan ) REFERENCES pembayaran ( no_pesanan );

CREATE TABLE TransferandATM (
    no_rekening      INTEGER NOT NULL,
    jenis_rekening   VARCHAR2(4000),
    no_pesanan       INTEGER NOT NULL
);
ALTER TABLE TransferandATM ADD CONSTRAINT TransferandATM_PK PRIMARY KEY ( no_rekening );
ALTER TABLE TransferandATM ADD CONSTRAINT TransferandATM_Pembayaran_FK FOREIGN KEY ( no_pesanan ) REFERENCES pembayaran ( no_pesanan );

CREATE TABLE Direct_Debits (
    Jenis_Direct_Debits   VARCHAR2(4000),
    no_pesanan              INTEGER NOT NULL
);
ALTER TABLE Direct_Debits ADD CONSTRAINT Direct_Debits_PK PRIMARY KEY ( no_pesanan );
ALTER TABLE Direct_Debits ADD CONSTRAINT Direct_Debits_Pembayaran_FK FOREIGN KEY ( no_pesanan ) REFERENCES pembayaran ( no_pesanan );

CREATE TABLE Alfmart_Indomrt (
    jenis_minimarket   VARCHAR2(4000),
    no_pesanan         INTEGER NOT NULL
);
ALTER TABLE Alfmart_Indomrt ADD CONSTRAINT Alfmart_Indomrt_PK PRIMARY KEY ( no_pesanan );
ALTER TABLE Alfmart_Indomrt ADD CONSTRAINT Alfmart_Indomrt_Pembayaran_FK FOREIGN KEY ( no_pesanan ) REFERENCES pembayaran ( no_pesanan );

CREATE TABLE Uangku_Balance (
    saldo_uangku   REAL,
    no_pesanan     INTEGER NOT NULL
);
ALTER TABLE Uangku_Balance ADD CONSTRAINT Uangku_Balance_PK PRIMARY KEY ( no_pesanan );
ALTER TABLE Uangku_Balance ADD CONSTRAINT Uangku_Balance_Pembayaran_FK FOREIGN KEY ( no_pesanan ) REFERENCES pembayaran ( no_pesanan );

alter session set nls_date_format= 'dd-month-yyyy';

insert into customer (customer_id,nama_customer,alamat_customer,jenis_kelamin,no_handphone,email_customer,poin_customer,ttl_customer) values (54001,'Barkah','Jl.Sapan','Laki-laki',082217048581,'barkah@gmail.com',50000,'02-02-1999');
insert into customer (customer_id,nama_customer,alamat_customer,jenis_kelamin,no_handphone,email_customer,poin_customer,ttl_customer) values (54002,'Kafel','Jl.Sapan','Laki-laki',082217048582,'kafel@gmail.com',300,'01-01-1999');
insert into customer (customer_id,nama_customer,alamat_customer,jenis_kelamin,no_handphone,email_customer,poin_customer,ttl_customer) values (54003,'Brahma','Jl.Majalaya','Laki-laki',082217048583,'brahma@gmail.com',50,'03-03-1999');
insert into customer (customer_id,nama_customer,alamat_customer,jenis_kelamin,no_handphone,email_customer,poin_customer,ttl_customer) values (54004,'Evan','Jl.Ciparay','Laki-laki',082217048584,'evan@gmail.com',2470,'04-04-1999');
insert into customer (customer_id,nama_customer,alamat_customer,jenis_kelamin,no_handphone,email_customer,poin_customer,ttl_customer) values (54005,'Anya','Jl.Pacet ','Perempuan',082217048585,'anya@gmail.com',600,'05-05-1999');
insert into customer (customer_id,nama_customer,alamat_customer,jenis_kelamin,no_handphone,email_customer,poin_customer,ttl_customer) values (54006,'Sheni','Jl.Rancaekek','Perempuan',082217048586,'sheni@gmail.com',550,'06-06-1999');
insert into customer (customer_id,nama_customer,alamat_customer,jenis_kelamin,no_handphone,email_customer,poin_customer,ttl_customer) values (54007,'Rai','Jl.Pacet','Perempuan',082217048587,'rai@gmail.com',350,'07-07-1999');
insert into customer (customer_id,nama_customer,alamat_customer,jenis_kelamin,no_handphone,email_customer,poin_customer,ttl_customer) values (54008,'Noni','Jl.Andir','Perempuan',082217048588,'noni@gmail.com',250,'08-08-1999');
insert into customer (customer_id,nama_customer,alamat_customer,jenis_kelamin,no_handphone,email_customer,poin_customer,ttl_customer) values (54009,'Nandifa','Jl.Andir','Perempuan',082217048589,'nandifa@gmail.com',880,'09-09-1999');
insert into customer (customer_id,nama_customer,alamat_customer,jenis_kelamin,no_handphone,email_customer,poin_customer,ttl_customer) values (54010,'Devia','Jl.Magung','Perempuan',082217048590,'devia@gmail.com',620,'10-10-1999');
insert into customer (customer_id,nama_customer,alamat_customer,jenis_kelamin,no_handphone,email_customer,poin_customer,ttl_customer) values (54011,'Anis','Jl.Majala','Perempuan',082217048591,'anis@gmail.com',50000,'02-03-1999');
insert into customer (customer_id,nama_customer,alamat_customer,jenis_kelamin,no_handphone,email_customer,poin_customer,ttl_customer) values (54012,'Agung','Jl.Sapan','Laki-laki',082217048592,'agung@gmail.com',300,'01-02-1999');
insert into customer (customer_id,nama_customer,alamat_customer,jenis_kelamin,no_handphone,email_customer,poin_customer,ttl_customer) values (54013,'Andi','Jl.Majalaya','Laki-laki',082217048593,'andi@gmail.com',50,'03-04-1999');
insert into customer (customer_id,nama_customer,alamat_customer,jenis_kelamin,no_handphone,email_customer,poin_customer,ttl_customer) values (54014,'Budi','Jl.Ciparay','Laki-laki',082217048594,'budi@gmail.com',2470,'04-05-1999');
insert into customer (customer_id,nama_customer,alamat_customer,jenis_kelamin,no_handphone,email_customer,poin_customer,ttl_customer) values (54015,'Karis','Jl.Pacet ','Perempuan',082217048595,'karis@gmail.com',600,'05-06-1999');
insert into customer (customer_id,nama_customer,alamat_customer,jenis_kelamin,no_handphone,email_customer,poin_customer,ttl_customer) values (54016,'Satria','Jl.Rancaekek','Perempuan',082217048596,'satria@gmail.com',550,'06-07-1999');
insert into customer (customer_id,nama_customer,alamat_customer,jenis_kelamin,no_handphone,email_customer,poin_customer,ttl_customer) values (54017,'Asmi','Jl.Sabuga','Perempuan',082217048597,'asmi@gmail.com',350,'07-04-1999');
insert into customer (customer_id,nama_customer,alamat_customer,jenis_kelamin,no_handphone,email_customer,poin_customer,ttl_customer) values (54018,'Angga','Jl.Andelir','Perempuan',082217048598,'angga@gmail.com',250,'08-01-1999');
insert into customer (customer_id,nama_customer,alamat_customer,jenis_kelamin,no_handphone,email_customer,poin_customer,ttl_customer) values (54019,'Surya','Jl.Andir','Perempuan',082217048599,'surya@gmail.com',880,'09-12-1999');
insert into customer (customer_id,nama_customer,alamat_customer,jenis_kelamin,no_handphone,email_customer,poin_customer,ttl_customer) values (54020,'Winda','Jl.Magung','Perempuan',082217048100,'winda@gmail.com',620,'10-19-1999');

insert into layanan (id_layanan,nama_layanan,tagihan) values (2101,'Top Up and Data Package','top up Rp.25000');
insert into layanan (id_layanan,nama_layanan,tagihan) values (2102,'Mobile Postpaid','Rp.100000');
insert into layanan (id_layanan,nama_layanan,tagihan) values (2103,'PLN Electricity','Rp.300000');
insert into layanan (id_layanan,nama_layanan,tagihan) values (2104,'BPJS Kesehatan','Rp.50000');
insert into layanan (id_layanan,nama_layanan,tagihan) values (2105,'Telkom','Rp.350000');
insert into layanan (id_layanan,nama_layanan,tagihan) values (2106,'PDAM','Rp.100000');
insert into layanan (id_layanan,nama_layanan,tagihan) values (2107,'Voucher Game','Rp.1000000');
insert into layanan (id_layanan,nama_layanan,tagihan) values (2108,'Voucher Game','Rp.500000');
insert into layanan (id_layanan,nama_layanan,tagihan) values (2109,'Top Up and Data Package','Data Rp.50000');
insert into layanan (id_layanan,nama_layanan,tagihan) values (2110,'BPJS Kesehatan','Rp. 100000');
insert into layanan (id_layanan,nama_layanan,tagihan) values (2111,'Top Up and Data Package','top up Rp.50000');
insert into layanan (id_layanan,nama_layanan,tagihan) values (2112,'Mobile Postpaid','Rp.150000');
insert into layanan (id_layanan,nama_layanan,tagihan) values (2113,'PLN Electricity','Rp.200000');
insert into layanan (id_layanan,nama_layanan,tagihan) values (2114,'BPJS Kesehatan','Rp.55000');
insert into layanan (id_layanan,nama_layanan,tagihan) values (2115,'Telkom','Rp.400000');
insert into layanan (id_layanan,nama_layanan,tagihan) values (2116,'PDAM','Rp.200000');
insert into layanan (id_layanan,nama_layanan,tagihan) values (2117,'Voucher Game','Rp.2000000');
insert into layanan (id_layanan,nama_layanan,tagihan) values (2118,'Voucher Game','Rp.600000');
insert into layanan (id_layanan,nama_layanan,tagihan) values (2119,'Top Up and Data Package','Data Rp.100000');
insert into layanan (id_layanan,nama_layanan,tagihan) values (2120,'BPJS Kesehatan','Rp. 200000');
insert into layanan (id_layanan,nama_layanan,tagihan) values (2121,'Top Up and Data Package','top up Rp.30000');
insert into layanan (id_layanan,nama_layanan,tagihan) values (2122,'Mobile Postpaid','Rp.150000');
insert into layanan (id_layanan,nama_layanan,tagihan) values (2123,'PLN Electricity','Rp.250000');
insert into layanan (id_layanan,nama_layanan,tagihan) values (2124,'BPJS Kesehatan','Rp.60000');
insert into layanan (id_layanan,nama_layanan,tagihan) values (2125,'Telkom','Rp.400000');
insert into layanan (id_layanan,nama_layanan,tagihan) values (2126,'PDAM','Rp.150000');
insert into layanan (id_layanan,nama_layanan,tagihan) values (2127,'Voucher Game','Rp.1500000');
insert into layanan (id_layanan,nama_layanan,tagihan) values (2128,'Voucher Game','Rp.550000');
insert into layanan (id_layanan,nama_layanan,tagihan) values (2129,'Top Up and Data Package','Data Rp.55000');
insert into layanan (id_layanan,nama_layanan,tagihan) values (2130,'BPJS Kesehatan','Rp. 150000');
insert into layanan (id_layanan,nama_layanan,tagihan) values (2131,'Top Up and Data Package','top up Rp.55000');
insert into layanan (id_layanan,nama_layanan,tagihan) values (2132,'Mobile Postpaid','Rp.200000');
insert into layanan (id_layanan,nama_layanan,tagihan) values (2133,'PLN Electricity','Rp.150000');
insert into layanan (id_layanan,nama_layanan,tagihan) values (2134,'BPJS Kesehatan','Rp.65000');
insert into layanan (id_layanan,nama_layanan,tagihan) values (2135,'Telkom','Rp.450000');
insert into layanan (id_layanan,nama_layanan,tagihan) values (2136,'PDAM','Rp.250000');
insert into layanan (id_layanan,nama_layanan,tagihan) values (2137,'Voucher Game','Rp.2500000');
insert into layanan (id_layanan,nama_layanan,tagihan) values (2138,'Voucher Game','Rp.650000');
insert into layanan (id_layanan,nama_layanan,tagihan) values (2139,'Top Up and Data Package','Data Rp.150000');
insert into layanan (id_layanan,nama_layanan,tagihan) values (2140,'BPJS Kesehatan','Rp. 250000');

insert into membayar (customer_id,id_layanan,pk_membayar) values (54001,2101,'top up Rp.25000');
insert into membayar (customer_id,id_layanan,pk_membayar) values (54001,2102,'Mobile Postpaid Rp.100000');
insert into membayar (customer_id,id_layanan,pk_membayar) values (54001,2103,'PLN Electricity Rp.300000');
insert into membayar (customer_id,id_layanan,pk_membayar) values (54002,2104,'BPJS Kesehatan Rp.50000');
insert into membayar (customer_id,id_layanan,pk_membayar) values (54013,2105,'Telkom Rp.350000');
insert into membayar (customer_id,id_layanan,pk_membayar) values (54004,2106,'PDAM Rp.100000');
insert into membayar (customer_id,id_layanan,pk_membayar) values (54005,2107,'Voucher Game Rp.1000000');
insert into membayar (customer_id,id_layanan,pk_membayar) values (54002,2108,'Voucher Game Rp.500000');
insert into membayar (customer_id,id_layanan,pk_membayar) values (54005,2109,'Data Rp.50000');
insert into membayar (customer_id,id_layanan,pk_membayar) values (54009,2110,'BPJS Kesehatan Rp. 100000');
insert into membayar (customer_id,id_layanan,pk_membayar) values (54001,2111,'top up Rp.50000');
insert into membayar (customer_id,id_layanan,pk_membayar) values (54011,2112,'Mobile Postpaid Rp.200000');
insert into membayar (customer_id,id_layanan,pk_membayar) values (54002,2113,'PLN Electricity Rp.200000');
insert into membayar (customer_id,id_layanan,pk_membayar) values (54012,2114,'BPJS Kesehatan Rp.55000');
insert into membayar (customer_id,id_layanan,pk_membayar) values (54003,2115,'Telkom Rp.400000 ');
insert into membayar (customer_id,id_layanan,pk_membayar) values (54004,2116,'PDAM Rp.200000');
insert into membayar (customer_id,id_layanan,pk_membayar) values (54017,2117,'Voucher Game Rp.2000000');
insert into membayar (customer_id,id_layanan,pk_membayar) values (54008,2118,'Voucher Game Rp.600000');
insert into membayar (customer_id,id_layanan,pk_membayar) values (54013,2119,'Data Rp.100000');
insert into membayar (customer_id,id_layanan,pk_membayar) values (54010,2120,'BPJS Kesehatan Rp. 200000');
insert into membayar (customer_id,id_layanan,pk_membayar) values (54012,2121,'top up Rp.30000');
insert into membayar (customer_id,id_layanan,pk_membayar) values (54011,2122,'Mobile Postpaid Rp.150000');
insert into membayar (customer_id,id_layanan,pk_membayar) values (54009,2123,'PLN Electricity Rp.250000');
insert into membayar (customer_id,id_layanan,pk_membayar) values (54012,2124,'BPJS Kesehatan Rp.60000');
insert into membayar (customer_id,id_layanan,pk_membayar) values (54013,2125,'Telkom Rp.400000');
insert into membayar (customer_id,id_layanan,pk_membayar) values (54019,2126,'PDAM Rp.150000');
insert into membayar (customer_id,id_layanan,pk_membayar) values (54005,2127,'Voucher Game Rp.1500000');
insert into membayar (customer_id,id_layanan,pk_membayar) values (54015,2128,'Voucher Game Rp.550000');
insert into membayar (customer_id,id_layanan,pk_membayar) values (54015,2129,'Data Rp.55000');
insert into membayar (customer_id,id_layanan,pk_membayar) values (54019,2130,'BPJS Kesehatan Rp. 150000');
insert into membayar (customer_id,id_layanan,pk_membayar) values (54013,2131,'top up Rp.55000');
insert into membayar (customer_id,id_layanan,pk_membayar) values (54013,2132,'Mobile Postpaid Rp.250000');
insert into membayar (customer_id,id_layanan,pk_membayar) values (54019,2133,'PLN Electricity Rp.150000');
insert into membayar (customer_id,id_layanan,pk_membayar) values (54020,2134,'BPJS Kesehatan Rp.65000');
insert into membayar (customer_id,id_layanan,pk_membayar) values (54020,2135,'Telkom Rp.450000');
insert into membayar (customer_id,id_layanan,pk_membayar) values (54017,2136,'PDAM Rp.250000');
insert into membayar (customer_id,id_layanan,pk_membayar) values (54016,2137,'Voucher Game Rp.2500000');
insert into membayar (customer_id,id_layanan,pk_membayar) values (54016,2138,'Voucher Game Rp.650000');
insert into membayar (customer_id,id_layanan,pk_membayar) values (54018,2139,'Data Rp.150000');
insert into membayar (customer_id,id_layanan,pk_membayar) values (54002,2140,'BPJS Kesehatan Rp. 250000');

insert into pembayaran (no_pesanan,periode_pembayaran,kode_pembayaran,rincian_pembayaran) values (801,'11-12-2018',987654321,'Mohon Selesaikan Pembayaran dalam waktu 23 jam 59 menit. Dengan Harga Total Rp.5000000');
insert into pembayaran (no_pesanan,periode_pembayaran,kode_pembayaran,rincian_pembayaran) values (802,'11-13-2018',987654322,'Mohon Selesaikan Pembayaran dalam waktu 23 jam 59 menit. Dengan Harga Total Rp.5000000');
insert into pembayaran (no_pesanan,periode_pembayaran,kode_pembayaran,rincian_pembayaran) values (803,'11-14-2018',987654323,'Mohon Selesaikan Pembayaran dalam waktu 23 jam 59 menit. Dengan Harga Total Rp.5000000');
insert into pembayaran (no_pesanan,periode_pembayaran,kode_pembayaran,rincian_pembayaran) values (804,'11-15-2018',987654324,'Mohon Selesaikan Pembayaran dalam waktu 23 jam 59 menit. Dengan Harga Total Rp.5000000');
insert into pembayaran (no_pesanan,periode_pembayaran,kode_pembayaran,rincian_pembayaran) values (805,'11-16-2018',987654325,'Mohon Selesaikan Pembayaran dalam waktu 23 jam 59 menit. Dengan Harga Total Rp.5000000');
insert into pembayaran (no_pesanan,periode_pembayaran,kode_pembayaran,rincian_pembayaran) values (806,'11-17-2018',987654326,'Mohon Selesaikan Pembayaran dalam waktu 23 jam 59 menit. Dengan Harga Total Rp.5000000');
insert into pembayaran (no_pesanan,periode_pembayaran,kode_pembayaran,rincian_pembayaran) values (807,'11-18-2018',987654327,'Mohon Selesaikan Pembayaran dalam waktu 23 jam 59 menit. Dengan Harga Total Rp.5000000');
insert into pembayaran (no_pesanan,periode_pembayaran,kode_pembayaran,rincian_pembayaran) values (808,'11-18-2018',987654328,'Mohon Selesaikan Pembayaran dalam waktu 23 jam 59 menit. Dengan Harga Total Rp.5000000');
insert into pembayaran (no_pesanan,periode_pembayaran,kode_pembayaran,rincian_pembayaran) values (809,'11-19-2018',987654329,'Mohon Selesaikan Pembayaran dalam waktu 23 jam 59 menit. Dengan Harga Total Rp.5000000');
insert into pembayaran (no_pesanan,periode_pembayaran,kode_pembayaran,rincian_pembayaran) values (810,'11-20-2018',987654330,'Mohon Selesaikan Pembayaran dalam waktu 23 jam 59 menit. Dengan Harga Total Rp.5000000');
insert into pembayaran (no_pesanan,periode_pembayaran,kode_pembayaran,rincian_pembayaran) values (811,'11-21-2018',987654331,'Mohon Selesaikan Pembayaran dalam waktu 23 jam 59 menit. Dengan Harga Total Rp.5000000');
insert into pembayaran (no_pesanan,periode_pembayaran,kode_pembayaran,rincian_pembayaran) values (812,'11-22-2018',987654332,'Mohon Selesaikan Pembayaran dalam waktu 23 jam 59 menit. Dengan Harga Total Rp.5000000');
insert into pembayaran (no_pesanan,periode_pembayaran,kode_pembayaran,rincian_pembayaran) values (813,'11-23-2018',987654333,'Mohon Selesaikan Pembayaran dalam waktu 23 jam 59 menit. Dengan Harga Total Rp.5000000');
insert into pembayaran (no_pesanan,periode_pembayaran,kode_pembayaran,rincian_pembayaran) values (814,'11-24-2018',987654334,'Mohon Selesaikan Pembayaran dalam waktu 23 jam 59 menit. Dengan Harga Total Rp.5000000');
insert into pembayaran (no_pesanan,periode_pembayaran,kode_pembayaran,rincian_pembayaran) values (815,'11-25-2018',987654335,'Mohon Selesaikan Pembayaran dalam waktu 23 jam 59 menit. Dengan Harga Total Rp.5000000');
insert into pembayaran (no_pesanan,periode_pembayaran,kode_pembayaran,rincian_pembayaran) values (816,'11-26-2018',987654336,'Mohon Selesaikan Pembayaran dalam waktu 23 jam 59 menit. Dengan Harga Total Rp.5000000');
insert into pembayaran (no_pesanan,periode_pembayaran,kode_pembayaran,rincian_pembayaran) values (817,'11-27-2018',987654337,'Mohon Selesaikan Pembayaran dalam waktu 23 jam 59 menit. Dengan Harga Total Rp.5000000');
insert into pembayaran (no_pesanan,periode_pembayaran,kode_pembayaran,rincian_pembayaran) values (818,'11-28-2018',987654338,'Mohon Selesaikan Pembayaran dalam waktu 23 jam 59 menit. Dengan Harga Total Rp.5000000');
insert into pembayaran (no_pesanan,periode_pembayaran,kode_pembayaran,rincian_pembayaran) values (819,'11-29-2018',987654339,'Mohon Selesaikan Pembayaran dalam waktu 23 jam 59 menit. Dengan Harga Total Rp.5000000');
insert into pembayaran (no_pesanan,periode_pembayaran,kode_pembayaran,rincian_pembayaran) values (820,'11-30-2018',987654340,'Mohon Selesaikan Pembayaran dalam waktu 23 jam 59 menit. Dengan Harga Total Rp.5000000');
insert into pembayaran (no_pesanan,periode_pembayaran,kode_pembayaran,rincian_pembayaran) values (821,'12-01-2018',987654341,'Mohon Selesaikan Pembayaran dalam waktu 23 jam 59 menit. Dengan Harga Total Rp.5000000');
insert into pembayaran (no_pesanan,periode_pembayaran,kode_pembayaran,rincian_pembayaran) values (822,'12-02-2018',987654342,'Mohon Selesaikan Pembayaran dalam waktu 23 jam 59 menit. Dengan Harga Total Rp.5000000');
insert into pembayaran (no_pesanan,periode_pembayaran,kode_pembayaran,rincian_pembayaran) values (823,'12-03-2018',987654343,'Mohon Selesaikan Pembayaran dalam waktu 23 jam 59 menit. Dengan Harga Total Rp.5000000');
insert into pembayaran (no_pesanan,periode_pembayaran,kode_pembayaran,rincian_pembayaran) values (824,'12-04-2018',987654344,'Mohon Selesaikan Pembayaran dalam waktu 23 jam 59 menit. Dengan Harga Total Rp.5000000');
insert into pembayaran (no_pesanan,periode_pembayaran,kode_pembayaran,rincian_pembayaran) values (825,'12-05-2018',987654345,'Mohon Selesaikan Pembayaran dalam waktu 23 jam 59 menit. Dengan Harga Total Rp.5000000');
insert into pembayaran (no_pesanan,periode_pembayaran,kode_pembayaran,rincian_pembayaran) values (826,'12-06-2018',987654346,'Mohon Selesaikan Pembayaran dalam waktu 23 jam 59 menit. Dengan Harga Total Rp.5000000');
insert into pembayaran (no_pesanan,periode_pembayaran,kode_pembayaran,rincian_pembayaran) values (827,'12-07-2018',987654347,'Mohon Selesaikan Pembayaran dalam waktu 23 jam 59 menit. Dengan Harga Total Rp.5000000');
insert into pembayaran (no_pesanan,periode_pembayaran,kode_pembayaran,rincian_pembayaran) values (828,'12-08-2018',987654348,'Mohon Selesaikan Pembayaran dalam waktu 23 jam 59 menit. Dengan Harga Total Rp.5000000');
insert into pembayaran (no_pesanan,periode_pembayaran,kode_pembayaran,rincian_pembayaran) values (829,'12-09-2018',987654349,'Mohon Selesaikan Pembayaran dalam waktu 23 jam 59 menit. Dengan Harga Total Rp.5000000');
insert into pembayaran (no_pesanan,periode_pembayaran,kode_pembayaran,rincian_pembayaran) values (830,'12-10-2018',987654350,'Mohon Selesaikan Pembayaran dalam waktu 23 jam 59 menit. Dengan Harga Total Rp.5000000');
insert into pembayaran (no_pesanan,periode_pembayaran,kode_pembayaran,rincian_pembayaran) values (831,'12-11-2018',987654351,'Mohon Selesaikan Pembayaran dalam waktu 23 jam 59 menit. Dengan Harga Total Rp.5000000');
insert into pembayaran (no_pesanan,periode_pembayaran,kode_pembayaran,rincian_pembayaran) values (832,'12-12-2018',987654352,'Mohon Selesaikan Pembayaran dalam waktu 23 jam 59 menit. Dengan Harga Total Rp.5000000');
insert into pembayaran (no_pesanan,periode_pembayaran,kode_pembayaran,rincian_pembayaran) values (833,'12-13-2018',987654353,'Mohon Selesaikan Pembayaran dalam waktu 23 jam 59 menit. Dengan Harga Total Rp.5000000');
insert into pembayaran (no_pesanan,periode_pembayaran,kode_pembayaran,rincian_pembayaran) values (834,'12-14-2018',987654354,'Mohon Selesaikan Pembayaran dalam waktu 23 jam 59 menit. Dengan Harga Total Rp.5000000');
insert into pembayaran (no_pesanan,periode_pembayaran,kode_pembayaran,rincian_pembayaran) values (835,'12-15-2018',987654355,'Mohon Selesaikan Pembayaran dalam waktu 23 jam 59 menit. Dengan Harga Total Rp.5000000');
insert into pembayaran (no_pesanan,periode_pembayaran,kode_pembayaran,rincian_pembayaran) values (836,'12-16-2018',987654356,'Mohon Selesaikan Pembayaran dalam waktu 23 jam 59 menit. Dengan Harga Total Rp.5000000');
insert into pembayaran (no_pesanan,periode_pembayaran,kode_pembayaran,rincian_pembayaran) values (837,'12-17-2018',987654357,'Mohon Selesaikan Pembayaran dalam waktu 23 jam 59 menit. Dengan Harga Total Rp.5000000');
insert into pembayaran (no_pesanan,periode_pembayaran,kode_pembayaran,rincian_pembayaran) values (838,'12-18-2018',987654358,'Mohon Selesaikan Pembayaran dalam waktu 23 jam 59 menit. Dengan Harga Total Rp.5000000');
insert into pembayaran (no_pesanan,periode_pembayaran,kode_pembayaran,rincian_pembayaran) values (839,'12-19-2018',987654359,'Mohon Selesaikan Pembayaran dalam waktu 23 jam 59 menit. Dengan Harga Total Rp.5000000');
insert into pembayaran (no_pesanan,periode_pembayaran,kode_pembayaran,rincian_pembayaran) values (840,'12-20-2018',987654360,'Mohon Selesaikan Pembayaran dalam waktu 23 jam 59 menit. Dengan Harga Total Rp.5000000');

insert into memiliki (pk_memiliki,membayar_pk_membayar,pembayaran_no_pesanan) values ('1.Layanan dan Pembayaran','top up Rp.25000',801);
insert into memiliki (pk_memiliki,membayar_pk_membayar,pembayaran_no_pesanan) values ('2.Layanan dan Pembayaran','Mobile Postpaid Rp.100000',802);
insert into memiliki (pk_memiliki,membayar_pk_membayar,pembayaran_no_pesanan) values ('3.Layanan dan Pembayaran','PLN Electricity Rp.300000',803);
insert into memiliki (pk_memiliki,membayar_pk_membayar,pembayaran_no_pesanan) values ('4.Layanan dan Pembayaran','BPJS Kesehatan Rp.50000',804);
insert into memiliki (pk_memiliki,membayar_pk_membayar,pembayaran_no_pesanan) values ('5.Layanan dan Pembayaran','Telkom Rp.350000',805);
insert into memiliki (pk_memiliki,membayar_pk_membayar,pembayaran_no_pesanan) values ('6.Layanan dan Pembayaran','PDAM Rp.100000',806);
insert into memiliki (pk_memiliki,membayar_pk_membayar,pembayaran_no_pesanan) values ('7.Layanan dan Pembayaran','Voucher Game Rp.1000000',807);
insert into memiliki (pk_memiliki,membayar_pk_membayar,pembayaran_no_pesanan) values ('8.Layanan dan Pembayaran','Voucher Game Rp.500000',808);
insert into memiliki (pk_memiliki,membayar_pk_membayar,pembayaran_no_pesanan) values ('9.Layanan dan Pembayaran','Data Rp.50000',809);
insert into memiliki (pk_memiliki,membayar_pk_membayar,pembayaran_no_pesanan) values ('10.Layanan dan Pembayaran','BPJS Kesehatan Rp. 100000',810);
insert into memiliki (pk_memiliki,membayar_pk_membayar,pembayaran_no_pesanan) values ('11.Layanan dan Pembayaran','top up Rp.50000',811);
insert into memiliki (pk_memiliki,membayar_pk_membayar,pembayaran_no_pesanan) values ('12.Layanan dan Pembayaran','Mobile Postpaid Rp.150000',812);
insert into memiliki (pk_memiliki,membayar_pk_membayar,pembayaran_no_pesanan) values ('13.Layanan dan Pembayaran','PLN Electricity Rp.200000',813);
insert into memiliki (pk_memiliki,membayar_pk_membayar,pembayaran_no_pesanan) values ('14.Layanan dan Pembayaran','BPJS Kesehatan Rp.55000',814);
insert into memiliki (pk_memiliki,membayar_pk_membayar,pembayaran_no_pesanan) values ('15.Layanan dan Pembayaran','Telkom Rp.400000',815);
insert into memiliki (pk_memiliki,membayar_pk_membayar,pembayaran_no_pesanan) values ('16.Layanan dan Pembayaran','PDAM Rp.200000',816);
insert into memiliki (pk_memiliki,membayar_pk_membayar,pembayaran_no_pesanan) values ('17.Layanan dan Pembayaran','Voucher Game Rp.2000000',817);
insert into memiliki (pk_memiliki,membayar_pk_membayar,pembayaran_no_pesanan) values ('18.Layanan dan Pembayaran','Voucher Game Rp.600000',818);
insert into memiliki (pk_memiliki,membayar_pk_membayar,pembayaran_no_pesanan) values ('19.Layanan dan Pembayaran','Data Rp.100000',819);
insert into memiliki (pk_memiliki,membayar_pk_membayar,pembayaran_no_pesanan) values ('20.Layanan dan Pembayaran','BPJS Kesehatan Rp. 200000',820);
insert into memiliki (pk_memiliki,membayar_pk_membayar,pembayaran_no_pesanan) values ('21.Layanan dan Pembayaran','top up Rp.30000',821);
insert into memiliki (pk_memiliki,membayar_pk_membayar,pembayaran_no_pesanan) values ('22.Layanan dan Pembayaran','Mobile Postpaid Rp.150000',822);
insert into memiliki (pk_memiliki,membayar_pk_membayar,pembayaran_no_pesanan) values ('23.Layanan dan Pembayaran','PLN Electricity Rp.250000',823);
insert into memiliki (pk_memiliki,membayar_pk_membayar,pembayaran_no_pesanan) values ('24.Layanan dan Pembayaran','BPJS Kesehatan Rp.60000',824);
insert into memiliki (pk_memiliki,membayar_pk_membayar,pembayaran_no_pesanan) values ('25.Layanan dan Pembayaran','Telkom Rp.400000',825);
insert into memiliki (pk_memiliki,membayar_pk_membayar,pembayaran_no_pesanan) values ('26.Layanan dan Pembayaran','PDAM Rp.150000',826);
insert into memiliki (pk_memiliki,membayar_pk_membayar,pembayaran_no_pesanan) values ('27.Layanan dan Pembayaran','Voucher Game Rp.1500000',827);
insert into memiliki (pk_memiliki,membayar_pk_membayar,pembayaran_no_pesanan) values ('28.Layanan dan Pembayaran','Voucher Game Rp.550000',828);
insert into memiliki (pk_memiliki,membayar_pk_membayar,pembayaran_no_pesanan) values ('29.Layanan dan Pembayaran','Data Rp.55000',829);
insert into memiliki (pk_memiliki,membayar_pk_membayar,pembayaran_no_pesanan) values ('30.Layanan dan Pembayaran','BPJS Kesehatan Rp. 150000',830);
insert into memiliki (pk_memiliki,membayar_pk_membayar,pembayaran_no_pesanan) values ('31.Layanan dan Pembayaran','top up Rp.55000',831);
insert into memiliki (pk_memiliki,membayar_pk_membayar,pembayaran_no_pesanan) values ('32.Layanan dan Pembayaran','Mobile Postpaid Rp.200000',832);
insert into memiliki (pk_memiliki,membayar_pk_membayar,pembayaran_no_pesanan) values ('33.Layanan dan Pembayaran','PLN Electricity Rp.150000',833);
insert into memiliki (pk_memiliki,membayar_pk_membayar,pembayaran_no_pesanan) values ('34.Layanan dan Pembayaran','BPJS Kesehatan Rp.65000',834);
insert into memiliki (pk_memiliki,membayar_pk_membayar,pembayaran_no_pesanan) values ('35.Layanan dan Pembayaran','Telkom Rp.450000',835);
insert into memiliki (pk_memiliki,membayar_pk_membayar,pembayaran_no_pesanan) values ('36.Layanan dan Pembayaran','PDAM Rp.250000',836);
insert into memiliki (pk_memiliki,membayar_pk_membayar,pembayaran_no_pesanan) values ('37.Layanan dan Pembayaran','Voucher Game Rp.2500000',837);
insert into memiliki (pk_memiliki,membayar_pk_membayar,pembayaran_no_pesanan) values ('38.Layanan dan Pembayaran','Voucher Game Rp.650000',838);
insert into memiliki (pk_memiliki,membayar_pk_membayar,pembayaran_no_pesanan) values ('39.Layanan dan Pembayaran','Data Rp.150000',839);
insert into memiliki (pk_memiliki,membayar_pk_membayar,pembayaran_no_pesanan) values ('40.Layanan dan Pembayaran','BPJS Kesehatan Rp. 250000',840);

insert into MyBills (list_tagihan,id_layanan) values ('Top Up and Data Package Rp.25000',2101);
insert into MyBills (list_tagihan,id_layanan) values ('Mobile Postpaid Rp.100000',2102);
insert into MyBills (list_tagihan,id_layanan) values ('PLN Electricity Rp.300000',2103);
insert into MyBills (list_tagihan,id_layanan) values ('BPJS Kesehatan Rp.50000',2104);
insert into MyBills (list_tagihan,id_layanan) values ('Telkom Rp.350000',2105);
insert into MyBills (list_tagihan,id_layanan) values ('PDAM Rp.100000',2106);
insert into MyBills (list_tagihan,id_layanan) values ('Voucher Game Rp.1000000',2107);
insert into MyBills (list_tagihan,id_layanan) values ('Voucher Game Rp.500000',2108);
insert into MyBills (list_tagihan,id_layanan) values ('Top Up and Data Package Rp.50000',2109);
insert into MyBills (list_tagihan,id_layanan) values ('BPJS Kesehatan Rp. 100000',2110);
insert into MyBills (list_tagihan,id_layanan) values ('Top Up and Data Package Rp.50000',2111);
insert into MyBills (list_tagihan,id_layanan) values ('Mobile Postpaid Rp.150000',2112);
insert into MyBills (list_tagihan,id_layanan) values ('PLN Electricity Rp.200000',2113);
insert into MyBills (list_tagihan,id_layanan) values ('BPJS Kesehatan Rp.55000',2114);
insert into MyBills (list_tagihan,id_layanan) values ('Telkom Rp.400000',2115);
insert into MyBills (list_tagihan,id_layanan) values ('PDAM Rp.200000',2116);
insert into MyBills (list_tagihan,id_layanan) values ('Voucher Game Rp.2000000',2117);
insert into MyBills (list_tagihan,id_layanan) values ('Voucher Game Rp.600000',2118);
insert into MyBills (list_tagihan,id_layanan) values ('Top Up and Data Package Rp.100000',2119);
insert into MyBills (list_tagihan,id_layanan) values ('BPJS Kesehatan Rp. 200000',2120);
insert into MyBills (list_tagihan,id_layanan) values ('Top Up and Data Package Rp.30000',2121);
insert into MyBills (list_tagihan,id_layanan) values ('Mobile Postpaid Rp.150000',2122);
insert into MyBills (list_tagihan,id_layanan) values ('PLN Electricity Rp.250000',2123);
insert into MyBills (list_tagihan,id_layanan) values ('BPJS Kesehatan Rp.60000',2124);
insert into MyBills (list_tagihan,id_layanan) values ('Telkom Rp.400000',2125);
insert into MyBills (list_tagihan,id_layanan) values ('PDAM Rp.150000',2126);
insert into MyBills (list_tagihan,id_layanan) values ('Voucher Game Rp.1500000',2127);
insert into MyBills (list_tagihan,id_layanan) values ('Voucher Game Rp.550000',2128);
insert into MyBills (list_tagihan,id_layanan) values ('Top Up and Data Package Rp.55000',2129);
insert into MyBills (list_tagihan,id_layanan) values ('BPJS Kesehatan Rp. 150000',2130);
insert into MyBills (list_tagihan,id_layanan) values ('Top Up and Data Package Rp.55000',2131);
insert into MyBills (list_tagihan,id_layanan) values ('Mobile Postpaid Rp.200000',2132);
insert into MyBills (list_tagihan,id_layanan) values ('PLN Electricity Rp.150000',2133);
insert into MyBills (list_tagihan,id_layanan) values ('BPJS Kesehatan Rp.65000',2134);
insert into MyBills (list_tagihan,id_layanan) values ('Telkom Rp.450000',2135);
insert into MyBills (list_tagihan,id_layanan) values ('PDAM Rp.250000',2136);
insert into MyBills (list_tagihan,id_layanan) values ('Voucher Game Rp.2500000',2137);
insert into MyBills (list_tagihan,id_layanan) values ('Voucher Game Rp.650000',2138);
insert into MyBills (list_tagihan,id_layanan) values ('Top Up and Data Package Rp.150000',2139);
insert into MyBills (list_tagihan,id_layanan) values ('BPJS Kesehatan Rp. 250000',2140);

insert into TopUpandDataPack (no_destinasi,jenis_simcard,paket_data,Nominal_TopUp,harga_paket,id_layanan) values (082212345671,'Telkomsel','Data 25000',25000,25000,2101);
insert into TopUpandDataPack (no_destinasi,jenis_simcard,paket_data,Nominal_TopUp,harga_paket,id_layanan) values (082212345672,'Indosat','Data 30000',10000,30000,2102);
insert into TopUpandDataPack (no_destinasi,jenis_simcard,paket_data,Nominal_TopUp,harga_paket,id_layanan) values (082212345673,'XL','Data 30000',10000,30000,2103);
insert into TopUpandDataPack (no_destinasi,jenis_simcard,paket_data,Nominal_TopUp,harga_paket,id_layanan) values (082212345674,'Axis','Data 40000',10000,40000,2104);
insert into TopUpandDataPack (no_destinasi,jenis_simcard,paket_data,Nominal_TopUp,harga_paket,id_layanan) values (082212345675,'Tri','Data 50000',5000,50000,2105);
insert into TopUpandDataPack (no_destinasi,jenis_simcard,paket_data,Nominal_TopUp,harga_paket,id_layanan) values (082212345676,'Telkomsel','Data 100000',50000,100000,2106);
insert into TopUpandDataPack (no_destinasi,jenis_simcard,paket_data,Nominal_TopUp,harga_paket,id_layanan) values (082212345677,'Indosat','Data 50000',50000,50000,2107);
insert into TopUpandDataPack (no_destinasi,jenis_simcard,paket_data,Nominal_TopUp,harga_paket,id_layanan) values (082212345678,'Tri','Data 20000',10000,20000,2108);
insert into TopUpandDataPack (no_destinasi,jenis_simcard,paket_data,Nominal_TopUp,harga_paket,id_layanan) values (082212345679,'XL','Data 50000',20000,50000,2109);
insert into TopUpandDataPack (no_destinasi,jenis_simcard,paket_data,Nominal_TopUp,harga_paket,id_layanan) values (082212345680,'Axis','Data 100000',20000,100000,2110);
insert into TopUpandDataPack (no_destinasi,jenis_simcard,paket_data,Nominal_TopUp,harga_paket,id_layanan) values (082212345681,'Telkomsel','Data 100000',20000,50000,2111);
insert into TopUpandDataPack (no_destinasi,jenis_simcard,paket_data,Nominal_TopUp,harga_paket,id_layanan) values (082212345682,'XL','Data 50000',60000,40000,2112);
insert into TopUpandDataPack (no_destinasi,jenis_simcard,paket_data,Nominal_TopUp,harga_paket,id_layanan) values (082212345683,'Tri','Data 30000',40000,20000,2113);
insert into TopUpandDataPack (no_destinasi,jenis_simcard,paket_data,Nominal_TopUp,harga_paket,id_layanan) values (082212345684,'XL','Data 40000',50000,20000,2114);
insert into TopUpandDataPack (no_destinasi,jenis_simcard,paket_data,Nominal_TopUp,harga_paket,id_layanan) values (082212345685,'Telkomsel','Data 50000',60000,30000,2115);
insert into TopUpandDataPack (no_destinasi,jenis_simcard,paket_data,Nominal_TopUp,harga_paket,id_layanan) values (082212345686,'XL','Data 40000',50000,50000,2116);
insert into TopUpandDataPack (no_destinasi,jenis_simcard,paket_data,Nominal_TopUp,harga_paket,id_layanan) values (082212345687,'Axis','Data 50000',60000,40000,2117);
insert into TopUpandDataPack (no_destinasi,jenis_simcard,paket_data,Nominal_TopUp,harga_paket,id_layanan) values (082212345688,'Tri','Data 20000',50000,30000,2118);
insert into TopUpandDataPack (no_destinasi,jenis_simcard,paket_data,Nominal_TopUp,harga_paket,id_layanan) values (082212345689,'Indosat','Data 30000',40000,20000,2119);
insert into TopUpandDataPack (no_destinasi,jenis_simcard,paket_data,Nominal_TopUp,harga_paket,id_layanan) values (082212345690,'Axis','Data 40000',50000,30000,2120);
insert into TopUpandDataPack (no_destinasi,jenis_simcard,paket_data,Nominal_TopUp,harga_paket,id_layanan) values (082212345691,'Telkomsel','Data 50000',60000,20000,2121);
insert into TopUpandDataPack (no_destinasi,jenis_simcard,paket_data,Nominal_TopUp,harga_paket,id_layanan) values (082212345692,'XL','Data 60000',70000,50000,2122);
insert into TopUpandDataPack (no_destinasi,jenis_simcard,paket_data,Nominal_TopUp,harga_paket,id_layanan) values (082212345693,'Tri','Data 100000',60000,70000,2123);
insert into TopUpandDataPack (no_destinasi,jenis_simcard,paket_data,Nominal_TopUp,harga_paket,id_layanan) values (082212345694,'XL','Data 40000',50000,70000,2124);
insert into TopUpandDataPack (no_destinasi,jenis_simcard,paket_data,Nominal_TopUp,harga_paket,id_layanan) values (082212345695,'Telkomsel','Data 60000',70000,80000,2125);
insert into TopUpandDataPack (no_destinasi,jenis_simcard,paket_data,Nominal_TopUp,harga_paket,id_layanan) values (082212345696,'XL','Data 60000',70000,80000,2126);
insert into TopUpandDataPack (no_destinasi,jenis_simcard,paket_data,Nominal_TopUp,harga_paket,id_layanan) values (082212345697,'Axis','Data 50000',50000,60000,2127);
insert into TopUpandDataPack (no_destinasi,jenis_simcard,paket_data,Nominal_TopUp,harga_paket,id_layanan) values (082212345698,'Tri','Data 100000',50000,100000,2128);
insert into TopUpandDataPack (no_destinasi,jenis_simcard,paket_data,Nominal_TopUp,harga_paket,id_layanan) values (082212345699,'XL','Data 70000',50000,70000,2129);
insert into TopUpandDataPack (no_destinasi,jenis_simcard,paket_data,Nominal_TopUp,harga_paket,id_layanan) values (082212345700,'Telkomsel','Data 60000',50000,70000,2130);
insert into TopUpandDataPack (no_destinasi,jenis_simcard,paket_data,Nominal_TopUp,harga_paket,id_layanan) values (082212345701,'XL','Data 50000',60000,70000,2131);
insert into TopUpandDataPack (no_destinasi,jenis_simcard,paket_data,Nominal_TopUp,harga_paket,id_layanan) values (082212345702,'Axis','Data 60000',60000,70000,2132);
insert into TopUpandDataPack (no_destinasi,jenis_simcard,paket_data,Nominal_TopUp,harga_paket,id_layanan) values (082212345703,'Tri','Data 70000',50000,70000,2133);
insert into TopUpandDataPack (no_destinasi,jenis_simcard,paket_data,Nominal_TopUp,harga_paket,id_layanan) values (082212345704,'Indosat','Data 80000',60000,90000,2134);
insert into TopUpandDataPack (no_destinasi,jenis_simcard,paket_data,Nominal_TopUp,harga_paket,id_layanan) values (082212345705,'XL','Data 50000',5000,50000,2135);
insert into TopUpandDataPack (no_destinasi,jenis_simcard,paket_data,Nominal_TopUp,harga_paket,id_layanan) values (082212345706,'Tri','Data 60000',20000,70000,2136);
insert into TopUpandDataPack (no_destinasi,jenis_simcard,paket_data,Nominal_TopUp,harga_paket,id_layanan) values (082212345707,'XL','Data 50000',30000,60000,2137);
insert into TopUpandDataPack (no_destinasi,jenis_simcard,paket_data,Nominal_TopUp,harga_paket,id_layanan) values (082212345708,'Indosat','Data 60000',40000,60000,2138);
insert into TopUpandDataPack (no_destinasi,jenis_simcard,paket_data,Nominal_TopUp,harga_paket,id_layanan) values (082212345709,'XL','Data 50000',40000,60000,2139);
insert into TopUpandDataPack (no_destinasi,jenis_simcard,paket_data,Nominal_TopUp,harga_paket,id_layanan) values (082212345710,'Tri','Data 50000',5000,60000,2140);

insert into mobile_postpaid (no_handphone,id_layanan) values (082287654321,2101);
insert into mobile_postpaid (no_handphone,id_layanan) values (082287654322,2102);
insert into mobile_postpaid (no_handphone,id_layanan) values (082287654323,2103);
insert into mobile_postpaid (no_handphone,id_layanan) values (082287654324,2104);
insert into mobile_postpaid (no_handphone,id_layanan) values (082287654325,2105);
insert into mobile_postpaid (no_handphone,id_layanan) values (082287654326,2106);
insert into mobile_postpaid (no_handphone,id_layanan) values (082287654327,2107);
insert into mobile_postpaid (no_handphone,id_layanan) values (082287654328,2108);
insert into mobile_postpaid (no_handphone,id_layanan) values (082287654329,2109);
insert into mobile_postpaid (no_handphone,id_layanan) values (082287654330,2110);
insert into mobile_postpaid (no_handphone,id_layanan) values (082287654331,2111);
insert into mobile_postpaid (no_handphone,id_layanan) values (082287654332,2112);
insert into mobile_postpaid (no_handphone,id_layanan) values (082287654333,2113);
insert into mobile_postpaid (no_handphone,id_layanan) values (082287654334,2114);
insert into mobile_postpaid (no_handphone,id_layanan) values (082287654335,2115);
insert into mobile_postpaid (no_handphone,id_layanan) values (082287654336,2116);
insert into mobile_postpaid (no_handphone,id_layanan) values (082287654337,2117);
insert into mobile_postpaid (no_handphone,id_layanan) values (082287654338,2118);
insert into mobile_postpaid (no_handphone,id_layanan) values (082287654339,2119);
insert into mobile_postpaid (no_handphone,id_layanan) values (082287654340,2120);
insert into mobile_postpaid (no_handphone,id_layanan) values (082287654341,2121);
insert into mobile_postpaid (no_handphone,id_layanan) values (082287654342,2122);
insert into mobile_postpaid (no_handphone,id_layanan) values (082287654343,2123);
insert into mobile_postpaid (no_handphone,id_layanan) values (082287654344,2124);
insert into mobile_postpaid (no_handphone,id_layanan) values (082287654345,2125);
insert into mobile_postpaid (no_handphone,id_layanan) values (082287654346,2126);
insert into mobile_postpaid (no_handphone,id_layanan) values (082287654347,2127);
insert into mobile_postpaid (no_handphone,id_layanan) values (082287654348,2128);
insert into mobile_postpaid (no_handphone,id_layanan) values (082287654349,2129);
insert into mobile_postpaid (no_handphone,id_layanan) values (082287654350,2130);
insert into mobile_postpaid (no_handphone,id_layanan) values (082287654351,2131);
insert into mobile_postpaid (no_handphone,id_layanan) values (082287654352,2132);
insert into mobile_postpaid (no_handphone,id_layanan) values (082287654353,2133);
insert into mobile_postpaid (no_handphone,id_layanan) values (082287654354,2134);
insert into mobile_postpaid (no_handphone,id_layanan) values (082287654355,2135);
insert into mobile_postpaid (no_handphone,id_layanan) values (082287654356,2136);
insert into mobile_postpaid (no_handphone,id_layanan) values (082287654357,2137);
insert into mobile_postpaid (no_handphone,id_layanan) values (082287654358,2138);
insert into mobile_postpaid (no_handphone,id_layanan) values (082287654359,2139);
insert into mobile_postpaid (no_handphone,id_layanan) values (082287654360,2140);

insert into PLN_Electricity (meter_number,tipe_produk,id_layanan) values (987654321,'Electricity Token',2101);
insert into PLN_Electricity (meter_number,tipe_produk,id_layanan) values (987654322,'Electricity Bill',2102);
insert into PLN_Electricity (meter_number,tipe_produk,id_layanan) values (987654323,'Electricity Token',2103);
insert into PLN_Electricity (meter_number,tipe_produk,id_layanan) values (987654324,'Electricity Token',2104);
insert into PLN_Electricity (meter_number,tipe_produk,id_layanan) values (987654325,'Electricity Token',2105);
insert into PLN_Electricity (meter_number,tipe_produk,id_layanan) values (987654326,'Electricity Bill',2106);
insert into PLN_Electricity (meter_number,tipe_produk,id_layanan) values (987654327,'Electricity Bill',2107);
insert into PLN_Electricity (meter_number,tipe_produk,id_layanan) values (987654328,'Electricity Token',2108);
insert into PLN_Electricity (meter_number,tipe_produk,id_layanan) values (987654329,'Electricity Bill',2109);
insert into PLN_Electricity (meter_number,tipe_produk,id_layanan) values (987654330,'Electricity Token',2110);
insert into PLN_Electricity (meter_number,tipe_produk,id_layanan) values (987654331,'Electricity Token',2111);
insert into PLN_Electricity (meter_number,tipe_produk,id_layanan) values (987654332,'Electricity Bill',2112);
insert into PLN_Electricity (meter_number,tipe_produk,id_layanan) values (987654333,'Electricity Token',2113);
insert into PLN_Electricity (meter_number,tipe_produk,id_layanan) values (987654334,'Electricity Token',2114);
insert into PLN_Electricity (meter_number,tipe_produk,id_layanan) values (987654335,'Electricity Token',2115);
insert into PLN_Electricity (meter_number,tipe_produk,id_layanan) values (987654336,'Electricity Bill',2116);
insert into PLN_Electricity (meter_number,tipe_produk,id_layanan) values (987654337,'Electricity Bill',2117);
insert into PLN_Electricity (meter_number,tipe_produk,id_layanan) values (987654338,'Electricity Token',2118);
insert into PLN_Electricity (meter_number,tipe_produk,id_layanan) values (987654339,'Electricity Bill',2119);
insert into PLN_Electricity (meter_number,tipe_produk,id_layanan) values (987654340,'Electricity Token',2120);
insert into PLN_Electricity (meter_number,tipe_produk,id_layanan) values (987654341,'Electricity Token',2121);
insert into PLN_Electricity (meter_number,tipe_produk,id_layanan) values (987654342,'Electricity Bill',2122);
insert into PLN_Electricity (meter_number,tipe_produk,id_layanan) values (987654343,'Electricity Token',2123);
insert into PLN_Electricity (meter_number,tipe_produk,id_layanan) values (987654344,'Electricity Token',2124);
insert into PLN_Electricity (meter_number,tipe_produk,id_layanan) values (987654345,'Electricity Token',2125);
insert into PLN_Electricity (meter_number,tipe_produk,id_layanan) values (987654346,'Electricity Bill',2126);
insert into PLN_Electricity (meter_number,tipe_produk,id_layanan) values (987654347,'Electricity Bill',2127);
insert into PLN_Electricity (meter_number,tipe_produk,id_layanan) values (987654348,'Electricity Token',2128);
insert into PLN_Electricity (meter_number,tipe_produk,id_layanan) values (987654349,'Electricity Bill',2129);
insert into PLN_Electricity (meter_number,tipe_produk,id_layanan) values (987654350,'Electricity Token',2130);
insert into PLN_Electricity (meter_number,tipe_produk,id_layanan) values (987654351,'Electricity Token',2131);
insert into PLN_Electricity (meter_number,tipe_produk,id_layanan) values (987654352,'Electricity Bill',2132);
insert into PLN_Electricity (meter_number,tipe_produk,id_layanan) values (987654353,'Electricity Token',2133);
insert into PLN_Electricity (meter_number,tipe_produk,id_layanan) values (987654354,'Electricity Token',2134);
insert into PLN_Electricity (meter_number,tipe_produk,id_layanan) values (987654355,'Electricity Token',2135);
insert into PLN_Electricity (meter_number,tipe_produk,id_layanan) values (987654356,'Electricity Bill',2136);
insert into PLN_Electricity (meter_number,tipe_produk,id_layanan) values (987654357,'Electricity Bill',2137);
insert into PLN_Electricity (meter_number,tipe_produk,id_layanan) values (987654358,'Electricity Token',2138);
insert into PLN_Electricity (meter_number,tipe_produk,id_layanan) values (987654359,'Electricity Bill',2139);
insert into PLN_Electricity (meter_number,tipe_produk,id_layanan) values (987654360,'Electricity Token',2140);

insert into bpjs_kesehatan (periode_bayar,id_layanan) values ('Oct 2018',2101);
insert into bpjs_kesehatan (periode_bayar,id_layanan) values ('Nov 2018',2102);
insert into bpjs_kesehatan (periode_bayar,id_layanan) values ('Des 2018',2103);
insert into bpjs_kesehatan (periode_bayar,id_layanan) values ('Nov 2018',2104);
insert into bpjs_kesehatan (periode_bayar,id_layanan) values ('Oct 2018',2105);
insert into bpjs_kesehatan (periode_bayar,id_layanan) values ('Des 2018',2106);
insert into bpjs_kesehatan (periode_bayar,id_layanan) values ('Oct 2018',2107);
insert into bpjs_kesehatan (periode_bayar,id_layanan) values ('Nov 2018',2108);
insert into bpjs_kesehatan (periode_bayar,id_layanan) values ('Nov 2018',2109);
insert into bpjs_kesehatan (periode_bayar,id_layanan) values ('Des 2018',2110);
insert into bpjs_kesehatan (periode_bayar,id_layanan) values ('Oct 2018',2111);
insert into bpjs_kesehatan (periode_bayar,id_layanan) values ('Nov 2018',2112);
insert into bpjs_kesehatan (periode_bayar,id_layanan) values ('Des 2018',2113);
insert into bpjs_kesehatan (periode_bayar,id_layanan) values ('Nov 2018',2114);
insert into bpjs_kesehatan (periode_bayar,id_layanan) values ('Oct 2018',2115);
insert into bpjs_kesehatan (periode_bayar,id_layanan) values ('Des 2018',2116);
insert into bpjs_kesehatan (periode_bayar,id_layanan) values ('Oct 2018',2117);
insert into bpjs_kesehatan (periode_bayar,id_layanan) values ('Nov 2018',2118);
insert into bpjs_kesehatan (periode_bayar,id_layanan) values ('Nov 2018',2119);
insert into bpjs_kesehatan (periode_bayar,id_layanan) values ('Des 2018',2120);
insert into bpjs_kesehatan (periode_bayar,id_layanan) values ('Oct 2018',2121);
insert into bpjs_kesehatan (periode_bayar,id_layanan) values ('Nov 2018',2122);
insert into bpjs_kesehatan (periode_bayar,id_layanan) values ('Des 2018',2123);
insert into bpjs_kesehatan (periode_bayar,id_layanan) values ('Nov 2018',2124);
insert into bpjs_kesehatan (periode_bayar,id_layanan) values ('Oct 2018',2125);
insert into bpjs_kesehatan (periode_bayar,id_layanan) values ('Des 2018',2126);
insert into bpjs_kesehatan (periode_bayar,id_layanan) values ('Oct 2018',2127);
insert into bpjs_kesehatan (periode_bayar,id_layanan) values ('Nov 2018',2128);
insert into bpjs_kesehatan (periode_bayar,id_layanan) values ('Nov 2018',2129);
insert into bpjs_kesehatan (periode_bayar,id_layanan) values ('Des 2018',2130);
insert into bpjs_kesehatan (periode_bayar,id_layanan) values ('Oct 2018',2131);
insert into bpjs_kesehatan (periode_bayar,id_layanan) values ('Nov 2018',2132);
insert into bpjs_kesehatan (periode_bayar,id_layanan) values ('Des 2018',2133);
insert into bpjs_kesehatan (periode_bayar,id_layanan) values ('Nov 2018',2134);
insert into bpjs_kesehatan (periode_bayar,id_layanan) values ('Oct 2018',2135);
insert into bpjs_kesehatan (periode_bayar,id_layanan) values ('Des 2018',2136);
insert into bpjs_kesehatan (periode_bayar,id_layanan) values ('Oct 2018',2137);
insert into bpjs_kesehatan (periode_bayar,id_layanan) values ('Nov 2018',2138);
insert into bpjs_kesehatan (periode_bayar,id_layanan) values ('Nov 2018',2139);
insert into bpjs_kesehatan (periode_bayar,id_layanan) values ('Des 2018',2140);

insert into telkom ("No_Telepon Rumah",id_layanan) values (02298765431,2101);
insert into telkom ("No_Telepon Rumah",id_layanan) values (02298765432,2102);
insert into telkom ("No_Telepon Rumah",id_layanan) values (02298765433,2103);
insert into telkom ("No_Telepon Rumah",id_layanan) values (02298765434,2104);
insert into telkom ("No_Telepon Rumah",id_layanan) values (02298765435,2105);
insert into telkom ("No_Telepon Rumah",id_layanan) values (02298765436,2106);
insert into telkom ("No_Telepon Rumah",id_layanan) values (02298765437,2107);
insert into telkom ("No_Telepon Rumah",id_layanan) values (02298765438,2108);
insert into telkom ("No_Telepon Rumah",id_layanan) values (02298765439,2109);
insert into telkom ("No_Telepon Rumah",id_layanan) values (02298765440,2110);
insert into telkom ("No_Telepon Rumah",id_layanan) values (02298765441,2111);
insert into telkom ("No_Telepon Rumah",id_layanan) values (02298765442,2112);
insert into telkom ("No_Telepon Rumah",id_layanan) values (02298765443,2113);
insert into telkom ("No_Telepon Rumah",id_layanan) values (02298765444,2114);
insert into telkom ("No_Telepon Rumah",id_layanan) values (02298765445,2115);
insert into telkom ("No_Telepon Rumah",id_layanan) values (02298765446,2116);
insert into telkom ("No_Telepon Rumah",id_layanan) values (02298765447,2117);
insert into telkom ("No_Telepon Rumah",id_layanan) values (02298765448,2118);
insert into telkom ("No_Telepon Rumah",id_layanan) values (02298765449,2119);
insert into telkom ("No_Telepon Rumah",id_layanan) values (02298765450,2120);
insert into telkom ("No_Telepon Rumah",id_layanan) values (02298765451,2121);
insert into telkom ("No_Telepon Rumah",id_layanan) values (02298765452,2122);
insert into telkom ("No_Telepon Rumah",id_layanan) values (02298765453,2123);
insert into telkom ("No_Telepon Rumah",id_layanan) values (02298765454,2124);
insert into telkom ("No_Telepon Rumah",id_layanan) values (02298765455,2125);
insert into telkom ("No_Telepon Rumah",id_layanan) values (02298765456,2126);
insert into telkom ("No_Telepon Rumah",id_layanan) values (02298765457,2127);
insert into telkom ("No_Telepon Rumah",id_layanan) values (02298765458,2128);
insert into telkom ("No_Telepon Rumah",id_layanan) values (02298765459,2129);
insert into telkom ("No_Telepon Rumah",id_layanan) values (02298765460,2130);
insert into telkom ("No_Telepon Rumah",id_layanan) values (02298765461,2131);
insert into telkom ("No_Telepon Rumah",id_layanan) values (02298765462,2132);
insert into telkom ("No_Telepon Rumah",id_layanan) values (02298765463,2133);
insert into telkom ("No_Telepon Rumah",id_layanan) values (02298765464,2134);
insert into telkom ("No_Telepon Rumah",id_layanan) values (02298765465,2135);
insert into telkom ("No_Telepon Rumah",id_layanan) values (02298765466,2136);
insert into telkom ("No_Telepon Rumah",id_layanan) values (02298765467,2137);
insert into telkom ("No_Telepon Rumah",id_layanan) values (02298765468,2138);
insert into telkom ("No_Telepon Rumah",id_layanan) values (02298765469,2139);
insert into telkom ("No_Telepon Rumah",id_layanan) values (02298765470,2140);

insert into PDAM (nama_perusahaan,id_layanan) values ('Aetra Jakarta',2101);
insert into PDAM (nama_perusahaan,id_layanan) values ('Palyja Jakarta',2102);
insert into PDAM (nama_perusahaan,id_layanan) values ('PDAM Kota Bandung',2103);
insert into PDAM (nama_perusahaan,id_layanan) values ('PDAM Kota Makassar',2104);
insert into PDAM (nama_perusahaan,id_layanan) values ('PDAM Kota Depok',2105);
insert into PDAM (nama_perusahaan,id_layanan) values ('PDAM Kota Semarang',2106);
insert into PDAM (nama_perusahaan,id_layanan) values ('PDAM Kota Tegal',2107);
insert into PDAM (nama_perusahaan,id_layanan) values ('PDAM Kab Bandung',2108);
insert into PDAM (nama_perusahaan,id_layanan) values ('PDAM Kab Garut',2109);
insert into PDAM (nama_perusahaan,id_layanan) values ('PDAM Kab Malang',2110);
insert into PDAM (nama_perusahaan,id_layanan) values ('PDAM Kota Jakarta',2111);
insert into PDAM (nama_perusahaan,id_layanan) values ('PDAM Kab Bandung',2112);
insert into PDAM (nama_perusahaan,id_layanan) values ('PDAM Kota Madiun',2113);
insert into PDAM (nama_perusahaan,id_layanan) values ('PDAM Kota Yogyakarta',2114);
insert into PDAM (nama_perusahaan,id_layanan) values ('PDAM Kota Brebes',2115);
insert into PDAM (nama_perusahaan,id_layanan) values ('PDAM Kab Yogyakarta',2116);
insert into PDAM (nama_perusahaan,id_layanan) values ('PDAM Kab Madiun',2117);
Insert into PDAM (nama_perusahaan,id_layanan) values ('PDAM Kab Makassar',2118);
insert into PDAM (nama_perusahaan,id_layanan) values ('PDAM Kota Tasikmalaya',2119);
insert into PDAM (nama_perusahaan,id_layanan) values ('PDAM Kota Sragen',2120);
insert into PDAM (nama_perusahaan,id_layanan) values ('PDAM Kota Tangerang',2121);
insert into PDAM (nama_perusahaan,id_layanan) values ('PDAM Kota Palembang',2122);
insert into PDAM (nama_perusahaan,id_layanan) values ('PDAM Kab Banten',2123);
insert into PDAM (nama_perusahaan,id_layanan) values ('PDAM Kota Sidoardjo',2124);
insert into PDAM (nama_perusahaan,id_layanan) values ('PDAM Kota Karawang',2125);
insert into PDAM (nama_perusahaan,id_layanan) values ('PDAM Kota Bekasi',2126);
insert into PDAM (nama_perusahaan,id_layanan) values ('PDAM Kota Sukabumi',2127);
insert into PDAM (nama_perusahaan,id_layanan) values ('PDAM Kota Bogor',2128);
insert into PDAM (nama_perusahaan,id_layanan) values ('PDAM Kota Banjar',2129);
insert into PDAM (nama_perusahaan,id_layanan) values ('PDAM Kota Pekalongan',2130);
insert into PDAM (nama_perusahaan,id_layanan) values ('PDAM Kota Purwokerto',2131);
insert into PDAM (nama_perusahaan,id_layanan) values ('PDAM Kota Salatiga',2132);
insert into PDAM (nama_perusahaan,id_layanan) values ('PDAM Kota Mojokerto',2133);
insert into PDAM (nama_perusahaan,id_layanan) values ('PDAM Kota Pontianak',2134);
insert into PDAM (nama_perusahaan,id_layanan) values ('PDAM Kota Balikpapan',2135);
insert into PDAM (nama_perusahaan,id_layanan) values ('PDAM Kota Banjarmasin',2136);
insert into PDAM (nama_perusahaan,id_layanan) values ('PDAM Kota Cirebon',2137);
insert into PDAM (nama_perusahaan,id_layanan) values ('PDAM Kota Jambi',2138);
insert into PDAM (nama_perusahaan,id_layanan) values ('PDAM Kota Serang',2139);
insert into PDAM (nama_perusahaan,id_layanan) values ('PDAM Kota Samarinda',2140);

insert into voucher_game (platform_game,nominal_voucher,id_layanan) values ('Garena Shell/Cash',100000,2101);
insert into voucher_game (platform_game,nominal_voucher,id_layanan) values ('Steam Wallet IDR',600000,2102);
insert into voucher_game (platform_game,nominal_voucher,id_layanan) values ('Lyto Credits',35000,2103);
insert into voucher_game (platform_game,nominal_voucher,id_layanan) values ('MOL Point',50000,2104);
insert into voucher_game (platform_game,nominal_voucher,id_layanan) values ('WaveGame Coin',40000,2105);
insert into voucher_game (platform_game,nominal_voucher,id_layanan) values ('PlayStation Network(ID)',100000,2106);
insert into voucher_game (platform_game,nominal_voucher,id_layanan) values ('Megaxus MI Cash',10000,2107);
insert into voucher_game (platform_game,nominal_voucher,id_layanan) values ('MOGPlay',50000,2108);
insert into voucher_game (platform_game,nominal_voucher,id_layanan) values ('Facebook Game Card',80000,2109);
insert into voucher_game (platform_game,nominal_voucher,id_layanan) values ('Travian',90000,2110);
insert into voucher_game (platform_game,nominal_voucher,id_layanan) values ('PlayStation Network(ID)',100000,2111);
insert into voucher_game (platform_game,nominal_voucher,id_layanan) values ('MOGPlay',100000,2112);
insert into voucher_game (platform_game,nominal_voucher,id_layanan) values ('MOL Point',90000,2113);
insert into voucher_game (platform_game,nominal_voucher,id_layanan) values ('Garena Shell/Cash',300000,2114);
insert into voucher_game (platform_game,nominal_voucher,id_layanan) values ('Garena Shell/Cash',200000,2115);
insert into voucher_game (platform_game,nominal_voucher,id_layanan) values ('Lyto Credits',100000,2116);
insert into voucher_game (platform_game,nominal_voucher,id_layanan) values ('Playstation Network(ID)',80000,2117);
insert into voucher_game (platform_game,nominal_voucher,id_layanan) values ('Playstation Network(ID)',90000,2118);
insert into voucher_game (platform_game,nominal_voucher,id_layanan) values ('Facebook Game Card',80000,2119);
insert into voucher_game (platform_game,nominal_voucher,id_layanan) values ('Steam Wallet IDR',200000,2120);
insert into voucher_game (platform_game,nominal_voucher,id_layanan) values ('Steam Wallet IDR',90000,2121);
insert into voucher_game (platform_game,nominal_voucher,id_layanan) values ('Travian',50000,2122);
insert into voucher_game (platform_game,nominal_voucher,id_layanan) values ('MOGPlay',60000,2123);
insert into voucher_game (platform_game,nominal_voucher,id_layanan) values ('Garena Shell/Cash',70000,2124);
insert into voucher_game (platform_game,nominal_voucher,id_layanan) values ('WaveGame Coin',100000,2125);
insert into voucher_game (platform_game,nominal_voucher,id_layanan) values ('Steam Wallet IDR',90000,2126);
insert into voucher_game (platform_game,nominal_voucher,id_layanan) values ('Facebook Game Card',100000,2127);
insert into voucher_game (platform_game,nominal_voucher,id_layanan) values ('Facebook Game Card',80000,2128);
insert into voucher_game (platform_game,nominal_voucher,id_layanan) values ('Steam Wallet IDR',100000,2129);
insert into voucher_game (platform_game,nominal_voucher,id_layanan) values ('Steam Wallet IDR',30000,2130);
insert into voucher_game (platform_game,nominal_voucher,id_layanan) values ('Steam Wallet IDR',200000,2131);
insert into voucher_game (platform_game,nominal_voucher,id_layanan) values ('Steam Wallet IDR',40000,2132);
insert into voucher_game (platform_game,nominal_voucher,id_layanan) values ('Lyto Credits',30000,2133);
insert into voucher_game (platform_game,nominal_voucher,id_layanan) values ('Lyto Credits',50000,2134);
insert into voucher_game (platform_game,nominal_voucher,id_layanan) values ('Playstation Network(ID)',70000,2135);
insert into voucher_game (platform_game,nominal_voucher,id_layanan) values ('Playstation Network(ID)',100000,2136);
insert into voucher_game (platform_game,nominal_voucher,id_layanan) values ('Playstation Network(ID)',200000,2137);
insert into voucher_game (platform_game,nominal_voucher,id_layanan) values ('MOL Point',100000,2138);
insert into voucher_game (platform_game,nominal_voucher,id_layanan) values ('MOL Point',70000,2139);
insert into voucher_game (platform_game,nominal_voucher,id_layanan) values ('MOL Point',80000,2140);

insert into kartu_kredit (No_Kartu_Kredit,form_pembayaran,no_pesanan) values (78123641,'Lock Pay',801);
insert into kartu_kredit (No_Kartu_Kredit,form_pembayaran,no_pesanan) values (78123642,'Lock Pay',802);
insert into kartu_kredit (No_Kartu_Kredit,form_pembayaran,no_pesanan) values (78123643,'Unlock Pay',803);
insert into kartu_kredit (No_Kartu_Kredit,form_pembayaran,no_pesanan) values (78123644,'Unlock Pay',804);
insert into kartu_kredit (No_Kartu_Kredit,form_pembayaran,no_pesanan) values (78123645,'Lock Pay',805);
insert into kartu_kredit (No_Kartu_Kredit,form_pembayaran,no_pesanan) values (78123646,'Unlock Pay',806);
insert into kartu_kredit (No_Kartu_Kredit,form_pembayaran,no_pesanan) values (78123647,'Lock Pay',807);
insert into kartu_kredit (No_Kartu_Kredit,form_pembayaran,no_pesanan) values (78123648,'Unlock Pay',808);
insert into kartu_kredit (No_Kartu_Kredit,form_pembayaran,no_pesanan) values (78123649,'Lock Pay',809);
insert into kartu_kredit (No_Kartu_Kredit,form_pembayaran,no_pesanan) values (78123650,'Unlock Pay',810);
insert into kartu_kredit (No_Kartu_Kredit,form_pembayaran,no_pesanan) values (78123651,'Unlock Pay',811);
insert into kartu_kredit (No_Kartu_Kredit,form_pembayaran,no_pesanan) values (78123652,'Lock Pay',812);
insert into kartu_kredit (No_Kartu_Kredit,form_pembayaran,no_pesanan) values (78123653,'Unlock Pay',813);
insert into kartu_kredit (No_Kartu_Kredit,form_pembayaran,no_pesanan) values (78123654,'Lock Pay',814);
insert into kartu_kredit (No_Kartu_Kredit,form_pembayaran,no_pesanan) values (78123655,'Lock Pay',815);
insert into kartu_kredit (No_Kartu_Kredit,form_pembayaran,no_pesanan) values (78123656,'Unlock Pay',816);
insert into kartu_kredit (No_Kartu_Kredit,form_pembayaran,no_pesanan) values (78123657,'Lock Pay',817);
insert into kartu_kredit (No_Kartu_Kredit,form_pembayaran,no_pesanan) values (78123658,'Unlock Pay',818);
insert into kartu_kredit (No_Kartu_Kredit,form_pembayaran,no_pesanan) values (78123659,'Unlock Pay',819);
insert into kartu_kredit (No_Kartu_Kredit,form_pembayaran,no_pesanan) values (78123660,'Lock Pay',820);
insert into kartu_kredit (No_Kartu_Kredit,form_pembayaran,no_pesanan) values (78123661,'Lock Pay',821);
insert into kartu_kredit (No_Kartu_Kredit,form_pembayaran,no_pesanan) values (78123662,'Unlock Pay',822);
insert into kartu_kredit (No_Kartu_Kredit,form_pembayaran,no_pesanan) values (78123663,'Lock Pay',823);
insert into kartu_kredit (No_Kartu_Kredit,form_pembayaran,no_pesanan) values (78123664,'Lock Pay',824);
insert into kartu_kredit (No_Kartu_Kredit,form_pembayaran,no_pesanan) values (78123665,'Unlock Pay',825);
insert into kartu_kredit (No_Kartu_Kredit,form_pembayaran,no_pesanan) values (78123666,'Unlock Pay',826);
insert into kartu_kredit (No_Kartu_Kredit,form_pembayaran,no_pesanan) values (78123667,'Lock Pay',827);
insert into kartu_kredit (No_Kartu_Kredit,form_pembayaran,no_pesanan) values (78123668,'Lock Pay',828);
insert into kartu_kredit (No_Kartu_Kredit,form_pembayaran,no_pesanan) values (78123669,'Unlock Pay',829);
insert into kartu_kredit (No_Kartu_Kredit,form_pembayaran,no_pesanan) values (78123670,'Lock Pay',830);
insert into kartu_kredit (No_Kartu_Kredit,form_pembayaran,no_pesanan) values (78123671,'Unlock Pay',831);
insert into kartu_kredit (No_Kartu_Kredit,form_pembayaran,no_pesanan) values (78123672,'Lock Pay',832);
insert into kartu_kredit (No_Kartu_Kredit,form_pembayaran,no_pesanan) values (78123673,'Lock Pay',833);
insert into kartu_kredit (No_Kartu_Kredit,form_pembayaran,no_pesanan) values (78123674,'Lock Pay',834);
insert into kartu_kredit (No_Kartu_Kredit,form_pembayaran,no_pesanan) values (78123675,'Unlock Pay',835);
insert into kartu_kredit (No_Kartu_Kredit,form_pembayaran,no_pesanan) values (78123676,'Lock Pay',836);
insert into kartu_kredit (No_Kartu_Kredit,form_pembayaran,no_pesanan) values (78123677,'Unlock Pay',837);
insert into kartu_kredit (No_Kartu_Kredit,form_pembayaran,no_pesanan) values (78123678,'Lock Pay',838);
insert into kartu_kredit (No_Kartu_Kredit,form_pembayaran,no_pesanan) values (78123679,'Lock Pay',839);
insert into kartu_kredit (No_Kartu_Kredit,form_pembayaran,no_pesanan) values (78123680,'Unlock Pay',840);

insert into TransferandATM (no_rekening,jenis_rekening,no_pesanan) values (6475821,'BNI',801);
insert into TransferandATM (no_rekening,jenis_rekening,no_pesanan) values (6475822,'BNI',802);
insert into TransferandATM (no_rekening,jenis_rekening,no_pesanan) values (6475823,'BCA',803);
insert into TransferandATM (no_rekening,jenis_rekening,no_pesanan) values (6475824,'MANDIRI',804);
insert into TransferandATM (no_rekening,jenis_rekening,no_pesanan) values (6475825,'BRI',805);
insert into TransferandATM (no_rekening,jenis_rekening,no_pesanan) values (6475826,'ATM Bersama',806);
insert into TransferandATM (no_rekening,jenis_rekening,no_pesanan) values (6475827,'Prima',807);
insert into TransferandATM (no_rekening,jenis_rekening,no_pesanan) values (6475828,'Alto',808);
insert into TransferandATM (no_rekening,jenis_rekening,no_pesanan) values (6475829,'MANDIRI',809);
insert into TransferandATM (no_rekening,jenis_rekening,no_pesanan) values (6475830,'BCA',810);
insert into TransferandATM (no_rekening,jenis_rekening,no_pesanan) values (6475831,'MANDIRI',811);
insert into TransferandATM (no_rekening,jenis_rekening,no_pesanan) values (6475832,'BCA',812);
insert into TransferandATM (no_rekening,jenis_rekening,no_pesanan) values (6475833,'BNI',813);
insert into TransferandATM (no_rekening,jenis_rekening,no_pesanan) values (6475834,'Prima',814);
insert into TransferandATM (no_rekening,jenis_rekening,no_pesanan) values (6475835,'BRI',815);
insert into TransferandATM (no_rekening,jenis_rekening,no_pesanan) values (6475836,'BCA',816);
insert into TransferandATM (no_rekening,jenis_rekening,no_pesanan) values (6475837,'BNI',817);
insert into TransferandATM (no_rekening,jenis_rekening,no_pesanan) values (6475838,'Alto',818);
insert into TransferandATM (no_rekening,jenis_rekening,no_pesanan) values (6475839,'ATM Bersama',819);
insert into TransferandATM (no_rekening,jenis_rekening,no_pesanan) values (6475840,'BRI',820);
insert into TransferandATM (no_rekening,jenis_rekening,no_pesanan) values (6475841,'BCA',821);
insert into TransferandATM (no_rekening,jenis_rekening,no_pesanan) values (6475842,'BNI',822);
insert into TransferandATM (no_rekening,jenis_rekening,no_pesanan) values (6475843,'BRI',823);
insert into TransferandATM (no_rekening,jenis_rekening,no_pesanan) values (6475844,'Prima',824);
insert into TransferandATM (no_rekening,jenis_rekening,no_pesanan) values (6475845,'ATM Bersama',825);
insert into TransferandATM (no_rekening,jenis_rekening,no_pesanan) values (6475846,'BRI',826);
insert into TransferandATM (no_rekening,jenis_rekening,no_pesanan) values (6475847,'BRI',827);
insert into TransferandATM (no_rekening,jenis_rekening,no_pesanan) values (6475848,'BNI',828);
insert into TransferandATM (no_rekening,jenis_rekening,no_pesanan) values (6475849,'BCA',829);
insert into TransferandATM (no_rekening,jenis_rekening,no_pesanan) values (6475850,'MANDIRI',830);
insert into TransferandATM (no_rekening,jenis_rekening,no_pesanan) values (6475851,'MANDIRI',831);
insert into TransferandATM (no_rekening,jenis_rekening,no_pesanan) values (6475852,'BNI',832);
insert into TransferandATM (no_rekening,jenis_rekening,no_pesanan) values (6475853,'BRI',833);
insert into TransferandATM (no_rekening,jenis_rekening,no_pesanan) values (6475854,'BRI',834);
insert into TransferandATM (no_rekening,jenis_rekening,no_pesanan) values (6475855,'BCA',835);
insert into TransferandATM (no_rekening,jenis_rekening,no_pesanan) values (6475856,'BNI',836);
insert into TransferandATM (no_rekening,jenis_rekening,no_pesanan) values (6475857,'MANDIRI',837);
insert into TransferandATM (no_rekening,jenis_rekening,no_pesanan) values (6475858,'BCA',838);
insert into TransferandATM (no_rekening,jenis_rekening,no_pesanan) values (6475859,'BCA',839);
insert into TransferandATM (no_rekening,jenis_rekening,no_pesanan) values (6475860,'ATM Bersama',840);

insert into Direct_Debits (Jenis_Direct_Debits,no_pesanan) values ('Mandiri Debit',801);
insert into Direct_Debits (Jenis_Direct_Debits,no_pesanan) values ('Mandiri Debit',802);
insert into Direct_Debits (Jenis_Direct_Debits,no_pesanan) values ('Mandiri Debit',803);
insert into Direct_Debits (Jenis_Direct_Debits,no_pesanan) values ('Mandiri Debit',804);
insert into Direct_Debits (Jenis_Direct_Debits,no_pesanan) values ('Mandiri Debit',805);
insert into Direct_Debits (Jenis_Direct_Debits,no_pesanan) values ('Mandiri Debit',806);
insert into Direct_Debits (Jenis_Direct_Debits,no_pesanan) values ('Mandiri Debit',807);
insert into Direct_Debits (Jenis_Direct_Debits,no_pesanan) values ('Mandiri Debit',808);
insert into Direct_Debits (Jenis_Direct_Debits,no_pesanan) values ('Mandiri Debit',809);
insert into Direct_Debits (Jenis_Direct_Debits,no_pesanan) values ('Mandiri Debit',810);
insert into Direct_Debits (Jenis_Direct_Debits,no_pesanan) values ('Mandiri Debit',811);
insert into Direct_Debits (Jenis_Direct_Debits,no_pesanan) values ('Mandiri Debit',812);
insert into Direct_Debits (Jenis_Direct_Debits,no_pesanan) values ('Mandiri Debit',813);
insert into Direct_Debits (Jenis_Direct_Debits,no_pesanan) values ('Mandiri Debit',814);
insert into Direct_Debits (Jenis_Direct_Debits,no_pesanan) values ('Mandiri Debit',815);
insert into Direct_Debits (Jenis_Direct_Debits,no_pesanan) values ('Mandiri Debit',816);
insert into Direct_Debits (Jenis_Direct_Debits,no_pesanan) values ('Mandiri Debit',817);
insert into Direct_Debits (Jenis_Direct_Debits,no_pesanan) values ('Mandiri Debit',818);
insert into Direct_Debits (Jenis_Direct_Debits,no_pesanan) values ('Mandiri Debit',819);
insert into Direct_Debits (Jenis_Direct_Debits,no_pesanan) values ('Mandiri Debit',820);
insert into Direct_Debits (Jenis_Direct_Debits,no_pesanan) values ('Mandiri Debit',821);
insert into Direct_Debits (Jenis_Direct_Debits,no_pesanan) values ('Mandiri Debit',822);
insert into Direct_Debits (Jenis_Direct_Debits,no_pesanan) values ('Mandiri Debit',823);
insert into Direct_Debits (Jenis_Direct_Debits,no_pesanan) values ('Mandiri Debit',824);
insert into Direct_Debits (Jenis_Direct_Debits,no_pesanan) values ('Mandiri Debit',825);
insert into Direct_Debits (Jenis_Direct_Debits,no_pesanan) values ('Mandiri Debit',826);
insert into Direct_Debits (Jenis_Direct_Debits,no_pesanan) values ('Mandiri Debit',827);
insert into Direct_Debits (Jenis_Direct_Debits,no_pesanan) values ('Mandiri Debit',828);
insert into Direct_Debits (Jenis_Direct_Debits,no_pesanan) values ('Mandiri Debit',829);
insert into Direct_Debits (Jenis_Direct_Debits,no_pesanan) values ('Mandiri Debit',830);
insert into Direct_Debits (Jenis_Direct_Debits,no_pesanan) values ('Mandiri Debit',831);
insert into Direct_Debits (Jenis_Direct_Debits,no_pesanan) values ('Mandiri Debit',832);
insert into Direct_Debits (Jenis_Direct_Debits,no_pesanan) values ('Mandiri Debit',833);
insert into Direct_Debits (Jenis_Direct_Debits,no_pesanan) values ('Mandiri Debit',834);
insert into Direct_Debits (Jenis_Direct_Debits,no_pesanan) values ('Mandiri Debit',835);
insert into Direct_Debits (Jenis_Direct_Debits,no_pesanan) values ('Mandiri Debit',836);
insert into Direct_Debits (Jenis_Direct_Debits,no_pesanan) values ('Mandiri Debit',837);
insert into Direct_Debits (Jenis_Direct_Debits,no_pesanan) values ('Mandiri Debit',838);
insert into Direct_Debits (Jenis_Direct_Debits,no_pesanan) values ('Mandiri Debit',839);
insert into Direct_Debits (Jenis_Direct_Debits,no_pesanan) values ('Mandiri Debit',840);

insert into Alfmart_Indomrt (jenis_minimarket,no_pesanan) values ('Indomaret',801);
insert into Alfmart_Indomrt (jenis_minimarket,no_pesanan) values ('Alfamaret',802);
insert into Alfmart_Indomrt (jenis_minimarket,no_pesanan) values ('Alfamidi',803);
insert into Alfmart_Indomrt (jenis_minimarket,no_pesanan) values ('Alfamaret',804);
insert into Alfmart_Indomrt (jenis_minimarket,no_pesanan) values ('Indomaret',805);
insert into Alfmart_Indomrt (jenis_minimarket,no_pesanan) values ('Alfamidi',806);
insert into Alfmart_Indomrt (jenis_minimarket,no_pesanan) values ('Alfamaret',807);
insert into Alfmart_Indomrt (jenis_minimarket,no_pesanan) values ('Indomaret',808);
insert into Alfmart_Indomrt (jenis_minimarket,no_pesanan) values ('Alfamidi',809);
insert into Alfmart_Indomrt (jenis_minimarket,no_pesanan) values ('Alfamaret',810);
insert into Alfmart_Indomrt (jenis_minimarket,no_pesanan) values ('Indomaret',811);
insert into Alfmart_Indomrt (jenis_minimarket,no_pesanan) values ('Alfamaret',812);
insert into Alfmart_Indomrt (jenis_minimarket,no_pesanan) values ('Alfamidi',813);
insert into Alfmart_Indomrt (jenis_minimarket,no_pesanan) values ('Alfamaret',814);
insert into Alfmart_Indomrt (jenis_minimarket,no_pesanan) values ('Indomaret',815);
insert into Alfmart_Indomrt (jenis_minimarket,no_pesanan) values ('Alfamidi',816);
insert into Alfmart_Indomrt (jenis_minimarket,no_pesanan) values ('Alfamaret',817);
insert into Alfmart_Indomrt (jenis_minimarket,no_pesanan) values ('Indomaret',818);
insert into Alfmart_Indomrt (jenis_minimarket,no_pesanan) values ('Alfamidi',819);
insert into Alfmart_Indomrt (jenis_minimarket,no_pesanan) values ('Alfamaret',820);
insert into Alfmart_Indomrt (jenis_minimarket,no_pesanan) values ('Indomaret',821);
insert into Alfmart_Indomrt (jenis_minimarket,no_pesanan) values ('Alfamaret',822);
insert into Alfmart_Indomrt (jenis_minimarket,no_pesanan) values ('Alfamidi',823);
insert into Alfmart_Indomrt (jenis_minimarket,no_pesanan) values ('Alfamaret',824);
insert into Alfmart_Indomrt (jenis_minimarket,no_pesanan) values ('Indomaret',825);
insert into Alfmart_Indomrt (jenis_minimarket,no_pesanan) values ('Alfamidi',826);
insert into Alfmart_Indomrt (jenis_minimarket,no_pesanan) values ('Alfamaret',827);
insert into Alfmart_Indomrt (jenis_minimarket,no_pesanan) values ('Indomaret',828);
insert into Alfmart_Indomrt (jenis_minimarket,no_pesanan) values ('Alfamidi',829);
insert into Alfmart_Indomrt (jenis_minimarket,no_pesanan) values ('Alfamaret',830);
insert into Alfmart_Indomrt (jenis_minimarket,no_pesanan) values ('Indomaret',831);
insert into Alfmart_Indomrt (jenis_minimarket,no_pesanan) values ('Alfamaret',832);
insert into Alfmart_Indomrt (jenis_minimarket,no_pesanan) values ('Alfamidi',833);
insert into Alfmart_Indomrt (jenis_minimarket,no_pesanan) values ('Alfamaret',834);
insert into Alfmart_Indomrt (jenis_minimarket,no_pesanan) values ('Indomaret',835);
insert into Alfmart_Indomrt (jenis_minimarket,no_pesanan) values ('Alfamidi',836);
insert into Alfmart_Indomrt (jenis_minimarket,no_pesanan) values ('Alfamaret',837);
insert into Alfmart_Indomrt (jenis_minimarket,no_pesanan) values ('Indomaret',838);
insert into Alfmart_Indomrt (jenis_minimarket,no_pesanan) values ('Alfamidi',839);
insert into Alfmart_Indomrt (jenis_minimarket,no_pesanan) values ('Alfamaret',840);

insert into Uangku_Balance (saldo_uangku,no_pesanan) values (1000000,801);
insert into Uangku_Balance (saldo_uangku,no_pesanan) values (2000000,802);
insert into Uangku_Balance (saldo_uangku,no_pesanan) values (3000000,803);
insert into Uangku_Balance (saldo_uangku,no_pesanan) values (4000000,804);
insert into Uangku_Balance (saldo_uangku,no_pesanan) values (5000000,805);
insert into Uangku_Balance (saldo_uangku,no_pesanan) values (6000000,806);
insert into Uangku_Balance (saldo_uangku,no_pesanan) values (7000000,807);
insert into Uangku_Balance (saldo_uangku,no_pesanan) values (8000000,808);
insert into Uangku_Balance (saldo_uangku,no_pesanan) values (9000000,809);
insert into Uangku_Balance (saldo_uangku,no_pesanan) values (9500000,810);
insert into Uangku_Balance (saldo_uangku,no_pesanan) values (1000000,811);
insert into Uangku_Balance (saldo_uangku,no_pesanan) values (2000000,812);
insert into Uangku_Balance (saldo_uangku,no_pesanan) values (3000000,813);
insert into Uangku_Balance (saldo_uangku,no_pesanan) values (4000000,814);
insert into Uangku_Balance (saldo_uangku,no_pesanan) values (5000000,815);
insert into Uangku_Balance (saldo_uangku,no_pesanan) values (6000000,816);
insert into Uangku_Balance (saldo_uangku,no_pesanan) values (7000000,817);
insert into Uangku_Balance (saldo_uangku,no_pesanan) values (8000000,818);
insert into Uangku_Balance (saldo_uangku,no_pesanan) values (9000000,819);
insert into Uangku_Balance (saldo_uangku,no_pesanan) values (9500000,820);
insert into Uangku_Balance (saldo_uangku,no_pesanan) values (1000000,821);
insert into Uangku_Balance (saldo_uangku,no_pesanan) values (2000000,822);
insert into Uangku_Balance (saldo_uangku,no_pesanan) values (3000000,823);
insert into Uangku_Balance (saldo_uangku,no_pesanan) values (4000000,824);
insert into Uangku_Balance (saldo_uangku,no_pesanan) values (5000000,825);
insert into Uangku_Balance (saldo_uangku,no_pesanan) values (6000000,826);
insert into Uangku_Balance (saldo_uangku,no_pesanan) values (7000000,827);
insert into Uangku_Balance (saldo_uangku,no_pesanan) values (8000000,828);
insert into Uangku_Balance (saldo_uangku,no_pesanan) values (9000000,829);
insert into Uangku_Balance (saldo_uangku,no_pesanan) values (9500000,830);
insert into Uangku_Balance (saldo_uangku,no_pesanan) values (1000000,831);
insert into Uangku_Balance (saldo_uangku,no_pesanan) values (2000000,832);
insert into Uangku_Balance (saldo_uangku,no_pesanan) values (3000000,833);
insert into Uangku_Balance (saldo_uangku,no_pesanan) values (4000000,834);
insert into Uangku_Balance (saldo_uangku,no_pesanan) values (5000000,835);
insert into Uangku_Balance (saldo_uangku,no_pesanan) values (6000000,836);
insert into Uangku_Balance (saldo_uangku,no_pesanan) values (7000000,837);
insert into Uangku_Balance (saldo_uangku,no_pesanan) values (8000000,838);
insert into Uangku_Balance (saldo_uangku,no_pesanan) values (9000000,839);
insert into Uangku_Balance (saldo_uangku,no_pesanan) values (9500000,840);

select *from customer
where customer_id
between '54001' and '54009';

select customer_id
from customer
order by customer_id desc;

select *from membayar;

select customer.customer_id,PK_MEMBAYAR
from customer,membayar
where customer.customer_id = membayar.customer_id;

select customer_id,PK_membayar
from customer
join membayar using (customer_id);

select nama_customer
from customer
where nama_customer like 'B%';

select nama_customer,customer_id,nama_layanan
from customer
join membayar using (customer_id)
join layanan using(id_layanan);

select customer.customer_id,nama_customer,nama_layanan
from customer
join membayar 
on(membayar.customer_id = customer.customer_id)
join layanan 
on(layanan.id_layanan = membayar.id_layanan);

select customer_id,PK_membayar
from customer
join membayar using (customer_id)
where PK_membayar like '%M%';

select *from pembayaran
where no_pesanan >801 and
no_pesanan <806;

select *from memiliki;

select nama_customer, count(nama_layanan) as transaksi
from customer
join membayar using (customer_id)
join layanan using(id_layanan)
group by(nama_customer);

select nama_customer,nama_layanan, min(tagihan) as Tagihan
from customer
join membayar using (customer_id)
join layanan using(id_layanan)
group by (nama_customer,nama_layanan)
having min(tagihan)<'Rp. 200000';

SELECT customer_id, count (tagihan)
FROM customer
join membayar using (customer_id)
join layanan using(id_layanan)
GROUP BY customer_id
HAVING count(tagihan) < ( SELECT count(tagihan)
FROM layanan
WHERE customer_id = '54003' );

select distinct nama_customer from customer;



select nama_customer,customer_id, max(poin_customer)
from customer
group by (nama_customer,customer_id)
having max(poin_customer) = (select max(poin_customer)
from customer);


/*soal mudah*/
select customer_id,nama_customer
from customer
join membayar using (customer_id)
join layanan using(id_layanan)
where nama_layanan ='BPJS Kesehatan';

select nama_customer,alamat_customer
from customer
where jenis_kelamin ='Perempuan';

select nama_customer,periode_pembayaran
from customer,pembayaran
where periode_pembayaran ='12-19-2018';

select nama_customer,email_customer,rincian_pembayaran
from customer,pembayaran
where nama_customer like 'W%';

select customer_id,max(nominal_voucher)
from customer
join membayar using (customer_id)
join layanan using(id_layanan)
join voucher_game using(id_layanan)
group by(customer_id)
having max(nominal_voucher);

SELECT customer_id, max (nominal_voucher)
FROM customer
join membayar using (customer_id)
join layanan using(id_layanan)
GROUP BY customer_id
HAVING max((nominal_voucher) < ( SELECT max(nominal_voucher)
FROM voucher_game
where tagihan >= 'Rp. 25000'));

select nama_layanan
from layanan
where tagihan >= 'Rp. 25000';










