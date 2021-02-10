DECLARE @var1 int; --변수선언
SET @var1 = 100;

IF @var1 = 100
  BEGIN
    PRINT '@var1이 100이다';
  END
ELSE
  BEGIN
    SELECT '@var1이 100이 아니다';
  END