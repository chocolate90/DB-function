--���� 1.
--EMPLOYEES ���̺� ���� �̸� , �Ի����� �÷����� �����ؼ� �̸������� �������� ��� �մϴ�
--���� 1) �̸� �÷��� first_name , last_name �� �ٿ��� ����մϴ�
--���� 2) �Ի����� �÷��� xx/xx/xx �� ����Ǿ� �ֽ��ϴ� xxxxxx ���·� �����ؼ� ����մϴ�

select concat(concat(first_name, ' '), last_name) as name,
     --concat(first_name || ' ', last_name) as name
       replace(hire_date, '/', '') as hire_date
from employees
order by name asc;

--���� 2.
--EMPLOYEES ���̺� ���� phone_number �÷��� ###.###.#### ���·� ���·� ����Ǿ� �ִ�
--���⼭ ó�� �� �ڸ� ���� ��� ���� ������ȣ(02) �� �ٿ� ��ȭ ��ȣ�� ����ϵ��� ������ �ۼ��ϼ���.

select phone_number, 
       replace(phone_number, substr(phone_number, 1, 3), '(02)' ) as phone_number
from employees;

select concat('(02)', substr(phone_number, 4, length(phone_number))) from employees;

--���� 3.
--EMPLOYEES ���̺��� JOB_ID �� it_prog �� ����� �̸�(first_name) �� �޿�(salary)�� ����ϼ���
--���� 1) ���ϱ� ���� ���� �ҹ��ڷ� �Է��ؾ� �մϴ� (��Ʈ : lower �̿�)
--���� 2) �̸��� �� 3 ���ڱ��� ����ϰ� �������� *�� ����մϴ� .
--�� ���� �� ��Ī�� name �Դϴ� (��Ʈ : rpad �� substr �Ǵ� substr �׸��� length �̿�)
--���� 3) �޿��� ��ü 10 �ڸ��� ����ϵ� ������ �ڸ��� *�� ����մϴ� .
--�� ���� �� ��Ī�� salary �Դϴ� (��Ʈ : lpad �̿�)

select rpad(substr(first_name, 1, 3), length(first_name), '*') as name,
       lpad(salary, 10, '*') as salary
from employees
where lower(job_id) = 'it_prog';


