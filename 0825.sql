-- �������� Book ���̺�
create table Book(
    bookid NUMBER(2) primary key,
    bookname VARCHAR2(40),
    publisher VARCHAR2(40),
    price NUMBER(8)
);

-- ���Ե������� Imported_Book ���̺�
create table Imported_Book(
    bookid NUMBER(2),
    bookname VARCHAR2(40),
    publisher VARCHAR2(40),
    price NUMBER(8)
);

-- ������ Customer ���̺�
create table Customer(
    custid NUMBER(2) PRIMARY KEY,
    name VARCHAR2(40),
    address VARCHAR2(50),
    phone VARCHAR2(20)
);

-- �ֹ����� Orders ���̺�
create table Orders(
    orderid NUMBER(2) PRIMARY KEY,
    custid NUMBER(2) REFERENCES Customer(custid),
    bookid NUMBER(2) REFERENCES Book(bookid),
    saleprice NUMBER(8),
    orderdate DATE
);

-- Book ���̺� 10���� ���� ������ �߰��ϼ���
insert into Book values(1, '�౸�� ����', '�½�����', 7000);
insert into Book values(2, '�ظ����� ������ ����', '����å', 12000);
insert into Book values(3, '����', '�س�', 15000);
insert into Book values(4, '���̳��� ����ħ', '���̿�', 16000);
insert into Book values(5, '����� ���ΰ� ��վ�', '�ٻ�Ͻ�', 13000);
insert into Book values(6, '���ϸ��� ���߷�', '��ũ�ν�', 12000);
insert into Book values(7, '���� ������ ���� ����', '������', 15000);
insert into Book values(8, '���۳��', '���������Ͽ콺', 12000);
insert into Book values(9, '������ Ȯ����', '���������Ͽ콺', 16000);
insert into Book values(10, '�ּ����� �ѱ���', '����Ʈ������', 18000);

-- Customer ���̺� ������ 5�� �߰�
insert into customer values(1, '������', '���� ��ü����', '000-5000-001');
insert into customer values(2, '�迬��', '���� ���۱� �漮��', '02-333-5555');
insert into customer values(3, '��̶�', '���� ��걸 ������', '02-555-7777');
insert into customer values(4, '�߽ż�', '��õ������ ������', '032-233-5656');
insert into customer values(5, '�ڼ���', '���������� ������', '042-322-1237');