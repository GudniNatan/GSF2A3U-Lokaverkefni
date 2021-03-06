/* 1 */

DROP SCHEMA IF EXISTS `1803982879_GSF2A3U_Lokaverkefni`;

CREATE SCHEMA IF NOT EXISTS `1803982879_GSF2A3U_Lokaverkefni`;

USE `1803982879_GSF2A3U_Lokaverkefni`;

CREATE TABLE IF NOT EXISTS PRICE(
	PRICE_CODE INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	PRICE_DESCRIPTION VARCHAR(255),
	PRICE_RENTFEE DECIMAL(6, 2),
	PRICE_DAILYLATEFEE DECIMAL(6, 2)
);

CREATE TABLE IF NOT EXISTS MOVIE(
	MOVIE_NUM INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    MOVIE_TITLE VARCHAR(255),
    MOVIE_YEAR INT,
    MOVIE_COST DECIMAL(6, 2),
    MOVIE_GENRE VARCHAR(255),
    PRICE_CODE INT,
    FOREIGN KEY (PRICE_CODE) REFERENCES PRICE(PRICE_CODE)
);

ALTER TABLE MOVIE AUTO_INCREMENT = 1234;

CREATE TABLE IF NOT EXISTS VIDEO(
	VID_NUM INT PRIMARY KEY NOT NULL,
    VID_INDATE DATE,
    MOVIE_NUM INT,
    FOREIGN KEY (MOVIE_NUM) REFERENCES MOVIE(MOVIE_NUM)
);

CREATE TABLE IF NOT EXISTS MEMBERSHIP(
	MEM_NUM INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    MEM_FNAME VARCHAR(255),
    MEM_LNAME VARCHAR(255),
    MEM_STREET VARCHAR(255),
    MEM_CITY VARCHAR(255),
    MEM_STATE CHAR(2),
    MEM_ZIP INT,
    MEM_BALANCE DECIMAL(6, 2)
);

ALTER TABLE MEMBERSHIP AUTO_INCREMENT = 102;


CREATE TABLE IF NOT EXISTS RENTAL(
	RENT_NUM INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    RENT_DATE DATE,
    MEM_NUM INT,
    FOREIGN KEY (MEM_NUM) REFERENCES MEMBERSHIP(MEM_NUM)
);

ALTER TABLE RENTAL AUTO_INCREMENT = 1001;


CREATE TABLE IF NOT EXISTS DETAILRENTAL(
	RENT_NUM INT NOT NULL,
    VID_NUM INT NOT NULL,
    DETAIL_FEE DECIMAL(6, 2),
    DETAIL_DUEDATE DATE,
    DETAIL_RETURNDATE DATE,
    DETAIL_DAILYLATEFEE DECIMAL(6, 2),
    PRIMARY KEY (RENT_NUM, VID_NUM),
    FOREIGN KEY (RENT_NUM) REFERENCES RENTAL(RENT_NUM),
    FOREIGN KEY (VID_NUM) REFERENCES VIDEO(VID_NUM)
);


/* 2 */

INSERT INTO MEMBERSHIP(MEM_FNAME, MEM_LNAME, MEM_STREET, MEM_CITY, MEM_STATE, MEM_ZIP, MEM_BALANCE)
VALUES
('Tami', 'Dawson', '2632 Takli Circle', 'Norene', 'TN', 37136, 11),
('Curt', 'Knight', '4025 Cornell Court', 'Flatgap', 'KY', 41219, 6),
('Jamal', 'Melendez', '788 East 145th Avenue', 'Quebeck', 'TN', 38579, 0),
('Iva', 'Mcclain', '6045 Musket Ball Cicle', 'Summit', 'KY', 42783, 15.00),
('Miranda', 'Parks', '4469 Maxwell Place', 'Germantown', 'TN', 38183, 0.00),
('Rosario', 'Elliot', '7578 Danner Avenue', 'Columbia', 'TN', 38402, 5.00),
('Mattie', 'Guy', '4390 Evergreen Street', 'Lily', 'KY', 40740, 10.00),
('Clint', 'Ochoa', '1711 Elm Street', 'Greeneville', 'TN', 37745, 0.00),
('Lewis', 'Rosales', '4524 Southwild Circle', 'Counce', 'TN', 38326, 0.00),
('Stacy', 'Mann', '2789 East Cook Avenue', 'Murfreesboro', 'TN', 37132, 8.00),
('Luis', 'Trujillo', '7267 Melvin Avenue', 'Heiskell', 'TN', 37754, 3.00),
('Minnie', 'Gonzales', '6430 Vasili Drive', 'Williston', 'TN', 38076, 0.00);


INSERT INTO RENTAL(RENT_DATE, MEM_NUM)
VALUES
('2009-03-01', 103),
('2009-03-01', 105),
('2009-03-02', 102),
('2009-03-02', 110),
('2009-03-02', 111),
('2009-03-02', 107),
('2009-03-02', 104),
('2009-03-03', 105),
('2009-03-03', 111);

INSERT INTO PRICE(PRICE_DESCRIPTION, PRICE_RENTFEE, PRICE_DAILYLATEFEE)
VALUES
('Standard', 2.00, 1),
('New Release', 3.50, 3),
('Discount', 1.50, 1),
('Weekly Special', 1.00, 0.5);

INSERT INTO MOVIE(MOVIE_NUM, MOVIE_TITLE, MOVIE_YEAR, MOVIE_COST, MOVIE_GENRE, PRICE_CODE)
VALUES
(1234, 'The Cesar Family Christmas', 2007, 39.95, 'FAMILY', 2),
(1235, 'Smokey Mountain Wildlife', 2004, 59.95, 'ACTION', 1),
(1236, 'Richard Goodhope', 2008, 59.95, 'DRAMA', 2),
(1237, 'Beatnik Fever', 2007, 29.95, 'COMEDY', 2),
(1238, 'Constant Companion', 2008, 89.95, 'DRAMA', 2),
(1239, 'Where Hope Dies', 1998, 25.49, 'DRAMA', 3),
(1245, 'Time to Burn', 2005, 45.49, 'ACTION', 1),
(1246, 'What He Doesn\'t Know', 2000, 58.29, 'COMEDY', 1);


INSERT INTO VIDEO(VID_NUM, VID_INDATE, MOVIE_NUM)
VALUES
(54321, '2008-06-18', 1234),
(54324, '2008-06-18', 1234),
(54325, '2008-06-18', 1234),
(34341, '2007-01-22', 1235),
(34342, '2007-01-22', 1235),
(34366, '2009-03-02', 1236),
(34367, '2009-03-02', 1236),
(34368, '2009-03-02', 1236),
(34369, '2009-03-02', 1236),
(44392, '2008-10-21', 1237),
(44397, '2008-10-21', 1237),
(59237, '2009-02-14', 1237),
(61388, '2007-01-25', 1237),
(61353, '2006-01-28', 1239),
(61354, '2006-01-28', 1245),
(61367, '2008-07-30', 1246),
(61369, '2008-07-30', 1246);

INSERT INTO DETAILRENTAL(RENT_NUM, VID_NUM, DETAIL_FEE, DETAIL_DUEDATE, DETAIL_RETURNDATE, DETAIL_DAILYLATEFEE)
VALUES
(1001, 54321, 0.5, '2009-03-03', '2009-03-03', 4.5),
(1002, 54324, 1.0, '2009-03-05', '2009-03-05', 4.0),
(1003, 54325, 1.5, '2009-03-04', '2009-03-09', 3.5),
(1003, 44392, 1.5, '2009-03-06', '2009-03-09', 3.5),
(1003, 44397, 1.5, '2009-03-06', '2009-03-09', 3.5),
(1004, 34341, 2.0, '2009-03-05', '2009-03-07', 3.0),
(1005, 34342, 2.5, '2009-03-06', '2009-03-06', 2.5),
(1006, 34366, 3.0, '2009-03-06', '2009-03-06', 2.0),
(1007, 34367, 3.5, '2009-03-07', '2009-03-07', 1.5),
(1008, 34368, 4.0, '2009-03-07', NULL, 1.0),
(1009, 34369, 4.5, '2009-03-08', '2009-03-09', 0.5);


/* 3 */
SELECT MOVIE_TITLE, MOVIE_YEAR, MOVIE_COST
	FROM MOVIE
    WHERE MOVIE_TITLE LIKE '%hope%'
	ORDER BY MOVIE_TITLE;

/* 4 */
SELECT MOVIE_TITLE, MOVIE_YEAR, MOVIE_GENRE
	FROM MOVIE
    WHERE MOVIE_GENRE = 'ACTION';
    
/* 5 */
SELECT MOVIE_NUM, MOVIE_TITLE, MOVIE_COST
	FROM MOVIE
    WHERE MOVIE_COST > 40;
    
/* 6 */
SELECT MOVIE_NUM, MOVIE_TITLE, MOVIE_COST, MOVIE_GENRE
	FROM MOVIE
    WHERE (MOVIE_GENRE = 'ACTION' 
		OR MOVIE_GENRE = 'COMEDY')
        AND MOVIE_COST < 50.00
	ORDER BY MOVIE_GENRE;

/* 7 */
SELECT MOVIE_NUM, CONCAT(MOVIE_TITLE, ' (', MOVIE_YEAR, ')  ', MOVIE_GENRE) AS 'Movie Description'
	FROM MOVIE;

/* 8 */
SELECT MOVIE_GENRE, COUNT(MOVIE_GENRE) AS 'Number of Movies'
	FROM MOVIE
    GROUP BY MOVIE_GENRE;
    
/* 9 */
SELECT ROUND(avg(MOVIE_COST), 4) AS 'Average Movie Cost'
	FROM MOVIE;

/* 10 */
SELECT MOVIE_GENRE, ROUND(AVG(MOVIE_COST), 2) AS 'Average Cost'
	FROM MOVIE
    GROUP BY MOVIE_GENRE;
    
/* 11 */
SELECT MOVIE.MOVIE_TITLE, MOVIE.MOVIE_GENRE, PRICE.PRICE_DESCRIPTION, PRICE.PRICE_RENTFEE
	FROM MOVIE
    INNER JOIN PRICE
		ON MOVIE.PRICE_CODE = PRICE.PRICE_CODE;

/* 12 */
SELECT MOVIE.MOVIE_GENRE, ROUND(AVG(PRICE.PRICE_RENTFEE), 2)
	FROM MOVIE
    INNER JOIN PRICE
		ON MOVIE.PRICE_CODE = PRICE.PRICE_CODE
	GROUP BY MOVIE.MOVIE_GENRE;
    
/* 13 */
SELECT MOVIE.MOVIE_TITLE, MOVIE.MOVIE_YEAR, MOVIE.MOVIE_COST / PRICE.PRICE_RENTFEE AS 'Breakeven Rentals'
	FROM MOVIE
    INNER JOIN PRICE
		ON MOVIE.PRICE_CODE = PRICE.PRICE_CODE;

/* 14 */
 SELECT MOVIE_TITLE, MOVIE_YEAR
	 FROM MOVIE
	 WHERE PRICE_CODE IS NOT NULL;
 
 /* 15 */
SELECT MOVIE_TITLE, MOVIE_YEAR, MOVIE_COST
	FROM MOVIE
	WHERE MOVIE_COST BETWEEN 44.99 AND 49.99;

/* 16 */
SELECT MOVIE.MOVIE_TITLE, MOVIE.MOVIE_YEAR, PRICE.PRICE_DESCRIPTION, PRICE.PRICE_RENTFEE
	FROM MOVIE
    INNER JOIN PRICE
		ON MOVIE.PRICE_CODE = PRICE.PRICE_CODE
	WHERE MOVIE.MOVIE_GENRE IN ('FAMILY', 'COMEDY', 'DRAMA');
    
/* 17 */
SELECT MIN(MEM_BALANCE) AS 'Minimum Balance', MAX(MEM_BALANCE) AS 'Maximum Balance', AVG(MEM_BALANCE) AS 'Average Balance'
	FROM MEMBERSHIP;
    
/* 18 */
SELECT CONCAT(MEM_FNAME, ' ', MEM_LNAME) AS 'Membership Name', CONCAT(MEM_STREET, ', ', MEM_CITY, ', ', MEM_STATE, ' ', MEM_ZIP) AS 'Membership Address'
	FROM MEMBERSHIP;

/* 19 */
SELECT RENTAL.RENT_NUM, RENTAL.RENT_DATE, DETAILRENTAL.VID_NUM, MOVIE.MOVIE_TITLE, DETAILRENTAL.DETAIL_DUEDATE, DETAILRENTAL.DETAIL_RETURNDATE
	FROM RENTAL
    INNER JOIN DETAILRENTAL
    ON RENTAL.RENT_NUM = DETAILRENTAL.RENT_NUM
    INNER JOIN VIDEO
    ON DETAILRENTAL.VID_NUM = VIDEO.VID_NUM
    INNER JOIN MOVIE
    ON VIDEO.MOVIE_NUM = MOVIE.MOVIE_NUM
    WHERE DETAILRENTAL.DETAIL_DUEDATE < DETAILRENTAL.DETAIL_RETURNDATE
    ORDER BY RENTAL.RENT_NUM, MOVIE.MOVIE_TITLE;
    
/* 20 */
SELECT RENTAL.RENT_NUM, RENTAL.RENT_DATE, DETAILRENTAL.VID_NUM, MOVIE.MOVIE_TITLE, DETAILRENTAL.DETAIL_DUEDATE, DETAILRENTAL.DETAIL_RETURNDATE, DETAILRENTAL.DETAIL_RETURNDATE - DETAILRENTAL.DETAIL_DUEDATE AS 'Days Past Due'
	FROM RENTAL
    INNER JOIN DETAILRENTAL
    ON RENTAL.RENT_NUM = DETAILRENTAL.RENT_NUM
    INNER JOIN VIDEO
    ON DETAILRENTAL.VID_NUM = VIDEO.VID_NUM
    INNER JOIN MOVIE
    ON VIDEO.MOVIE_NUM = MOVIE.MOVIE_NUM
    WHERE DETAILRENTAL.DETAIL_DUEDATE < DETAILRENTAL.DETAIL_RETURNDATE
    ORDER BY RENTAL.RENT_NUM, MOVIE.MOVIE_TITLE;
    
/* 21 */
SELECT RENTAL.RENT_NUM, RENTAL.RENT_DATE, DETAILRENTAL.VID_NUM, MOVIE.MOVIE_TITLE, DETAILRENTAL.DETAIL_FEE
	FROM RENTAL
    INNER JOIN DETAILRENTAL
    ON RENTAL.RENT_NUM = DETAILRENTAL.RENT_NUM
    INNER JOIN VIDEO
    ON DETAILRENTAL.VID_NUM = VIDEO.VID_NUM
    INNER JOIN MOVIE
    ON VIDEO.MOVIE_NUM = MOVIE.MOVIE_NUM
    WHERE DETAILRENTAL.DETAIL_DUEDATE >= DETAILRENTAL.DETAIL_RETURNDATE
    ORDER BY RENTAL.RENT_NUM, MOVIE.MOVIE_TITLE;
    
/* 22 */
SELECT MEMBERSHIP.MEM_NUM, MEMBERSHIP.MEM_LNAME, MEMBERSHIP.MEM_FNAME, SUM(DETAILRENTAL.DETAIL_FEE)
	FROM MEMBERSHIP
    INNER JOIN RENTAL
    ON MEMBERSHIP.MEM_NUM = RENTAL.MEM_NUM
    INNER JOIN DETAILRENTAL
    ON RENTAL.RENT_NUM = DETAILRENTAL.RENT_NUM
    GROUP BY MEMBERSHIP.MEM_NUM;

/* 23 */
SELECT MOVIE_NUM, MOVIE.MOVIE_GENRE, AVGCOST , MOVIE_COST, (MOVIE_COST - AVGCOST ) / AVGCOST * 100 AS 'Percent Difference'
	FROM MOVIE, (SELECT MOVIE_GENRE, AVG(MOVIE_COST) AS AVGCOST FROM MOVIE GROUP BY MOVIE_GENRE) AVERAGE
	WHERE MOVIE.MOVIE_GENRE = AVERAGE.MOVIE_GENRE;

/* 24 */
ALTER TABLE DETAILRENTAL
ADD DETAIL_DAYSLATE INT(3) NULL;

/* 25 */
ALTER TABLE VIDEO
ADD VID_STATUS CHAR(4) NOT NULL DEFAULT 'IN' CHECK(VID_STATUS IN ('IN', 'OUT', 'LOST'));

/* 26 */
UPDATE VIDEO
SET VID_STATUS = 'OUT'
WHERE VID_NUM IN 
	(SELECT VID_NUM 
		FROM DETAILRENTAL
        WHERE DETAIL_RETURNDATE IS NULL);
        
/* 27 */
ALTER TABLE PRICE
ADD PRICE_RENTDAYS INT(2) NOT NULL DEFAULT 3;

/* 28 */
UPDATE PRICE
SET PRICE_RENTDAYS = 5
WHERE PRICE_CODE IN (1, 3);

UPDATE PRICE
SET PRICE_RENTDAYS = 7
WHERE PRICE_CODE = 4;

/* 29 */
DROP TRIGGER IF EXISTS trg_late_return;
DELIMITER //
CREATE TRIGGER trg_late_return BEFORE UPDATE 
ON DETAILRENTAL
FOR EACH ROW
BEGIN
	IF (NEW.DETAIL_RETURNDATE IS NULL) THEN 
		SET NEW.DETAIL_DAYSLATE := NULL;
	ELSEIF (NEW.DETAIL_RETURNDATE - NEW.DETAIL_DUEDATE > 0) THEN
		SET NEW.DETAIL_DAYSLATE := NEW.DETAIL_RETURNDATE - NEW.DETAIL_DUEDATE;
	ELSE
		SET NEW.DETAIL_DAYSLATE := 0;
    END IF;
END//
DELIMITER ;

/* 30 */
/* This is very weird to do in MySQL. I had to take out some of the things that I'm supposed to do, but functionality should be exactly the same.*/
DROP TRIGGER IF EXISTS trg_mem_balance;
DELIMITER //
CREATE TRIGGER trg_mem_balance AFTER UPDATE 
ON DETAILRENTAL
FOR EACH ROW
BEGIN
	DECLARE PRIOR_LATEFEE DOUBLE; 
	DECLARE NEW_LATEFEE DOUBLE; 
	DECLARE UPDATE_AMOUNT DOUBLE;
	DECLARE RENTAL_MEMBER INT;
    DECLARE FINAL DECIMAL(6, 2);
    SET PRIOR_LATEFEE := OLD.DETAIL_DAYSLATE * OLD.DETAIL_DAILYLATEFEE;
    IF PRIOR_LATEFEE IS NULL THEN 
		SET PRIOR_LATEFEE := 0;
	END IF; 
    SET NEW_LATEFEE := NEW.DETAIL_DAYSLATE * NEW.DETAIL_DAILYLATEFEE;
    IF NEW_LATEFEE IS NULL THEN
		SET NEW_LATEFEE := 0;
	END IF; 
    SET UPDATE_AMOUNT := NEW_LATEFEE - PRIOR_LATEFEE;
	IF (UPDATE_AMOUNT != 0) THEN 
		SELECT MEM_NUM INTO RENTAL_MEMBER FROM RENTAL WHERE RENT_NUM = NEW.RENT_NUM;
        SET FINAL := CONVERT(ROUND(UPDATE_AMOUNT, 2), DECIMAL(6, 2));
		UPDATE MEMBERSHIP SET MEM_BALANCE = MEM_BALANCE + FINAL WHERE MEM_NUM = RENTAL_MEMBER;
    END IF; 
END//
DELIMITER ;

/* Testing #29 and #30 */
UPDATE DETAILRENTAL
SET DETAIL_RETURNDATE = '2009-05-04'
WHERE RENT_NUM = 1008;

SELECT * FROM DETAILRENTAL;


/* 31 */
DROP PROCEDURE IF EXISTS prc_new_rental;
DELIMITER //

CREATE PROCEDURE prc_new_rental(IN member_num INT)
BEGIN
	DECLARE FINDMEMBER INT;
    
    SELECT COUNT(MEM_NUM) INTO FINDMEMBER FROM MEMBERSHIP WHERE MEM_NUM = member_num;
    
	IF FINDMEMBER = 0 THEN 
		SELECT 'NO MEMBER WITH THIS ID';
    ELSE 
		SELECT CONCAT('Previous balance: $', MEM_BALANCE) FROM MEMBERSHIP WHERE MEM_NUM = member_num;
		INSERT INTO RENTAL(RENT_DATE, MEM_NUM)
		VALUES (CURDATE(), mem_num);
    END IF;
END//

DELIMITER ;

/* Testing */ 
CALL prc_new_rental(123);
CALL prc_new_rental(110);
SELECT * FROM RENTAL;

/* 32 */

DROP PROCEDURE IF EXISTS prc_new_detail;
DELIMITER //

CREATE PROCEDURE prc_new_detail(IN video_num INT, IN rent_num INT)
BEGIN
	DECLARE FINDVIDEO INT;
    DECLARE VIDSTAT CHAR(4);
    DECLARE RENTFEE DECIMAL(6, 2);
    DECLARE LATEFEE DECIMAL(6, 2);
    DECLARE RENTDAYS INT;
    DECLARE DUEDATE DATE;
    
    SELECT COUNT(VID_NUM) INTO FINDVIDEO FROM VIDEO WHERE VID_NUM = video_num;
	SELECT VID_STATUS INTO VIDSTAT FROM VIDEO WHERE VID_NUM = video_num;
        
    IF FINDVIDEO = 0 THEN
		SELECT 'VIDEO DOES NOT EXIST';
	ELSEIF VIDSTAT != 'IN' THEN
		SELECT 'VIDEO IS NOT CURRENTLY AVAILABLE';
	ELSE
		SELECT PRICE.PRICE_RENTFEE, PRICE.PRICE_DAILYLATEFEE, PRICE.PRICE_RENTDAYS INTO RENTFEE, LATEFEE, RENTDAYS 
			FROM PRICE
			INNER JOIN MOVIE
			ON PRICE.PRICE_CODE = MOVIE.PRICE_CODE
			INNER JOIN VIDEO
			ON MOVIE.MOVIE_NUM = VIDEO.MOVIE_NUM
			WHERE VIDEO.VID_NUM = video_num;
		SET DUEDATE := CURDATE() + RENTDAYS;
		
        INSERT INTO DETAILRENTAL(RENT_NUM, VID_NUM, DETAIL_FEE, DETAIL_DUEDATE, DETAIL_DAILYLATEFEE)
        VALUES (rent_num, video_num, RENTFEE, DUEDATE, LATEFEE);
        
        UPDATE VIDEO
        SET VID_STATUS = 'OUT'
        WHERE VID_NUM = video_num;
	END IF;
END//
DELIMITER ;


/* Testing */
SELECT * FROM DETAILRENTAL;

CALL prc_new_detail(61388, 1004);

