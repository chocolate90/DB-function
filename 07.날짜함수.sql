--��¥ �Լ�
select sysdate from dual; --���� (�Ϲ����� ����� ����.)
select systimestamp from dual; --�ú��ʱ���


--��¥�� ������ �����ϴ�.
select sysdate - hire_date from employees;
select (sysdate - hire_date)/7 from employees; --����
select (sysdate - hire_date)/365 from employees; --���
select trunc((sysdate - hire_date)/365) from employees;


--��¥���� trunc, round ������ �����ϴ�.
select round(sysdate) from dual;
select round(sysdate, 'year') from dual; --�� �������� �ݿø�
select round(sysdate, 'month')from dual; --�� �������� �ݿø�
select round(sysdate, 'day') from dual; --�� �������� �ݿø�(�ش� ���� �Ͽ��ϳ�¥ ����)

select trunc(sysdate) from dual;
select trunc(sysdate, 'year') from dual; --�� �������� ����
select trunc(sysdate, 'month') from dual; --�� �������� ����
select trunc(sysdate, 'day') from dual; --�� �������� ����(�ش� ���� �Ͽ��ϳ�¥ ����)
