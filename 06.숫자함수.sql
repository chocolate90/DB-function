--���� �Լ�
-- round (�ݿø�)
select 45.923 from dual;
select round(45.923, 2), round(45.923), round(45.923, 0), round(45.923, -1) from dual;


--trunc (����)
select trunc(45.923, 2), trunc(45.923), trunc(45.923, 0), trunc(45.923, -1) from dual;


--ads (���밪)
select abs(-45) from dual;


--ceil (�ø�), floor (����)
select ceil(3.14), floor(3.14) from dual;


--mod (������)
select 10/2, mod(10, 2) from dual;
