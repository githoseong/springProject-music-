create table banner (
  idx  int not null auto_increment,	
  fName			varchar(200) not null,	/* 처음 업로드할때의 파일명 */
  fSName		varchar(200) not null,	/* 파일서버에 저장되는 실제파일명 */
  fName2			varchar(200) not null,	/* 처음 업로드할때의 파일명 */
  fSName2		varchar(200) not null,	/* 파일서버에 저장되는 실제파일명 */
  fName3			varchar(200) not null,	/* 처음 업로드할때의 파일명 */
  fSName3		varchar(200) not null,	/* 파일서버에 저장되는 실제파일명 */
  fDate  		datetime default now(),	/* 파일 업로드한 날짜 */
  flag char(2) default 'NO',
  primary key (idx)							/* 기본키 : 자료파일의 고유번호 */
);

drop table banner

desc banner;

select * from banner limit 1;
select * from banner order by idx limit 1;

select max(downNum) from member;