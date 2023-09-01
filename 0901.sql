select * from book;
-- book���̺��� �����̶�� ���ڿ��� �����ϰ� ���������� 15000�� �̻��� ������ ���� �˻��Ͻÿ�.
select * from book
        where bookname like '%����%' and price >= 15000 ;
-- book���̺��� ���ǻ簡 �½����� �Ǵ� ��ũ�ν��� ������ �˻��Ͻÿ�.
select * from book
        where publisher = '�½�����' or publisher = '��ũ�ν�';
-- ���� ������ in �����ڸ� ����Ͽ� ������ ������.
select * from book
        where publisher in('�½�����', '��ũ�ν�');
-- book���̺��� ������ȣ������ �˻��Ͻÿ�
select * from book order by bookid;

-- book���̺��� ���ݼ����� �˻��� �ϰ� ���� �����̸� �̸������� �˻��Ͻÿ�.
select * from book order by price, bookname;

-- book���̺��� ������ ������������ �˻��� �ϰ� ���� �����̸� ���ǻ������ �˻��Ͻÿ�.
select * from book order by price DESC, publisher ASC ;

select * from orders;
-- orders ���̺��� ���� �ֹ��� ������ �� �Ǹž��� ���Ͻÿ�.
-- �����Լ��� ���(�հ�: sum)
select sum(saleprice) as ���Ǹűݾ� from orders;

-- orders ���̺��� ����ȣ�� 1�� ���� �ֹ��� ������ ���Ǹž��� ���Ͻÿ�.
select sum(saleprice) as ���Ǹűݾ� 
from orders
where custid = 1;

-- orders ���̺��� �Ǹž��� �հ�, ���, �ּҰ�, �ִ밪�� ���Ͻÿ�.
select sum(saleprice) as ���Ǹűݾ�,
    avg(saleprice) as �Ǹž����,
    min(saleprice) as ��������,
    max(saleprice) as �ִ밡��
from orders;

-- orders ���̺��� �Ǹ��� ������ ������ ���Ͻÿ�.
select count(*) from orders;
-- orders ���̺��� ���������� 13000�� �̻��� ������ ������ ���Ͻÿ�.
select count(*) from orders where saleprice >= 13000;
-- orders ���̺��� ����ȣ�� 1 �Ǵ� 3�� ���� �ֹ� ������ ���Ͻÿ� ���Ͻÿ�.
select count(*) from orders
where custid in(1, 3);

-- orders ���̺���  ���� �ֹ��� ������ ������ ���հ踦 ���Ͻÿ�.
-- �׷�ȭ (�κ���): group by
select custid, count(*) �ֹ�����, sum(saleprice) �ֹ��Ѿ� 
from orders
group by custid
order by custid;
-- orders ���̺��� �ǸŰ����� 8000�� �̻��� ������ ������ ���� ���� ���� �ֹ� ������ �� ������ ���Ͻÿ�.
-- �� 2���̻� ������ ���� ����Ͻÿ�.
select custid, count(*) as �������� from orders
where saleprice >= 8000
group by custid
having count(*) >= 2
order by custid;

-- ������ȣ�� 1�� ������ �̸�
select bookname from book where bookid = 1;
-- ������ 15000�� �̻��� ������ �̸�
select bookname from book where price >= 15000;
-- �������� �� ���ž�(�������� ����ȣ�� 1������ ���� �ۼ�)
select sum(saleprice) as �ѱ��ž� from orders where custid = 1;
-- �������� ������ ������ ��(�������� ����ȣ�� 1������ ���� �ۼ�)
select count(*) from orders where custid = 1;
-- ���缭�� ������ �� ����
select count(*) as �Ѱ��� from book;
-- ���缭���� ������ ����ϴ� ���ǻ��� �� ����
select count(distinct publisher) as �Ѱ��� from book;
-- ��� ���� �̸�, �ּ�
select name, address from customer;
-- 2023�� 7�� 7�� ~ 7�� 12�� ���̿� �ֹ� ���� ������ �ֹ���ȣ
select orderid from orders where orderdate BETWEEN '2023-07-07' and '2023-07-12';
-- 2023�� 7�� 7�� ~ 7�� 12�� ���̿� �ֹ� ���� ������ ������ ������ �ֹ���ȣ
select orderid from orders where orderdate not BETWEEN '2023-07-07' and '2023-07-12';
-- ���� '��'���� ���� �̸��� �ּ�
select name, address from customer where name like '��%';
-- ���� '��'���̰� �̸��� '��'�� ������ ���� �̸��� �ּ�
select name, address from customer where name like '%��_��';






