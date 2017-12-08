CREATE SCHEMA gradecalculator;

USE gradecalculator;

CREATE TABLE account (
  accountid INT NOT NULL AUTO_INCREMENT,
  lastname VARCHAR(25) NOT NULL,
  firstname VARCHAR(25) NOT NULL,
  email VARCHAR(30) NOT NULL,
  password VARCHAR(20) NOT NULL,
  PRIMARY KEY (accountid),
  UNIQUE INDEX email_UNIQUE (email ASC));
  
CREATE TABLE gradetype (
  gradetypeid INT NOT NULL AUTO_INCREMENT,
  letter CHAR(1) NOT NULL,
  pointindex FLOAT NOT NULL,
  PRIMARY KEY (gradetypeid));

CREATE TABLE semester (
  semesterid INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(20) NOT NULL,
  PRIMARY KEY (semesterid));
  
CREATE TABLE grade (
  gradeid INT NOT NULL AUTO_INCREMENT,
  accountid INT NOT NULL,
  year INT NOT NULL,
  semesterid INT NOT NULL,
  coursename VARCHAR(50) NOT NULL,
  gradetypeid INT NOT NULL,
  credits INT NOT NULL,
  PRIMARY KEY (gradeid),
  INDEX accountid_idx (accountid ASC),
  INDEX semesterid_idx (semesterid ASC),
  INDEX gradetypeid_idx (gradetypeid ASC),
  CONSTRAINT accountid_FK
    FOREIGN KEY (accountid)
    REFERENCES account (accountid)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT semesterid_FK
    FOREIGN KEY (semesterid)
    REFERENCES semester (semesterid)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT gradetypeid_FK
    FOREIGN KEY (gradetypeid)
    REFERENCES gradetype (gradetypeid)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT);

INSERT INTO account (lastname, firstname, email, password) VALUES ('Doe', 'John', 'johndoe@here.there', '123456789');
INSERT INTO account (lastname, firstname, email, password) VALUES ('Doe', 'Jane', 'janedoe@rain.bow', '111111111');

INSERT INTO gradetype (letter, pointindex) VALUES ('A', '4');
INSERT INTO gradetype (letter, pointindex) VALUES ('B', '3');
INSERT INTO gradetype (letter, pointindex) VALUES ('C', '2');
INSERT INTO gradetype (letter, pointindex) VALUES ('D', '1');
INSERT INTO gradetype (letter, pointindex) VALUES ('F', '0');

INSERT INTO semester (name) VALUES ('Spring');
INSERT INTO semester (name) VALUES ('Summer');
INSERT INTO semester (name) VALUES ('Fall');

INSERT INTO grade (accountid, year, semesterid, coursename, gradetypeid, credits) VALUES ('1', '2016', '1', 'C', '1', '3');
INSERT INTO grade (accountid, year, semesterid, coursename, gradetypeid, credits) VALUES ('1', '2016', '3', 'C++', '2', '3');
INSERT INTO grade (accountid, year, semesterid, coursename, gradetypeid, credits) VALUES ('1', '2017', '1', 'C#', '2', '3');
INSERT INTO grade (accountid, year, semesterid, coursename, gradetypeid, credits) VALUES ('1', '2017', '2', 'Java', '1', '4');
