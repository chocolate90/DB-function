--���� ���� �Լ�
--dual�� ���� ���̺�

-- lower, upper, initcap
select 'hello world' from dual;

select lower('hello WORLD'), upper('hello wolrd'), initcap('hello world') FROM dual;

select lower(first_name), upper(first_name), initcap(first_name) from employees;


--�Լ��� where ���������� �� �� �ִ�.
select * from employees where lower(first_name) = 'ellen';


--length ���ڿ� ����, instr ���ڿ� ã��
select length('abcdef') as ����, instr('abcdef', 'a') from dual;

select first_name, length(first_name), instr(first_name, 'a') from employees;


--concat ���ڿ� ���̱�, substr ���ڿ� �ڸ���
select concat('hello', 'world') from dual;
select concat(concat('hello', ' '), 'world') from dual;
select 'hello ' || 'world' from dual;

select substr('abcdef', 2, 5) from dual;

select first_name, 
       concat(first_name, last_name),
       substr(first_name, 1, 3) 
from employees;


--lpad, rpad �¿��� ������ ���ڿ��� ä���
select lpad('abc', 10, '*') from dual; --�ִ� 10�ڸ����� ���� �κ��� *�� ä���.
select rpad('abc', 10, '*') from dual; 


--ltrim, rtrim, trim ��������
select ltrim('     hello world     ') from dual;
select rtrim('     hello world     ') from dual;
select trim('   hello world   ') from dual;


--replace ���ڿ� �ٲٱ�
select replace('my dream is president', 'president', 'teacher') from dual;
select replace('my dream is president', ' ', '') from dual;

select replace(replace('my dream is president', 'president', 'teacher'), ' ', '') as test from dual;

select replace(concat(first_name || ' ', last_name), ' ' , '') as test1 from employees;