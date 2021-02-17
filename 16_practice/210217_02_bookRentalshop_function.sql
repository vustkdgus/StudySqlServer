--사용자 레벨 리턴 함수
 create or alter function ufn_getLevel
 (@levels char(1))
 returns nvarchar(10)
 as
 begin
	declare @result nvarchar(10); -- gold,silve,bronze,iron 회원 등 변수
	
	set @result =	case @levels
						when 'A' then 'GOLD'
						when 'B' then 'SILVER'
						when 'C' then 'BRONZE'
						when 'D' then 'IRON'
						when 'S' then 'ADMINISTER'
						else '비회원'
					end;
		return @result;
end
go

