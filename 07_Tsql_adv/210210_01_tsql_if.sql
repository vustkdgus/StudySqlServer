DECLARE @var1 int; --��������
SET @var1 = 100;

IF @var1 = 100
  BEGIN
    PRINT '@var1�� 100�̴�';
  END
ELSE
  BEGIN
    SELECT '@var1�� 100�� �ƴϴ�';
  END