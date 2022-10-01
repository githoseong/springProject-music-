show tables

create table newUpload (
  idx  int not null auto_increment,	
  title  varchar(20) not null,					/* 제목 */
  artist 	varchar(20) not null,		/* 아티스트 */
  genre			varchar(20) not null,	/* 장르 */
  country		varchar(20) not null,	/* 나라 */
  time1			varchar(20) not null,	/* 재생시간 */
  release1		int not null,	/* 발매일 */
  fName			varchar(200) not null,	/* 처음 업로드할때의 파일명 */
  fSName		varchar(200) not null,	/* 파일서버에 저장되는 실제파일명 */
  fName2			varchar(200) not null,	
  fSName2		varchar(200) not null,	
  fSize			int,										/* 총 파일 사이즈 */
  fDate  		datetime default now(),	/* 파일 업로드한 날짜 */
  downNum		int default 0,					/* 파일 다운로드 횟수 */
  content		text,									/* 파일 상세설명 */
  primary key (idx)							/* 기본키 : 자료파일의 고유번호 */
);

drop table newUpload;

desc newUpload
insert into newUpload values(default,#{vo.title},#{vo.artist},#{vo.genre},#{vo.country},#{vo.time1},#{vo.release1},#{vo.fName},#{vo.fSName},#{vo.fSize},default,default,#{vo.content})
vo : UploadVO(idx=0, title=가, artist=나, genre=다, country=라, time1=마, release1=2, fName=111.mp3/, fSName=2022610330590_111.mp3/, fSize=4494137, fDate=null, downNum=0, content=바)
insert into newUpload values(default,'가','나','다','라','마',2,'111.mp3/','2022610330590_111.mp3/',4494137,default,default,'바')
insert into newUpload values(default,'a','a','a','a','a',123,'a','a',12,default,default,'a')
select * from newUpload;

create table music (
	musicidx  int not null auto_increment primary key, /*회원의음악고유번호*/
	mid varchar(20) not null,	/*회원고유번호*/
	idx  int not null, /*음악고유번호*/
	keep char(5) not null,     /*내음악리스트에 추가,제거*/
	foreign key(mid) references member(mid) on update cascade,
  foreign key(idx) references newUpload(idx) on update cascade
);

select * from newUpload,music where music.mid = 'hs1234';
select * from newUpload n,music m where m.mid = 'hs1234';
select * from newUpload n,music m where m.mid = 'hs1234' and n.idx=m.idx;
select * from newUpload n,music m where m.mid = 'hs1234' and n.idx=m.idx group by m.idx;
select * from newUpload n;
select * from music m;
select n.title,n.artist from newUpload n inner join  music m where m.mid = 'hs1234' group by m.idx;

update music set keep = 'NO' where idx = 3 and mid = 'hs1234';

select * from newUpload n,music m where m.mid = 'hs1234' and n.idx=m.idx and m.keep = 'OK' order by m.idx;
select newUpload.* from newUpload,music where music.mid = 'hs1234' and newUpload.idx = music.idx and  40 >= newUpload.idx  order by idx desc limit 1;