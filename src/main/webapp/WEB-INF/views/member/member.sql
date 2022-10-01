create table member (
	idx int not null auto_increment primary key,
	name varchar(20) not null,
	mid varchar(20) not null, unique
	pwd varchar(200) not null,
	age varchar(20) not null,
	email varchar(50) not null,
	tel int default 0,
	photo			varchar(100) default 'noimage.jpg',
	address varchar(100) default '등록안함',
	money int default 30000,         /*갖고 있는 돈*/
	level int default 1,						/*운영자=0 준회원=1 정회원=2 우수회원=3*/
	userDel char(2) default 'NO',   /*탈퇴신청 여부*/
	vCount int default 0,   /*총 방문횟수*/   
  todayCnt	int default 0,  /*오늘방문횟수*/
	startDate datetime default now(),		/* 최초 가입일 */
  lastDate 	datetime default now()		/* 마지막 접속일 */
  downNum int default 0,		/*음악 다운 수*/
  moneyTotal int default 0  /*총 사용 금액*/
);

show tables;

