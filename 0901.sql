select * from book;
-- book테이블에서 과학이라는 문자열을 포함하고 도서가격이 15000원 이상인 데이터 행을 검색하시오.
select * from book
        where bookname like '%과학%' and price >= 15000 ;
-- book테이블에서 출판사가 굿스포츠 또는 어크로스인 도서를 검색하시오.
select * from book
        where publisher = '굿스포츠' or publisher = '어크로스';
-- 위의 문제를 in 연산자를 사용하여 수정해 보세요.
select * from book
        where publisher in('굿스포츠', '어크로스');
-- book테이블에서 도서번호순으로 검색하시오
select * from book order by bookid;

-- book테이블에서 가격순으로 검색을 하고 같은 가격이면 이름순으로 검색하시오.
select * from book order by price, bookname;

-- book테이블에서 가격을 내림차순으로 검색을 하고 같은 가격이면 출판사순으로 검색하시오.
select * from book order by price DESC, publisher ASC ;

select * from orders;
-- orders 테이블에서 고객이 주문한 도서의 총 판매액을 구하시오.
-- 집계함수를 사용(합계: sum)
select sum(saleprice) as 총판매금액 from orders;

-- orders 테이블에서 고객번호가 1인 고객이 주문한 도서의 총판매액을 구하시오.
select sum(saleprice) as 총판매금액 
from orders
where custid = 1;

-- orders 테이블에서 판매액의 합계, 평균, 최소값, 최대값을 구하시오.
select sum(saleprice) as 총판매금액,
    avg(saleprice) as 판매액평균,
    min(saleprice) as 최저가격,
    max(saleprice) as 최대가격
from orders;

-- orders 테이블에서 판매한 도서의 개수를 구하시오.
select count(*) from orders;
-- orders 테이블에서 도서가격이 13000원 이상인 도서의 개수를 구하시오.
select count(*) from orders where saleprice >= 13000;
-- orders 테이블에서 고객번호가 1 또는 3인 고객의 주문 개수를 구하시오 구하시오.
select count(*) from orders
where custid in(1, 3);

-- orders 테이블에서  고객별 주문한 도서의 개수와 총합계를 구하시오.
-- 그룹화 (부분합): group by
select custid, count(*) 주문수량, sum(saleprice) 주문총액 
from orders
group by custid
order by custid;
-- orders 테이블에서 판매가격이 8000원 이상인 도서를 구매한 고객에 대해 고객별 주문 도서의 총 수량을 구하시오.
-- 단 2권이상 구매한 고객만 출력하시오.
select custid, count(*) as 도서수량 from orders
where saleprice >= 8000
group by custid
having count(*) >= 2
order by custid;

-- 도서번호가 1인 도서의 이름
select bookname from book where bookid = 1;
-- 가격이 15000원 이상인 도서의 이름
select bookname from book where price >= 15000;
-- 박지성의 총 구매액(박지성의 고객번호는 1번으로 놓고 작성)
select sum(saleprice) as 총구매액 from orders where custid = 1;
-- 박지성이 구매한 도서의 수(박지성의 고객번호는 1번으로 놓고 작성)
select count(*) from orders where custid = 1;
-- 마당서점 도서의 총 개수
select count(*) as 총개수 from book;
-- 마당서점에 도서를 출고하는 출판사의 총 개수
select count(distinct publisher) as 총개수 from book;
-- 모든 고객의 이름, 주소
select name, address from customer;
-- 2023년 7월 7일 ~ 7월 12일 사이에 주문 받은 도서의 주문번호
select orderid from orders where orderdate BETWEEN '2023-07-07' and '2023-07-12';
-- 2023년 7월 7일 ~ 7월 12일 사이에 주문 받은 도서를 제외한 도서의 주문번호
select orderid from orders where orderdate not BETWEEN '2023-07-07' and '2023-07-12';
-- 성이 '박'씨인 고객의 이름과 주소
select name, address from customer where name like '박%';
-- 성이 '박'씨이고 이름이 '아'로 끝나는 고객의 이름과 주소
select name, address from customer where name like '%박_리';






