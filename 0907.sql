-- ��������(Equi Join)
-- �������� ���̺��� ������ �� Ư�� �÷��� ���� ���� ��鸸 �˻��� �� ���

-- ���� ���� �ֹ��� ���� �����͸� ��� ����Ͻÿ�
select * from customer, orders
where customer.custid = orders.custid;

-- ���� ���� �ֹ��� ���� �����͸� ��� ����ȣ ������������ ����Ͻÿ�
select * from customer, orders
where customer.custid = orders.custid
order by customer.custid desc;

-- ���� �̸�, �ֹ��� ���� �ǸŰ����� �˻��Ͻÿ�.
select name, saleprice from customer c, orders o
where c.custid = o.custid;

-- ���̸����� �ֹ��� ��� ������ ���Ǹž��� ���ϰ� ���̸������� �����Ͻÿ�.
select name, sum(saleprice) from customer, orders
where customer.custid = orders.custid
group by name
order by name;

-- ���� �̸��� �ֹ��� ������ �̸��� ���Ͻÿ�.
-- 3���� ���̺� ���� ��������
select name, bookname from customer c, book b, orders o
where c.custid = o.custid and o.bookid = b.bookid
order by name;

-- ���������� 16000���� ������ �ֹ��� ���̸��� �����̸��� ����Ͻÿ�.
select name, bookname from customer c, book b, orders o
where c.custid = o.custid and o.bookid = b.bookid and price = 18000;

-- �ܺ�����(Outer Join)
-- ���������� �ϰԵǸ� ���� �������� ���� ���� ���õ�����
-- �ܺ������� �ϰԵǸ� ������ �Ǵ� ���̺��� ���� �������� ���� ������ �൵ �����ؼ� ������ش�.

-- ������ �������� ���� ���� �����Ͽ� ���̸��� �ֹ��� ������ �ǸŰ����� ����Ͻÿ�.
select name, saleprice 
from customer c left outer join orders o
                on c.custid = o.custid;
                
-- Sub Query(�μ� ����)
-- Main Query ���� �ִ� Query

-- ���������� ���� ��� ����
select max(price) from book;
-- �����̸�
select bookname from book;
-- ���������� ���� ��� �����̸��� ����Ͻÿ�.
select bookname from book
where price = (select max(price) from book);

-- ���������� ���� �� ������ �̸��� ������ ����Ͻÿ�.
select bookname, price from book
where price = (select min(price) from book);

-- ������ ������ ���� �ִ� ���� �̸��� �˻��Ͻÿ�.
select name from customer
where custid in (select distinct custid from orders);
-- sub query: �ֹ��� ���� �ִ� ����ȣ��
select distinct custid from orders;

-- ���������Ͽ콺���� ������ ������ ������ ���� �̸��� ����Ͻÿ�.
select name from customer;
select bookid, bookname from book
where publisher = '���������Ͽ콺';
-- ������ ������ ���
select distinct custid from orders;

select name from customer
where custid in(select distinct custid from orders 
                where bookid in(select bookid from book
                                where publisher='���������Ͽ콺'));
-- �����Ÿ� �������� ����
select name from customer c, orders o, book b
where o.bookid = b.bookid and c.custid = o.custid and b.publisher = '���������Ͽ콺';












