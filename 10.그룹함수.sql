--�׷��Լ� sum, avg, max, min, count (�Ϲ� �÷��� �Բ� ����� �� ����.)
 
 select count(*) from employees; --��ü �� ��
 select count(commission_pct) from employees; --commission_pct�� null�� �ƴ� �� ��
 select count(manager_id) from employees;
 
 select sum(salary), trunc(avg(salary)), min(salary), max(salary), count(salary) from employees;
 
 select sum(salary) from employees where department_id = 50; --�μ��� 50�� ������� �޿� ��
 
 
 --group by��
 
 select * from employees;
 
 select job_id from employees group by job_id; --job_id�� �׷���
 
 --group by������ �׷��Լ��� ����� ����
 select job_id, avg(salary) from employees group by job_id; --job_id�� �޿� ���
 
 select department_id,
        avg(salary),
        sum(salary),
        count(salary)
from employees
group by department_id;


--������ ��
-- �׷����� ���� ������ �׷��Լ��� �Ϲ� �÷��� ���ÿ� ������� ���Ѵ�.
select count(*), salary from employees; -- ����

-- group by���� ����� �� group���� ������ ������ �ٸ� �÷� ��ȸ�� �� �� ����.
select job_id from employees group by department_id; -- ����


--2�� �̻��� group by��
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


--group by���� ���� having (where���� �Ϲ��࿡ ���� ����)
select department_id, sum(salary)
from employees
group by department_id
having sum(salary) > 100000;


--job_id�� ������ 5 �̻�
select job_id, count(*)
from employees
group by job_id
having count(*) >= 5
order by count(*) desc;


--�μ����̵� 50�̻��� ���� �׷����ϰ� �׷� ����� 5000�̻� ��ȸ, ����

select department_id, trunc(avg(salary)) as �μ���ձ޿� 
from employees
where department_id >= 50
group by department_id
having avg(salary) >= 5000
order by �μ���ձ޿� desc;


--count(*) over() �׷�ȭ ���� �ʾƵ�, ���������� �� ���� ���� �ٿ��� ��ȸ�ϴ� �����̴�.
select department_id, first_name, count(*) over() from employees;


--��������

--���� 1.
--��� ���̺��� JOB_ID�� ��� ���� ���ϼ���.
--��� ���̺��� JOB_ID�� ������ ����� ���ϼ���. ������ ��� ������ �������� �����ϼ���

select job_id, count(job_id), avg(salary) as �������
from employees
group by job_id
order by ������� desc;

--���� 2.
--��� ���̺��� �Ի� �⵵ �� ��� ���� ���ϼ���.

select to_char(hire_date, 'YY'), count(hire_date)
from employees
group by to_char(hire_date, 'YY');

--���� 3.
--�޿��� 1000 �̻��� ������� �μ��� ��� �޿��� ����ϼ���. �� �μ� ��� �޿��� 2000�̻��� �μ��� ���

select department_id, trunc(avg(salary)) as ��ձ޿�
from employees
where salary >= 1000
group by department_id
having avg(salary) >= 2000
order by ��ձ޿� desc;

--���� 4.
--��� ���̺��� commission_pct(Ŀ�̼�) �÷��� null�� �ƴ� �������
--department_id(�μ���) salary(����)�� ���, �հ�, count�� ���մϴ�.
--���� 1) ������ ����� Ŀ�̼��� �����Ų �����Դϴ�.
--���� 2) ����� �Ҽ� 2° �ڸ����� ���� �ϼ���.
 
select department_id as �μ�,
       trunc(avg(salary+(salary*commission_pct)),2) as "�μ��� ���� ���",
       sum(salary) as "�μ��� ���� �հ�",
       count(salary) as "�μ��� �����"
from employees
where commission_pct is not null
group by department_id;