create table video (
  idx  int not null auto_increment,	
  title  varchar(20) not null,					/* 제목 */
  artist 	varchar(20) not null,		/* 아티스트 */
  time1			varchar(20) not null,	/* 재생시간 */
  release1		int not null,	/* 발매일 */
  link varchar(400) not null,   /*유튜브 동영상 링크*/
  fName			varchar(200) not null,	/* 처음 업로드할때의 파일명 */
  fSName		varchar(200) not null,	/* 파일서버에 저장되는 실제파일명 */
  fSize			int,										/* 총 파일 사이즈 */
  fDate  		datetime default now(),	/* 파일 업로드한 날짜 */
  readNum		int default 0,					/* 조회수 */
  good int default 0,								/*좋아요 수*/	
  content		text,									/* 파일 상세설명 */
  primary key (idx)							/* 기본키 : 자료파일의 고유번호 */
);

drop table video;

select * from video order by release1 desc;

select * from newUpload where idx > 74 and idx = 79 limit 1;