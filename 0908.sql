-- ���տ�����: ������(UNION), ������(MINUS), ������(INTERSECT)
-- ������ ������ ���
-- ������ �ֹ����� ���� ���� �̸��� ���ÿ�.
select name from customer;

select distinct custid from orders;

select name from customer
where custid in(select distinct custid from orders);

-- ������ ������ ����� ���
select name from customer
minus
select name from customer
where custid in(select distinct custid from orders);

-- ������ ������ ������� ���� ���
select name from customer
where custid not in(select distinct custid from orders);

-- EXISTS: ���������� ����� �����ϴ� ��쿡 true
-- �ֹ��� �ִ� ���� �̸��� �ּҸ� ����Ͻÿ�.
-- in������ ����� ���
select name, address from customer
where custid in(select distinct custid from orders);
-- �������ΰ� �ߺ��� ����
select distinct name, address from customer c,orders o
where c.custid = o.custid;
-- Exists ����� ���
select name, address from customer c
where exists(select * from orders o
                        where c.custid = o.custid);


-- ��������
-- �������� ������ ������ ���ǻ� ��
select count(*) as ���ǻ��Ǽ� 
from customer c,orders o
where c.custid=o.custid and c.name like'%������%'
group by c.name;

-- �������� ������ ������ �̸�, ����, ������ �ǸŰ����� ����
select bookname, price, price-saleprice
from customer c, orders o, book b
where (c.custid=o.custid) and (b.bookid=o.bookid) and (c.name='������');
-- �������� �������� ���� ������ �̸�
select bookname from book b, orders o, customer c
minus
select bookname from book b, orders o, customer c
where (c.custid=o.custid) and (b.bookid=o.bookid) and (c.name='������');
-- �ֹ����� ���� ���� �̸�(�μ����� ���)
select name from customer
where custid not in(select distinct custid from orders);
-- �ֹ� �ݾ��� �Ѿװ� �ֹ��� ��� �ݾ�
select sum(saleprice) as �Ѿ�, avg(saleprice)as ���
from orders;
-- ���� �̸��� ���� ���ž�
select customer.name, sum(orders.saleprice)
from orders ,customer 
where orders.custid=customer.custid 
group by customer.name
order by name;
-- ���� �̸��� ���� ������ ���� ���
select customer.name, book.bookname
from orders,customer,book
where orders.custid=customer.custid and book.bookid=orders.bookid 
group by customer.name, book.bookname
order by name;
-- ������ ����(Book ���̺�)�� �ǸŰ���(Orders ���̺�)�� ���̰� ���� ���� �ֹ�
select *
from book, orders
where book.bookid = orders.bookid
and book.price-orders.saleprice = (
select max(book.price-orders.saleprice)
from book, orders
where book.bookid = orders.bookid
);
-- ������ �Ǹž� ��պ��� �ڽ��� ���ž� ����� �� ���� ���� �̸�
select customer.name
from customer, orders
where customer.custid = orders.custid
group by customer.name
having avg(orders.saleprice) > (
select avg(orders.saleprice)
from orders
);

-- DDL (Data Defination Language): ������ ���Ǿ�
-- create table/alter table/drop table
-- ���̺� ���� ����1
create table newbook1(
    bookid number,
    bookname varchar2(20),
    publisher varchar2(20),
    price number);
    
-- ���̺� ���� ����2
-- primary key ���� ��� 1
create table newbook2(
    bookid number,
    bookname varchar2(20),
    publisher varchar2(20),
    price number,
    primary key(bookid)
);

-- primary key ���� ��� 2
create table newbook3(
    bookid number primary key,
    bookname varchar2(20),
    publisher varchar2(20),
    price number
);

-- bookname �÷�: null�� ���� �� ����
-- publisher �÷�: ������ ���� ���� �� ����
-- price �÷�: ������ �ԷµǾ� ���� ������ �⺻���� 10000�����ϰ� �Էµ� ���� 1000�ʰ��� ��
-- bookname, publisher �÷��� ����Ű�� ����
create table newbook4(
    bookname varchar(20) not null,
    publisher varchar(20) unique,
    price number default 10000 check(price > 1000),
    primary key(bookname, publisher)
);












