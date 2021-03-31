--날짜 함수
select sysdate from dual; --일자 (일반적인 사용이 많다.)
select systimestamp from dual; --시분초까지


--날짜도 연산이 가능하다.
select sysdate - hire_date from employees;
select (sysdate - hire_date)/7 from employees; --몇주
select (sysdate - hire_date)/365 from employees; --년수
select trunc((sysdate - hire_date)/365) from employees;


--날짜에도 trunc, round 적용이 가능하다.
select round(sysdate) from dual;
select round(sysdate, 'year') from dual; --년 기준으로 반올림
select round(sysdate, 'month')from dual; --월 기준으로 반올림
select round(sysdate, 'day') from dual; --일 기준으로 반올림(해당 주의 일요일날짜 기준)

select trunc(sysdate) from dual;
select trunc(sysdate, 'year') from dual; --년 기준으로 절삭
select trunc(sysdate, 'month') from dual; --월 기준으로 절삭
select trunc(sysdate, 'day') from dual; --일 기준으로 절삭(해당 주의 일요일날짜 기준)
