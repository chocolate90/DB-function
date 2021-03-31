--�� ��ȯ �Լ� TO_CHAR TO_DATE TO_NUMBER

--TO_CHAR (��¥�� ���ڷ� ���� OR ���ڸ� ���ڷ� ����)

--to_char(date,'pmt') ��¥�� ���ڷ� (YY-MM-DD HH:MI:SS)
select to_char(sysdate) from dual;
select to_char(sysdate,'YYYY"��"MM"��"DD"��"') from dual;-- (-,/,:,(����)�ܿ� �ٸ� ���ڴ� ""������ ���Ұ��� )
select to_char(sysdate,'YYYY-MM-DD') from dual; -- (-,/,:,(����)��""������ ��밡�� )
select to_char(sysdate, 'YY-MM-DD HH:MI:SS') from dual; 

select first_name, hire_date from employees;
select first_name, to_char(hire_date,'YYYY-MM-DD') from employees;


-- to_char(hire_date,'YYYY-MM-DD')�̷��� ���� ���� ��û ����.
select first_name , to_char(hire_date , 'YY-MM-DD HH24:mi:ss') from employees;
select first_name , to_char(hire_date, 'YYYY"��" MM"��" DD"��"')from employees;


--to_char(number,'pmt') ���ڸ� ���ڷ� (9,.,,)
select to_char(20000,'99999') from dual;  --9�� �ڸ��� (�ſ��߿�) (�ڸ����� �����ϰ� �ָ� ####���� ��µȴ�.)
select to_char(20000.14,'99999.99') from dual; -- .�� �Ҽ��� �ڸ��� �ǹ�
select to_char(20000.14 , '99,999.99') from dual; -- ,�� �޸��� ǥ�� ����
select to_char(20000.14 , 'L99,999.99') from dual; --L�� ����ȭ�� ��ȣ ǥ�� ����
select to_char(20000.14 , '$99,999.99')from dual; -- �޷��� �׳� $ �����ָ��.

select first_name,to_char(salary,'$999,999.99') from employees;


--to number(����, ��������) - ���ڸ� ���ڷ� (����ǥ���Ŀ��� �������� �ʴ� ������ �ٲ� �� ����.)
select '2000' + 2000 from dual; --��� ������ ���ڿ��� ���ڷ� �ڵ�����ȯ�� ���� 
select to_number('2000')+2000 from dual;  --�� �� ������(?,��������?) ǥ��


-- select '$3,300'+ 2000 from dual; $��ȣ������ ����ȯ�� �ȵ�
select to_number('$3,300' , '$9,999')+2000 from dual; -- ���� ����ǥ�������� $��ȣ�� ������ �ٽ� ������ �߻���Ŵ


--TO_DATE(����, ��¥ǥ������) - ���ڸ� ��¥��
select to_date('2021-03-31') from dual; --��¥������ ���ڶ�� fmt�� ���� �ʴ��� �����ϴ�.
select sysdate - to_date('2021-03-25') from dual; --�ϼ�

select to_date('2021/03/25', 'YYYY/MM/DD') from dual;
select to_date('2021/03/25 14:51:24', 'YYYY/MM/DD HH24:MI:SS') from dual;

-- '20201130', '20201111' ��¥ ����
select to_date(20201130) - to_date(20201111) from dual;

-- xxxx��xx��xx�Ϸ� ���
select '20051002' from dual;
select to_char(to_date('20051002'), 'YYYY"��"MM"��"DD"��"') from dual;


--NVL(�÷�, NULL�ϰ�� ��ȯ�Ұ�) - �ڡڡڡڡ�
select nvl(200,0), nvl(null, 0) from dual;
select first_name, nvl(commission_pct,0) as commission_pct from employees;


--NVL2(�÷�, NULL�� �ƴ� ����� ��, NULL�� ����� ��) - �ڡڡڡڡ�
select nvl2(null, 'null�� �ƴ�', 'null��') from dual;
select first_name,
       salary,
       commission_pct,
       nvl2(commission_pct, salary + (salary*commission_pct), salary)
from employees;

--DECODE(�÷�, ��, ���, ��, ���, default) - �ڡڡڡڡ�
select decode('C', 'A', 'A�Դϴ�', 'B', 'B�Դϴ�', 'C', 'C�Դϴ�', '���� �ƴմϴ�') from dual;

select first_name,
       salary,
       job_id,
       decode(job_id, 'IT_PROG', salary * 0.5, 'AD_VP', salary*0.4, salary*0.1) as bonus
from employees;


--CASE �÷� WHEN �� THEN ��� END
select first_name,
       salary,
       job_id,
       (case job_id when 'IT_PROG' THEN salary * 0.5
                    when 'AD_VP' THEN salary * 0.4
                    else salary * 0.1
        end) as bonus
from employees;