
/*
DECLARE
TYPE FIRSTTYPE IS RECORD
(A VARCHAR,B CHAR(7),C NUMBER);

--A, B, C�� ���� �� �ִ� FIRSTTYPE�̶�� ��������� ���������.
--���̺��� ������ Ÿ�԰� �����ϰ� ���־�� �Ѵ�.
--������ �ϳ��ϳ� ���߱�� ���ŷӱ� ������ �Ʒ� �ڵ�ó�� ����� �����ش�.
*/

DECLARE
TYPE FIRSTTYPE IS RECORD
(A ���.�����%TYPE, B ���.����%TYPE, C ���.�޿�%TYPE);

CUS FIRSTTYPE;
--������ ���� TYPE FIRSTTYPE�� �Ȱ��� ���� CUS�� ���������. ������ �����ؼ� ����ϴ� ����
--CUS��� ������ �����ؼ� FIRSTTYPE�� �����͸� �־��ش�.

BEGIN
SELECT �����,����,�޿� INTO CUS FROM ��� WHERE �����ȣ=2001;
--�� �����͸� CUS ������ �ִ´�.

DBMS_OUTPUT.PUT_LINE('�����  ����  �޿�');
DBMS_OUTPUT.PUT_LINE('------------------');
DBMS_OUTPUT.PUT_LINE(CUS.A||'  '||CUS.B||'  '||TO_CHAR(CUS.C));
--����ȭ ���� ������ ������ �����. �׷��� TO_CHAR�� ����ؼ� ���ڷ� �ٲپ�� �Ѵ�.
DBMS_OUTPUT.PUT_LINE('������ �����: '||USER||'�Դϴ�');
--USER : �ý��� ����. LEE�� �α��������� LEE�� ����. KIM���� �α��������� KIM�� ����.
DBMS_OUTPUT.PUT_LINE('������ �ð�: '||TO_CHAR(SYSDATE,'YYYY-MM-DD HH:MI:SS'));

END;





















