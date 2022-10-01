create table ask (
	idx int not null auto_increment,   
	mid varchar(20) not null,    /*올린이 아이디*/
	name varchar(20) not null,   /*올린이 이름*/
	title varchar(100) not null,  /*문의 제목*/
	askDate datetime default now(), /*문의 보낸 날짜*/
	content text,                 /* 글 내용*/
	answer char(5) default 'NO',   /*문의 답변 여부*/
	primary key(idx)             /*기본키 : 자료파일의 고유번호*/
);

show tables;

select * from boardAsk;
select * from boardAskComment;
desc boardAskComment

create table askComment (
	idx int not null auto_increment,  /*댓글의 고유번호*/
	askIdx int not null,            /*원본 글의 고유번호(외래키로 지정함)*/
	mid varchar(20) not null,         /*댓글 쓴 사람의 아이디(같은닉네임이 있을수도 있기때문에 혼동하지 않기위해)*/
	name varchar(20) not null,    /*댓글 쓴 사람의 이름*/
	wDate datetime default now(),	    /*댓글 쓴 날짜*/
	content text not null,						/*댓글 내용*/
	
	primary key(idx),                  /*주키(기본키)는 idx*/
	foreign key(askIdx) references ask(idx)); /*board테이블의 idx를 boardReply테이블의 외래키(boardIdx)로 설정했다.*/
);

drop table askComment;
select * from askComment where askIdx = 4;