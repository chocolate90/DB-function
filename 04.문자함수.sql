--문자 조작 함수
--dual은 가상 테이블

-- lower, upper, initcap
select 'hello world' from dual;

select lower('hello WORLD'), upper('hello wolrd'), initcap('hello world') FROM dual;

select lower(first_name), upper(first_name), initcap(first_name) from employees;


--함수는 where 조건절에도 들어갈 수 있다.
select * from employees where lower(first_name) = 'ellen';


--length 문자열 길이, instr 문자열 찾기
select length('abcdef') as 길이, instr('abcdef', 'a') from dual;

select first_name, length(first_name), instr(first_name, 'a') from employees;


--concat 문자열 붙이기, substr 문자열 자르기
select concat('hello', 'world') from dual;
select concat(concat('hello', ' '), 'world') from dual;
select 'hello ' || 'world' from dual;

select substr('abcdef', 2, 5) from dual;

select first_name, 
       concat(first_name, last_name),
       substr(first_name, 1, 3) 
from employees;


--lpad, rpad 좌우측 지정된 문자열로 채우기
select lpad('abc', 10, '*') from dual; --최대 10자리에서 남는 부분을 *로 채운다.
select rpad('abc', 10, '*') from dual; 


--ltrim, rtrim, trim 공백제거
select ltrim('     hello world     ') from dual;
select rtrim('     hello world     ') from dual;
select trim('   hello world   ') from dual;


--replace 문자열 바꾸기
select replace('my dream is president', 'president', 'teacher') from dual;
select replace('my dream is president', ' ', '') from dual;

select replace(replace('my dream is president', 'president', 'teacher'), ' ', '') as test from dual;

select replace(concat(first_name || ' ', last_name), ' ' , '') as test1 from employees;