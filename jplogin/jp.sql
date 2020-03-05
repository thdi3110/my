CREATE TABLE "MEMBER" (
	"M_NO"	number		NOT NULL,
	"M_ID"	varchar2(50)		NOT NULL,
	"M_NAME"	varchar2(30)		NOT NULL,
	"M_PASSWORD"	varchar2(60)		NOT NULL,
	"M_EMAIL"	varchar2(100)		NOT NULL,
	"M_ADDRESS"	varchar2(200)		NOT NULL,
	"M_PHONE"	varchar2(100)		NOT NULL,
	"M_CODE"	varchar2(10)		NULL,
	"M_ACCOUNT"	varchar2(50)		NULL,
	"M_DIVISION"	varchar2(10)		NOT NULL,
	"M_REGISTRATION"	varchar2(50)		NULL,
	"M_JOINDATE"	date	DEFAULT sysdate	NOT NULL,
	"M_SECESSIONDATE"	date	DEFAULT null	NULL
);

CREATE TABLE "DIVISION" (
	"D_DIVISION"	varchar2(10)		NOT NULL,
	"D_TITLE"	varchar2(20)		NOT NULL
);

CREATE TABLE "BANK" (
	"B_CODE"	varchar2(10)		NOT NULL,
	"B_TITLE"	varchar2(30)		NOT NULL
);

CREATE TABLE "LOGIN" (
	"L_ID"	varchar2(50)		NOT NULL,
	"L_LOGINTIME"	date	DEFAULT sysdate	NOT NULL
);

ALTER TABLE "MEMBER" ADD CONSTRAINT "PK_MEMBER" PRIMARY KEY (
	"M_NO",
	"M_ID"
);

ALTER TABLE "DIVISION" ADD CONSTRAINT "PK_DIVISION" PRIMARY KEY (
	"D_DIVISION"
);

ALTER TABLE "BANK" ADD CONSTRAINT "PK_BANK" PRIMARY KEY (
	"B_CODE"
);



create sequence MEMBER_SEQ
  start with 1
  increment BY 1
  maxvalue 9999999;
  
commit;

drop table MEMBER;

insert into MEMBER(M_NO, M_ID, M_NAME, M_PASSWORD, M_EMAIL, M_ADDRESS, M_PHONE, M_DIVISION, M_JOINDATE)
      		values(MEMBER_SEQ.nextval, 'jpsystem', '������', 'jp', 'jpsystem2020@gmail.com', 'test', 'test', 'S1', SYSDATE);
insert into DIVISION values('S1', '������');
insert into DIVISION values('A1', '�Ϲ�ȸ��');
insert into DIVISION values('B1', '�о���ȸ��');

insert into BANK values('NULL', 'NULL');
insert into BANK values('B1', '�츮����');
insert into BANK values('B2', '��������');
insert into BANK values('B3', '��������');
insert into BANK values('B4', '�ϳ�����');
insert into BANK values('B5', '���̹�ũ');
insert into BANK values('B6', 'īī����ũ');
insert into BANK values('B7', 'KDB�������');
insert into BANK values('B8', 'IBK�������');
insert into BANK values('B9', 'ȸ������');
insert into BANK values('B10', '��-����');
insert into BANK values('B11', '�긲����');
insert into BANK values('B12', '�������ݰ�');
insert into BANK values('B13', '�ſ���������');
insert into BANK values('B14', '�뱸����');
insert into BANK values('B15', '�λ�����');
insert into BANK values('B16', '�泲����');
insert into BANK values('B17', '��������');
insert into BANK values('B18', '��������');
insert into BANK values('B19', '��������');
