--그룹함수 sum, avg, max, min, count (일반 컬럼과 함께 사용할 수 없다.)
 
 select count(*) from employees; --전체 행 수
 select count(commission_pct) from employees; --commission_pct의 null이 아닌 행 수
 select count(manager_id) from employees;
 
 select sum(salary), trunc(avg(salary)), min(salary), max(salary), count(salary) from employees;
 
 select sum(salary) from employees where department_id = 50; --부서가 50인 사람들의 급여 합
 
 
 --group by절
 
 select * from employees;
 
 select job_id from employees group by job_id; --job_id별 그룹핑
 
 --group by절에서 그룹함수의 사용이 가능
 select job_id, avg(salary) from employees group by job_id; --job_id별 급여 평균
 
 select department_id,
        avg(salary),
        sum(salary),
        count(salary)
from employees
group by department_id;


--주의할 점
-- 그룹핑이 되지 않으면 그룹함수와 일반 컬럼을 동시에 사용하지 못한다.
select count(*), salary from employees; -- 에러

-- group by절을 사용할 때 group절에 묶이지 않으면 다른 컬럼 조회를 할 수 없다.
select job_id from employees group by department_id; -- 에러


--2개 이상의 group by절
select department_id, 
       job_id
from employees
group by department_id, job_id
order by department_id desc;

select department_id,
       job_id,
       avg(salary)
from employees
group by department_id, job_id
order by department_id desc;


--group by절의 조건 having (where절은 일반행에 대한 조건)
select department_id, sum(salary)
from employees
group by department_id
having sum(salary) > 100000;


--job_id별 개수가 5 이상
select job_id, count(*)
from employees
group by job_id
having count(*) >= 5
order by count(*) desc;


--부서아이디가 50이상인 행을 그룹핑하고 그룹 평균중 5000이상만 조회, 정렬

select department_id, trunc(avg(salary)) as 부서평균급여 
from employees
where department_id >= 50
group by department_id
having avg(salary) >= 5000
order by 부서평균급여 desc;


--count(*) over() 그룹화 하지 않아도, 예외적으로 총 행의 수를 붙여서 조회하는 구문이다.
select department_id, first_name, count(*) over() from employees;


--연습문제

--문제 1.
--사원 테이블에서 JOB_ID별 사원 수를 구하세요.
--사원 테이블에서 JOB_ID별 월급의 평균을 구하세요. 월급의 평균 순으로 내림차순 정렬하세요

select job_id, count(job_id), avg(salary) as 월급평균
from employees
group by job_id
order by 월급평균 desc;

--문제 2.
--사원 테이블에서 입사 년도 별 사원 수를 구하세요.

select to_char(hire_date, 'YY'), count(hire_date)
from employees
group by to_char(hire_date, 'YY');

--문제 3.
--급여가 1000 이상인 사원들의 부서별 평균 급여를 출력하세요. 단 부서 평균 급여가 2000이상인 부서만 출력

select department_id, trunc(avg(salary)) as 평균급여
from employees
where salary >= 1000
group by department_id
having avg(salary) >= 2000
order by 평균급여 desc;

--문제 4.
--사원 테이블에서 commission_pct(커미션) 컬럼이 null이 아닌 사람들의
--department_id(부서별) salary(월급)의 평균, 합계, count를 구합니다.
--조건 1) 월급의 평균은 커미션을 적용시킨 월급입니다.
--조건 2) 평균은 소수 2째 자리에서 절삭 하세요.
 
select department_id as 부서,
       trunc(avg(salary+(salary*commission_pct)),2) as "부서별 월급 평균",
       sum(salary) as "부서별 월급 합계",
       count(salary) as "부서별 사원수"
from employees
where commission_pct is not null
group by department_id;