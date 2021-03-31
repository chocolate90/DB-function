--형 변환 함수 TO_CHAR TO_DATE TO_NUMBER

--TO_CHAR (날짜를 문자로 변경 OR 숫자를 문자로 변경)

--to_char(date,'pmt') 날짜를 문자로 (YY-MM-DD HH:MI:SS)
select to_char(sysdate) from dual;
select to_char(sysdate,'YYYY"년"MM"월"DD"일"') from dual;-- (-,/,:,(공백)외에 다른 문자는 ""사용없이 사용불가능 )
select to_char(sysdate,'YYYY-MM-DD') from dual; -- (-,/,:,(공백)은""사용없이 사용가능 )
select to_char(sysdate, 'YY-MM-DD HH:MI:SS') from dual; 

select first_name, hire_date from employees;
select first_name, to_char(hire_date,'YYYY-MM-DD') from employees;


-- to_char(hire_date,'YYYY-MM-DD')이렇게 사용될 때가 엄청 많음.
select first_name , to_char(hire_date , 'YY-MM-DD HH24:mi:ss') from employees;
select first_name , to_char(hire_date, 'YYYY"년" MM"월" DD"일"')from employees;


--to_char(number,'pmt') 숫자를 문자로 (9,.,,)
select to_char(20000,'99999') from dual;  --9는 자릿수 (매우중요) (자릿수를 부족하게 주면 ####으로 출력된다.)
select to_char(20000.14,'99999.99') from dual; -- .은 소수점 자리를 의미
select to_char(20000.14 , '99,999.99') from dual; -- ,는 콤마의 표현 형식
select to_char(20000.14 , 'L99,999.99') from dual; --L은 지역화폐 기호 표현 형식
select to_char(20000.14 , '$99,999.99')from dual; -- 달러는 그냥 $ 붙혀주면됨.

select first_name,to_char(salary,'$999,999.99') from employees;


--to number(문자, 숫자형식) - 문자를 숫자로 (숫자표현식에서 지원하지 않는 구문은 바꿀 수 없다.)
select '2000' + 2000 from dual; --사실 숫자형 문자열은 숫자로 자동형변환이 가능 
select to_number('2000')+2000 from dual;  --좀 더 정직한(?,정식적인?) 표현


-- select '$3,300'+ 2000 from dual; $기호때문에 형변환이 안됨
select to_number('$3,300' , '$9,999')+2000 from dual; -- 만약 숫자표현형식중 $기호가 빠지면 다시 에러를 발생시킴


--TO_DATE(문자, 날짜표현형식) - 문자를 날짜로
select to_date('2021-03-31') from dual; --날짜형식의 문자라면 fmt를 적지 않더라도 가능하다.
select sysdate - to_date('2021-03-25') from dual; --일수

select to_date('2021/03/25', 'YYYY/MM/DD') from dual;
select to_date('2021/03/25 14:51:24', 'YYYY/MM/DD HH24:MI:SS') from dual;

-- '20201130', '20201111' 날짜 차이
select to_date(20201130) - to_date(20201111) from dual;

-- xxxx년xx월xx일로 출력
select '20051002' from dual;
select to_char(to_date('20051002'), 'YYYY"년"MM"월"DD"일"') from dual;


--NVL(컬럼, NULL일경우 변환할값) - ★★★★★
select nvl(200,0), nvl(null, 0) from dual;
select first_name, nvl(commission_pct,0) as commission_pct from employees;


--NVL2(컬럼, NULL이 아닐 경우의 값, NULL일 경우의 값) - ★★★★★
select nvl2(null, 'null이 아님', 'null임') from dual;
select first_name,
       salary,
       commission_pct,
       nvl2(commission_pct, salary + (salary*commission_pct), salary)
from employees;

--DECODE(컬럼, 값, 결과, 값, 결과, default) - ★★★★★
select decode('C', 'A', 'A입니다', 'B', 'B입니다', 'C', 'C입니다', '전부 아닙니다') from dual;

select first_name,
       salary,
       job_id,
       decode(job_id, 'IT_PROG', salary * 0.5, 'AD_VP', salary*0.4, salary*0.1) as bonus
from employees;


--CASE 컬럼 WHEN 값 THEN 결과 END
select first_name,
       salary,
       job_id,
       (case job_id when 'IT_PROG' THEN salary * 0.5
                    when 'AD_VP' THEN salary * 0.4
                    else salary * 0.1
        end) as bonus
from employees;