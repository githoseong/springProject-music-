create table board (
	idx int not null auto_increment,  /*게시글의 고유번호*/
	title varchar(100) not null,			/*게시글의 글 제목*/
	content text not null,						/*글 내용*/
	wDate datetime default now(),			/*글 올린 날짜*/
	readNum	int default 0,						/*글 조회수*/
	good int default 0,								/*좋아요 횟수 누적처리*/
	mid varchar(20) not null,					/*회원 아이디(게시글 조회시 사용)*/
	fName			varchar(200) not null,	/* 처음 업로드할때의 파일명 */
  fSName		varchar(200) not null,	/* 파일서버에 저장되는 실제파일명 */
  fSize			int,										/* 총 파일 사이즈 */
	genre varchar(5) not null,
	style varchar(5) not null,
	primary key(idx)
);

desc board

drop table board

select * from board;

select count(*) from board where genre = '기타' and style = '기타';

create table boardReply (
	idx int not null auto_increment,  /*댓글의 고유번호*/
	boardIdx int not null,            /*원본 글의 고유번호(외래키로 지정함)*/
	mid varchar(20) not null,         /*댓글 쓴 사람의 아이디(같은닉네임이 있을수도 있기때문에 혼동하지 않기위해)*/
	wDate datetime default now(),	    /*댓글 쓴 날짜*/
	content text not null,			  /*댓글 내용*/
	level int not null default 0,     /*댓글레벨 - 부모댓글의 레벨은 0*/
	levelOrder int not null default 0, /*댓글의 순서 - 부모댓글의 levelOrder은 0*/
	
	
	primary key(idx),                  /*주키(기본키)는 idx*/
	foreign key(boardIdx) references board(idx) /*board테이블의 idx를 boardReply2테이블의 외래키(boardIdx)로 설정했다.*/
	/*on update cascade                  원본테이블에서의 주키의 변경에 영향을 받는다.*/
	/*on delete restrict								 원본테이블에서의 주키를 삭제시키지 못하게 한다.(삭제시 에러를 발생하게 해서 원본키 삭제 불가하게)ex)댓글이있으면 게시글 삭제못하게*/

);

select newUpload.idx,newUpload.title,newUpload.artist from newUpload,music where music.mid = 'hs1234' and newUpload.idx > 5 order by idx limit 1;
select newUpload.* from newUpload,music where music.mid = 'hs1234' and newUpload.idx = music.idx and newUpload.idx > 10 order by idx limit 1;
select * from newUpload n,music m where m.mid = 'hs1234' and n.idx=m.idx order by m.idx;
select newUpload.* from newUpload,music where music.mid = 'hs1234' and newUpload.idx = music.idx and newUpload.idx >= 4 order by idx limit 1;