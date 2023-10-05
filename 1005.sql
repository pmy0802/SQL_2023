-- ���� ��� �Ǹ� ������ ���
select c.name, s
from (select custid, avg(saleprice)s
        from orders
        group by custid) o, customer c
where c.custid = o.custid;

-- custid�� 3������ ���� ���Ǹűݾ��� �հ踦 ���ض�
select sum(saleprice)"total"
from orders od
where exists (select * from customer cs where custid <= 3 and cs.custid = od.custid);

select * from book;

-- å�̸��� �����̶�� �ܾ ���Ե� ������� ����Ͻÿ�.
select * from book
where bookname like '%����%';

create view v_book
as select * from book
where bookname like '%����%';

select * from customer;

-- �ּҿ� �����̶�� �ܾ ���Ե� �並 �����Ͻÿ�
select * from customer
where address like '%����%';

create view vw_customer
as select * from customer
where address like '%����%';

select * from vw_customer;

-- �ֹ����̺��� ���̸�, �����̸��� �ٷ� Ȯ���� �� �ִ� �並 ������ ��, 
-- �迬�� ���� ������ ������ �ֹ���ȣ, ������, �ֹ����� ����Ͻÿ�.
create view vw_orders(orderid, name, custid, bookid, bookname, saleprice, orderdate)
as select o.orderid,c.name, o.custid, o.bookid, b.bookname, o.saleprice, o.orderdate
   from orders o, customer c, book b
   where o.custid = c.custid and o.bookid = b.bookid;

select * from vw_orders;

select orderid, bookname, saleprice
from vw_orders
where name = '�迬��';

-- ������ �並 �����Ѵ�

create or replace view vw_customer(custid, name, address)
as select custid, name, address
from customer
where address like '����';

select * from customer;

select * from vw_customer;

-- �� ����
drop view vw_customer;

-- �ǸŰ����� 20000�� �̻��� ������ ������ȣ, �����̸�, ���̸�, ���ǻ�, �ǸŰ����� �����ִ� highorders �並 �����Ͻÿ�
create view highorders
as select od.bookid, bk.bookname, cs.name, bk.publisher, od.saleprice
from customer cs, orders od, book bk
where cs.custid=od.custid and od.bookid=bk.bookid and saleprice >= 20000;

-- ������ �並 �̿��Ͽ� �Ǹŵ� ������ �̸��� ���� �̸��� ����ϴ� SQL���� �ۼ��Ͻÿ�
select bookname, name
from highorders;

-- highorders �並 �����ϰ��� �Ѵ�. �ǸŰ��� �Ӽ��� �����ϴ� ����� �����Ͻÿ�.
-- ���� �� (2)�� SQL ���� �ٽ� �����Ͻÿ�
create or replace view highorders(bookid, bookname, name, publisher)
as select o.bookid, b.bookname, c.name, b.publisher
from orders o, customer c, book b
where o.custid = c.custid and o.bookid = b.bookid;

select bookname, name from highorders;

-- insertbook ���ν��� ����
exec insertbook(13, '����������', '������м���', 25000);

select * from book;

exec insertorupdate(14, '������ ��ſ�', '������м���', 30000);

exec insertorupdate(14, '������ ��ſ�', '������м���', 20000);

set serveroutput on;
declare
    averageVal number;
begin 
    averagePrice(averageVal);
    DBMS_OUTPUT.PUT_LINE('������հ���: ' ||round(averageVal, 2));
end;















