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

CREATE TABLE pdam (
    nama_perusahaan   VARCHAR2(4000),
    id_layanan        INTEGER NOT NULL
);

ALTER TABLE pdam ADD CONSTRAINT pdam_pk PRIMARY KEY ( id_layanan );
ALTER TABLE pdam ADD CONSTRAINT pdam_layanan_fk FOREIGN KEY ( id_layanan ) REFERENCES layanan ( id_layanan );

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
