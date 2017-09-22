================================================================================ pichumor

-- wtf nsfw animals gif funny 각각 생성
CREATE TABLE picboard_funny(
	cont_id NUMBER(5) PRIMARY KEY, -- seq 
  user_id NUMBER(20) NOT NULL, -- session
  user_name VARCHAR2(20) NOT NULL, -- session
	user_provider VARCHAR2(20) NOT NULL, -- session
	cont_title VARCHAR2(500) NOT NULL,
  cont_tag VARCHAR2(500) NOT NULL,
	cont_image CLOB NOT NULL,
	cont_view_count NUMBER(9) DEFAULT 0 NOT NULL,
	cont_date DATE DEFAULT SYSDATE NOT NULL
--  PRIMARY KEY (user_id, cont_id)
-- http://blog.naver.com/soul3532/100029064455 참고해서 나중에 추가
);

-- wtf nsfw animals gif funny 각각 생성
CREATE TABLE picboard_funny_cmt(
    cmt_id NUMBER(5) PRIMARY KEY, --덧글의 글번호 seq
    user_id NUMBER(20) NOT NULL, -- 작성자 ${session.id}
    user_name  VARCHAR2(30) NOT NULL, -- 작성자 ${session.name}
    user_provider VARCHAR2(20) NOT NULL, -- 
    user_image CLOB NOT NULL,
    cmt_contents VARCHAR2(500) NOT NULL,
    cmt_cont_group NUMBER, -- 덧글 그룹. 원글의 con_id를 넣는다.
    cmt_in_group NUMBER, -- 덧글 내에서의 그룹 // 나중에 덧글의 덧글 추가할때 사용
    cont_date DATE DEFAULT SYSDATE NOT NULL
);

CREATE SEQUENCE picboard_wtf_seq;
CREATE SEQUENCE picboard_nsfw_seq;
CREATE SEQUENCE picboard_animals_seq;
CREATE SEQUENCE picboard_gif_seq;
CREATE SEQUENCE picboard_funny_seq;

CREATE SEQUENCE picboard_wtf_cmt_seq;
CREATE SEQUENCE picboard_nsfw_cmt_seq;
CREATE SEQUENCE picboard_animals_cmt_seq;
CREATE SEQUENCE picboard_gif_cmt_seq;
CREATE SEQUENCE picboard_funny_cmt_seq;
