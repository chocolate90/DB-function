--숫자 함수
-- round (반올림)
select 45.923 from dual;
select round(45.923, 2), round(45.923), round(45.923, 0), round(45.923, -1) from dual;


--trunc (절삭)
select trunc(45.923, 2), trunc(45.923), trunc(45.923, 0), trunc(45.923, -1) from dual;


--ads (절대값)
select abs(-45) from dual;


--ceil (올림), floor (내림)
select ceil(3.14), floor(3.14) from dual;


--mod (나머지)
select 10/2, mod(10, 2) from dual;
