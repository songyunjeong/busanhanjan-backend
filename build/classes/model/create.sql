create table user_info (
	username	varchar2(15),
	id			varchar2(15),
	pwd			varchar2(20),
	email		varchar2(25)
);

insert into user_info values ('송윤정', 'songyunjeong', '6789', 'songyunjeong@naver.com');

commit;

select * from user_info;