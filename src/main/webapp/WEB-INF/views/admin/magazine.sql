create table magazine (
  idx  int not null auto_increment,	
  title  varchar(50) not null,					/* 제목 */
  topic varchar(10) not null,					/*주제*/
  fName			varchar(200) not null,	/* 처음 업로드할때의 파일명 */
  fSName		varchar(200) not null,	/* 파일서버에 저장되는 실제파일명 */
  fSize			int,										/* 총 파일 사이즈 */
  fDate  		datetime default now(),	/* 글 쓴 날짜 */
  readNum		int default 0,					/* 조회수 */
  good int default 0,								/*좋아요 수*/	
  content		text,									/* 파일 상세설명 */
  primary key (idx)							/* 기본키 : 자료파일의 고유번호 */
);

create table magazineComment (
	idx int not null auto_increment,  /*댓글의 고유번호*/
	magazineIdx int not null,            /*원본 글의 고유번호(외래키로 지정함)*/
	mid varchar(20) not null,         /*댓글 쓴 사람의 아이디(같은닉네임이 있을수도 있기때문에 혼동하지 않기위해)*/
	name varchar(20) not null,    /*댓글 쓴 사람의 이름*/
	wDate datetime default now(),	    /*댓글 쓴 날짜*/
	content text not null,						/*댓글 내용*/
	
	primary key(idx),                  /*주키(기본키)는 idx*/
	foreign key(magazineIdx) references magazine(idx)); /*board테이블의 idx를 boardReply테이블의 외래키(boardIdx)로 설정했다.*/
);

select count(magazineComment.idx) cnt from magazine,magazineComment where magazine.idx = magazineComment.magazineIdx and magazine.idx = 3;
