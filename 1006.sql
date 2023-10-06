set serveroutput on;
exec interest;

create table book_log(
    bookid_l number, 
    bookname_l varchar2(40),
    publisher_l varchar2(40),
    price_l number
);

insert into book values(15, '과학 좋아요', '과학미디어', 25000);

create or replace procedure interest
as
    myInterest numeric;
    price numeric;
    cursor interestCursor is select saleprice from orders;
begin
    myInterest := 0.0;
    open interestCursor;
    loop
        fetch interestCursor into price;
        exit when interestCursor%NOTFOUND;
        if price >= 30000 then
            myInterest := myInterest + price*0.1;
        else
            myInterest := myInterest + price*0.05;
        end if;
    end loop;
    close interestCursor;
    DBMS_OUTPUT.PUT_LINE('전체 이익금액 = ' || round(myInterest, 3));
end;

create or replace trigger afterinsertbook
after insert on book for each row
declare 
    average number;
begin
    insert into book_log
    values(:new.bookid, :new.bookname, :new.publisher, :new.price);
    dbms_output.put_line('삽입 행을 book_log 테이블에 백업했습니다.');
end;

insert into book values(16, '과학 좋아요', '과학미디어', 25000);
select * from book where bookid = 15;
select * from book_log where bookid_l=15;


-- 사용자 정의 함수 만들기
create or replace function fnc_interest(price number)
                                            return int
is
    myInterest number;
begin
    if price >= 30000 then
        myInterest := price * 0.1;
    else
        myInterest := price * 0.05;
    end if;
    return myInterest;
end;

-- 실행할 때 블럭설정하고 실행해 주세요.
select custid, orderid, saleprice, fnc_interest(saleprice) 이익금 from orders;

create or replace PROCEDURE INSERTCUSTOMER (
    myCustId in number,
    myName in varchar2,
    myAddress in varchar2,
    myPhone in varchar2)
AS 
BEGIN
  insert into customer(custid, name, address, phone)
  values(myCustId, myName, myAddress, myPhone);
END INSERTCUSTOMER;

set serveroutput on;
exec INSERTCUSTOMER (6,'박현경','서울시 용산구 한남동','010-1234-7653');

select * from customer;




