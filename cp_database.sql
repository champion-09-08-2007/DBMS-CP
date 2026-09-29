Enter password: ************
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 27
Server version: 8.0.46 MySQL Community Server - GPL

Copyright (c) 2000, 2026, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+-------------------------------+
| Database                      |
+-------------------------------+
| bank                          |
| banking_management_system     |
| cinema                        |
| college_event_club_management |
| customer                      |
| information_schema            |
| mysql                         |
| office                        |
| performance_schema            |
| student                       |
| sys                           |
+-------------------------------+
11 rows in set (0.04 sec)

mysql> ^C
mysql> create database college_club_management;
Query OK, 1 row affected (0.05 sec)

mysql> use college_club_management;
Database changed
mysql> create table faculty_coordinator (id int primary key, name varchar(100) not null, email varchar(100) unique, phone varchar(15), department varchar(100));
Query OK, 0 rows affected (0.06 sec)

mysql> create table student (id int primary key, name varchar(100) not null, email varchar(100) unique, phone varchar(15), branch varchar(100), year int);
Query OK, 0 rows affected (0.04 sec)

mysql> create table club (id int primary key, name varchar(100) not null, type varchar(50), description varchar(255), founded_year year, faculty_id int, foreign key (faculty_id) references faculty_coordinator(id));
Query OK, 0 rows affected (0.05 sec)

mysql> create table membership (student_id int, club_id int, join_date date, role varchar(50), status varchar(30), primary key (student_id, club_id), foreign key (student_id) references student(id), foreign key (club_id) references club(id));
Query OK, 0 rows affected (0.07 sec)

mysql> create table event (id int primary key, name varchar(100) not null, date date, venue varchar(100), type varchar(50), id_club int, faculty_id int, foreign key (id_club) references club(id), foreign key (faculty_id) references faculty_coordinator(id));
Query OK, 0 rows affected (0.05 sec)

mysql> create table participation (student_id int, event_id int, attendance varchar(20), feedback varchar(255), certificate varchar(100), primary key (student_id, event_id), foreign key (student_id) references student(id), foreign key (event_id) references event(id));
Query OK, 0 rows affected (0.11 sec)

mysql> desc student;
+--------+--------------+------+-----+---------+-------+
| Field  | Type         | Null | Key | Default | Extra |
+--------+--------------+------+-----+---------+-------+
| id     | int          | NO   | PRI | NULL    |       |
| name   | varchar(100) | NO   |     | NULL    |       |
| email  | varchar(100) | YES  | UNI | NULL    |       |
| phone  | varchar(15)  | YES  |     | NULL    |       |
| branch | varchar(100) | YES  |     | NULL    |       |
| year   | int          | YES  |     | NULL    |       |
+--------+--------------+------+-----+---------+-------+
6 rows in set (0.05 sec)

mysql> desc club;
+--------------+--------------+------+-----+---------+-------+
| Field        | Type         | Null | Key | Default | Extra |
+--------------+--------------+------+-----+---------+-------+
| id           | int          | NO   | PRI | NULL    |       |
| name         | varchar(100) | NO   |     | NULL    |       |
| type         | varchar(50)  | YES  |     | NULL    |       |
| description  | varchar(255) | YES  |     | NULL    |       |
| founded_year | year         | YES  |     | NULL    |       |
| faculty_id   | int          | YES  | MUL | NULL    |       |
+--------------+--------------+------+-----+---------+-------+
6 rows in set (0.00 sec)

mysql> desc membership;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| student_id | int         | NO   | PRI | NULL    |       |
| club_id    | int         | NO   | PRI | NULL    |       |
| join_date  | date        | YES  |     | NULL    |       |
| role       | varchar(50) | YES  |     | NULL    |       |
| status     | varchar(30) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

mysql> desc event;
+------------+--------------+------+-----+---------+-------+
| Field      | Type         | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| id         | int          | NO   | PRI | NULL    |       |
| name       | varchar(100) | NO   |     | NULL    |       |
| date       | date         | YES  |     | NULL    |       |
| venue      | varchar(100) | YES  |     | NULL    |       |
| type       | varchar(50)  | YES  |     | NULL    |       |
| id_club    | int          | YES  | MUL | NULL    |       |
| faculty_id | int          | YES  | MUL | NULL    |       |
+------------+--------------+------+-----+---------+-------+
7 rows in set (0.00 sec)

mysql> desc participation;
+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| student_id  | int          | NO   | PRI | NULL    |       |
| event_id    | int          | NO   | PRI | NULL    |       |
| attendance  | varchar(20)  | YES  |     | NULL    |       |
| feedback    | varchar(255) | YES  |     | NULL    |       |
| certificate | varchar(100) | YES  |     | NULL    |       |
+-------------+--------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

mysql> insert into faculty_coordinator (id,name,email,phone,department) values (1,'anil patil','anil.patil@college.edu','9876500001','computer engineering'),(2,'meena joshi','meena.joshi@college.edu','9876500002','information technology'),(3,'rajendra shinde','rajendra.shinde@college.edu','9876500003','electronics engineering'),(4,'sunita deshmukh','sunita.deshmukh@college.edu','9876500004','mechanical engineering'),(5,'vikas kulkarni','vikas.kulkarni@college.edu','9876500005','civil engineering'),(6,'priya pawar','priya.pawar@college.edu','9876500006','computer engineering'),(7,'sachin more','sachin.more@college.edu','9876500007','information technology'),(8,'neha chavan','neha.chavan@college.edu','9876500008','electronics engineering'),(9,'mahesh jadhav','mahesh.jadhav@college.edu','9876500009','mechanical engineering'),(10,'swati gaikwad','swati.gaikwad@college.edu','9876500010','civil engineering'),(11,'ramesh bhosale','ramesh.bhosale@college.edu','9876500011','computer engineering'),(12,'kavita salunkhe','kavita.salunkhe@college.edu','9876500012','information technology'),(13,'nilesh pawar','nilesh.pawar@college.edu','9876500013','electronics engineering'),(14,'asha sharma','asha.sharma@college.edu','9876500014','mechanical engineering'),(15,'suresh mane','suresh.mane@college.edu','9876500015','civil engineering'),(16,'pooja shinde','pooja.shinde@college.edu','9876500016','computer engineering'),(17,'amit kadam','amit.kadam@college.edu','9876500017','information technology'),(18,'deepa thorat','deepa.thorat@college.edu','9876500018','electronics engineering'),(19,'milind pawar','milind.pawar@college.edu','9876500019','mechanical engineering'),(20,'rekha more','rekha.more@college.edu','9876500020','civil engineering'),(21,'ajay chavan','ajay.chavan@college.edu','9876500021','computer engineering'),(22,'seema patil','seema.patil@college.edu','9876500022','information technology'),(23,'prashant jadhav','prashant.jadhav@college.edu','9876500023','electronics engineering'),(24,'manisha shinde','manisha.shinde@college.edu','9876500024','mechanical engineering'),(25,'dilip pawar','dilip.pawar@college.edu','9876500025','civil engineering'),(26,'swara joshi','swara.joshi@college.edu','9876500026','computer engineering'),(27,'rohit more','rohit.more@college.edu','9876500027','information technology'),(28,'madhuri patil','madhuri.patil@college.edu','9876500028','electronics engineering'),(29,'sanjay shinde','sanjay.shinde@college.edu','9876500029','mechanical engineering'),(30,'vandana pawar','vandana.pawar@college.edu','9876500030','civil engineering'),(31,'ganesh kadam','ganesh.kadam@college.edu','9876500031','computer engineering'),(32,'shilpa more','shilpa.more@college.edu','9876500032','information technology'),(33,'rahul patil','rahul.patil@college.edu','9876500033','electronics engineering'),(34,'supriya jadhav','supriya.jadhav@college.edu','9876500034','mechanical engineering'),(35,'bharat shinde','bharat.shinde@college.edu','9876500035','civil engineering'),(36,'archana pawar','archana.pawar@college.edu','9876500036','computer engineering'),(37,'yogesh more','yogesh.more@college.edu','9876500037','information technology'),(38,'komal patil','komal.patil@college.edu','9876500038','electronics engineering'),(39,'santosh jadhav','santosh.jadhav@college.edu','9876500039','mechanical engineering'),(40,'minal shinde','minal.shinde@college.edu','9876500040','civil engineering'),(41,'sunil pawar','sunil.pawar@college.edu','9876500041','computer engineering'),(42,'rutuja more','rutuja.more@college.edu','9876500042','information technology'),(43,'vishal patil','vishal.patil@college.edu','9876500043','electronics engineering'),(44,'ashwini jadhav','ashwini.jadhav@college.edu','9876500044','mechanical engineering'),(45,'shweta shinde','shweta.shinde@college.edu','9876500045','civil engineering'),(46,'mahendra pawar','mahendra.pawar@college.edu','9876500046','computer engineering'),(47,'sakshi more','sakshi.more@college.edu','9876500047','information technology'),(48,'tejas patil','tejas.patil@college.edu','9876500048','electronics engineering'),(49,'nikita jadhav','nikita.jadhav@college.edu','9876500049','mechanical engineering'),(50,'omkar shinde','omkar.shinde@college.edu','9876500050','civil engineering');
Query OK, 50 rows affected (0.03 sec)
Records: 50  Duplicates: 0  Warnings: 0

mysql> insert into student (id,name,email,phone,branch,year) values (1,'aarav patil','aarav.patil@student.edu','9765400001','computer engineering',2),(2,'saanvi joshi','saanvi.joshi@student.edu','9765400002','information technology',2),(3,'vihaan shinde','vihaan.shinde@student.edu','9765400003','electronics engineering',3),(4,'ananya pawar','ananya.pawar@student.edu','9765400004','computer engineering',1),(5,'aditya more','aditya.more@student.edu','9765400005','mechanical engineering',4),(6,'ishita patil','ishita.patil@student.edu','9765400006','civil engineering',2),(7,'aryan jadhav','aryan.jadhav@student.edu','9765400007','computer engineering',3),(8,'diya shinde','diya.shinde@student.edu','9765400008','information technology',1),(9,'atharva pawar','atharva.pawar@student.edu','9765400009','electronics engineering',4),(10,'riya more','riya.more@student.edu','9765400010','computer engineering',2),(11,'vedant patil','vedant.patil@student.edu','9765400011','mechanical engineering',3),(12,'myra joshi','myra.joshi@student.edu','9765400012','information technology',2),(13,'rohan shinde','rohan.shinde@student.edu','9765400013','civil engineering',1),(14,'tanvi pawar','tanvi.pawar@student.edu','9765400014','computer engineering',4),(15,'om patil','om.patil@student.edu','9765400015','electronics engineering',2),(16,'avani jadhav','avani.jadhav@student.edu','9765400016','information technology',3),(17,'siddharth more','siddharth.more@student.edu','9765400017','computer engineering',1),(18,'ishani shinde','ishani.shinde@student.edu','9765400018','mechanical engineering',2),(19,'harsh pawar','harsh.pawar@student.edu','9765400019','civil engineering',3),(20,'kavya patil','kavya.patil@student.edu','9765400020','computer engineering',4),(21,'yash jadhav','yash.jadhav@student.edu','9765400021','information technology',2),(22,'manya more','manya.more@student.edu','9765400022','electronics engineering',1),(23,'sahil shinde','sahil.shinde@student.edu','9765400023','computer engineering',3),(24,'pranali pawar','pranali.pawar@student.edu','9765400024','civil engineering',2),(25,'akshat patil','akshat.patil@student.edu','9765400025','mechanical engineering',4),(26,'sakshi jadhav','sakshi.jadhav@student.edu','9765400026','computer engineering',1),(27,'kunal more','kunal.more@student.edu','9765400027','information technology',3),(28,'shruti shinde','shruti.shinde@student.edu','9765400028','electronics engineering',2),(29,'manav pawar','manav.pawar@student.edu','9765400029','computer engineering',4),(30,'mitali patil','mitali.patil@student.edu','9765400030','civil engineering',1),(31,'raj jadhav','raj.jadhav@student.edu','9765400031','mechanical engineering',2),(32,'priya more','priya.more@student.edu','9765400032','computer engineering',3),(33,'atharva shinde','atharva.shinde@student.edu','9765400033','information technology',4),(34,'neha pawar','neha.pawar@student.edu','9765400034','electronics engineering',1),(35,'tejas patil','tejas.patil@student.edu','9765400035','computer engineering',2),(36,'rutuja jadhav','rutuja.jadhav@student.edu','9765400036','civil engineering',3),(37,'suyogmore','suyog.more@student.edu','9765400037','mechanical engineering',4),(38,'isha shinde','isha.shinde@student.edu','9765400038','computer engineering',1),(39,'akshay pawar','akshay.pawar@student.edu','9765400039','information technology',2),(40,'gargi patil','gargi.patil@student.edu','9765400040','electronicsengineering',3),(41,'swaraj jadhav','swaraj.jadhav@student.edu','9765400041','computer engineering',4),(42,'sneha more','sneha.more@student.edu','9765400042','civil engineering',1),(43,'mohit shinde','mohit.shinde@student.edu','9765400043','mechanical engineering',2),(44,'saniya pawar','saniya.pawar@student.edu','9765400044','computer engineering',3),(45,'prathamesh patil','prathamesh.patil@student.edu','9765400045','information technology',4),(46,'ashwini jadhav','ashwini.jadhav@student.edu','9765400046','electronics engineering',1),(47,'girish more','girish.more@student.edu','9765400047','computer engineering',2),(48,'vaishnavi shinde','vaishnavi.shinde@student.edu','9765400048','civil engineering',3),(49,'shubham pawar','shubham.pawar@student.edu','9765400049','mechanical engineering',4),(50,'gauri patil','gauri.patil@student.edu','9765400050','computer engineering',2);
Query OK, 50 rows affected (0.01 sec)
Records: 50  Duplicates: 0  Warnings: 0

mysql> insert into club (id,name,type,description,founded_year,faculty_id) values (1,'coding club','technical','coding and programming activities',2018,1),(2,'robotics club','technical','robotics and automation projects',2019,2),(3,'literary club','cultural','reading writing and literature',2017,3),(4,'drama club','cultural','theatre and acting activities',2016,4),(5,'music club','cultural','music and singing activities',2018,5),(6,'dance club','cultural','dance and choreography activities',2019,6),(7,'art club','creative','painting and creative arts',2020,7),(8,'photography club','creative','photography and visual arts',2018,8),(9,'sports club','sports','sports and fitness activities',2015,9),(10,'entrepreneurship club','technical','startup and entrepreneurship activities',2021,10),(11,'ai club','technical','artificial intelligence activities',2022,11),(12,'cyber security club','technical','cyber security awareness',2021,12),(13,'web development club','technical','web development projects',2020,13),(14,'app development club','technical','mobile application development',2020,14),(15,'gaming club','creative','gaming and game development',2019,15),(16,'debate club','cultural','debates and public speaking',2017,16),(17,'quiz club','academic','quizzes and general knowledge',2016,17),(18,'environment club','social','environment awareness activities',2018,18),(19,'social service club','social','community service activities',2015,19),(20,'finance club','academic','finance and investment awareness',2021,20),(21,'science club','academic','science experiments and activities',2017,21),(22,'math club','academic','mathematics and problem solving',2016,22),(23,'design club','creative','graphic and product design',2020,23),(24,'film club','cultural','film appreciation and filmmaking',2019,24),(25,'management club','academic','management and leadership activities',2018,25),(26,'coding society','technical','competitive programming activities',2022,26),(27,'innovation club','technical','innovation and technology projects',2021,27),(28,'drone club','technical','drone technology and projects',2020,28),(29,'electronics club','technical','electronics projects and workshops',2017,29),(30,'mechanical club','technical','mechanical projects and design',2016,30),(31,'civil club','technical','civil engineering activities',2018,31),(32,'aerospace club','technical','aerospace and aviation activities',2022,32),(33,'book club','cultural','books and reading discussions',2019,33),(34,'poetry club','cultural','poetry and creative writing',2018,34),(35,'fashion club','creative','fashion design and events',2020,35),(36,'culinary club','creative','cooking and culinary activities',2021,36),(37,'health club','social','health and wellness activities',2017,37),(38,'fitness club','sports','fitness and wellness activities',2019,38),(39,'cricket club','sports','cricket training and activities',2016,39),(40,'football club','sports','football training and activities',2017,40),(41,'badminton club','sports','badminton training and events',2018,41),(42,'chess club','sports','chess and strategy activities',2015,42),(43,'volleyball club','sports','volleyball training and events',2019,43),(44,'trekking club','sports','trekking and outdoor activities',2018,44),(45,'music production club','creative','music production and recording',2022,45),(46,'media club','creative','college media and content creation',2021,46),(47,'social media club','creative','social media and digital content',2020,47),(48,'arvr club','technical','augmented and virtual reality projects',2022,48),(49,'iotclub','technical','internet of things projects',2021,49),(50,'research club','academic','research and academic activities',2017,50);
Query OK, 50 rows affected (0.01 sec)
Records: 50  Duplicates: 0  Warnings: 0

mysql> insert into membership (student_id,club_id,join_date,role,status) values (1,1,'2025-07-10','member','active'),(2,2,'2025-07-12','member','active'),(3,3,'2025-07-15','coordinator','active'),(4,4,'2025-07-18','member','active'),(5,5,'2025-07-20','member','active'),(6,6,'2025-07-22','member','active'),(7,7,'2025-07-25','coordinator','active'),(8,8,'2025-07-27','member','active'),(9,9,'2025-08-01','member','active'),(10,10,'2025-08-03','member','active'),(11,11,'2025-08-05','coordinator','active'),(12,12,'2025-08-07','member','active'),(13,13,'2025-08-10','member','active'),(14,14,'2025-08-12','member','active'),(15,15,'2025-08-15','coordinator','active'),(16,16,'2025-08-17','member','active'),(17,17,'2025-08-20','member','active'),(18,18,'2025-08-22','member','active'),(19,19,'2025-08-25','coordinator','active'),(20,20,'2025-08-27','member','active'),(21,21,'2025-09-01','member','active'),(22,22,'2025-09-03','member','active'),(23,23,'2025-09-05','coordinator','active'),(24,24,'2025-09-07','member','active'),(25,25,'2025-09-10','member','active'),(26,26,'2025-09-12','member','active'),(27,27,'2025-09-15','coordinator','active'),(28,28,'2025-09-17','member','active'),(29,29,'2025-09-20','member','active'),(30,30,'2025-09-22','member','active'),(31,31,'2025-09-25','coordinator','active'),(32,32,'2025-09-27','member','active'),(33,33,'2025-09-28','member','active'),(34,34,'2025-09-29','member','active'),(35,35,'2025-09-30','coordinator','active'),(36,36,'2025-10-01','member','active'),(37,37,'2025-10-02','member','active'),(38,38,'2025-10-03','member','active'),(39,39,'2025-10-04','coordinator','active'),(40,40,'2025-10-05','member','active'),(41,41,'2025-10-06','member','active'),(42,42,'2025-10-07','member','active'),(43,43,'2025-10-08','coordinator','active'),(44,44,'2025-10-09','member','active'),(45,45,'2025-10-10','member','active'),(46,46,'2025-10-11','member','active'),(47,47,'2025-10-12','coordinator','active'),(48,48,'2025-10-13','member','active'),(49,49,'2025-10-14','member','active'),(50,50,'2025-10-15','member','active');
Query OK, 50 rows affected (0.01 sec)
Records: 50  Duplicates: 0  Warnings: 0

mysql> insert into event (id,name,date,venue,type,id_club,faculty_id) values (1,'coding contest','2026-01-10','lab 1','competition',1,1),(2,'robotics workshop','2026-01-15','robotics lab','workshop',2,2),(3,'poetry evening','2026-01-20','seminar hall','cultural',3,3),(4,'annual drama','2026-01-25','auditorium','cultural',4,4),(5,'music fest','2026-02-01','college ground','cultural',5,5),(6,'dance competition','2026-02-05','auditorium','competition',6,6),(7,'art exhibition','2026-02-10','art gallery','exhibition',7,7),(8,'photography walk','2026-02-15','campus','activity',8,8),(9,'sports meet','2026-02-20','sports ground','sports',9,9),(10,'startup meetup','2026-02-25','seminar hall','seminar',10,10),(11,'ai workshop','2026-03-01','lab 2','workshop',11,11),(12,'cyber security seminar','2026-03-05','seminar hall','seminar',12,12),(13,'web hackathon','2026-03-10','computer lab','competition',13,13),(14,'app development workshop','2026-03-15','computer lab','workshop',14,14),(15,'gaming tournament','2026-03-20','gaming lab','competition',15,15),(16,'debate competition','2026-03-25','auditorium','competition',16,16),(17,'quiz competition','2026-04-01','seminar hall','competition',17,17),(18,'green campus drive','2026-04-05','collegecampus','social',18,18),(19,'social service camp','2026-04-10','community hall','social',19,19),(20,'finance seminar','2026-04-15','seminar hall','seminar',20,20),(21,'science exhibition','2026-04-20','science lab','exhibition',21,21),(22,'math challenge','2026-04-25','classroom 1','competition',22,22),(23,'design workshop','2026-05-01','design lab','workshop',23,23),(24,'film festival','2026-05-05','auditorium','cultural',24,24),(25,'management seminar','2026-05-10','seminar hall','seminar',25,25),(26,'programming contest','2026-05-15','computer lab','competition',26,26),(27,'innovation fair','2026-05-20','college ground','exhibition',27,27),(28,'drone workshop','2026-05-25','open ground','workshop',28,28),(29,'electronics expo','2026-06-01','electronics lab','exhibition',29,29),(30,'mechanical expo','2026-06-05','workshop','exhibition',30,30),(31,'civil project expo','2026-06-10','civil lab','exhibition',31,31),(32,'aerospace seminar','2026-06-15','seminar hall','seminar',32,32),(33,'book discussion','2026-06-20','library','cultural',33,33),(34,'poetry competition','2026-06-25','auditorium','competition',34,34),(35,'fashion show','2026-07-01','college ground','cultural',35,35),(36,'food festival','2026-07-05','college ground','cultural',36,36),(37,'health awareness','2026-07-10','seminar hall','social',37,37),(38,'fitness challenge','2026-07-15','sports ground','sports',38,38),(39,'cricket tournament','2026-07-20','cricket ground','sports',39,39),(40,'football tournament','2026-07-25','football ground','sports',40,40),(41,'badminton tournament','2026-08-01','badminton court','sports',41,41),(42,'chess tournament','2026-08-05','library hall','sports',42,42),(43,'volleyball tournament','2026-08-10','volleyball court','sports',43,43),(44,'trekking camp','2026-08-15','college campus','activity',44,44),(45,'music production workshop','2026-08-20','music studio','workshop',45,45),(46,'media workshop','2026-08-25','media lab','workshop',46,46),(47,'social media workshop','2026-09-01','media lab','workshop',47,47),(48,'arvr exhibition','2026-09-05','arvr lab','exhibition',48,48),(49,'iot workshop','2026-09-10','iot lab','workshop',49,49),(50,'researchsymposium','2026-09-15','seminar hall','seminar',50,50);
Query OK, 50 rows affected (0.01 sec)
Records: 50  Duplicates: 0  Warnings: 0

mysql> insert into participation (student_id,event_id,attendance,feedback,certificate) values (1,1,'present','excellent event','yes'),(2,2,'present','very informative','yes'),(3,3,'present','enjoyed the event','yes'),(4,4,'absent','could not attend','no'),(5,5,'present','very enjoyable','yes'),(6,6,'present','well organized','yes'),(7,7,'present','creative exhibition','yes'),(8,8,'present','good experience','yes'),(9,9,'present','great competition','yes'),(10,10,'absent','could not attend','no'),(11,11,'present','excellent workshop','yes'),(12,12,'present','useful seminar','yes'),(13,13,'present','exciting hackathon','yes'),(14,14,'present','very useful','yes'),(15,15,'present','fun tournament','yes'),(16,16,'absent','schedule conflict','no'),(17,17,'present','interesting quiz','yes'),(18,18,'present','good initiative','yes'),(19,19,'present','meaningful activity','yes'),(20,20,'present','informative session','yes'),(21,21,'present','excellent exhibition','yes'),(22,22,'absent','could not attend','no'),(23,23,'present','helpful workshop','yes'),(24,24,'present','enjoyed the films','yes'),(25,25,'present','good seminar','yes'),(26,26,'present','challenging contest','yes'),(27,27,'present','innovative projects','yes'),(28,28,'absent','could not attend','no'),(29,29,'present','interesting projects','yes'),(30,30,'present','good exhibition','yes'),(31,31,'present','useful projects','yes'),(32,32,'present','informative session','yes'),(33,33,'absent','could not attend','no'),(34,34,'present','enjoyed competition','yes'),(35,35,'present','great show','yes'),(36,36,'present','very enjoyable','yes'),(37,37,'present','important awareness','yes'),(38,38,'present','good challenge','yes'),(39,39,'present','great tournament','yes'),(40,40,'absent','could not attend','no'),(41,41,'present','well organized','yes'),(42,42,'present','interesting matches','yes'),(43,43,'present','great tournament','yes'),(44,44,'present','wonderful experience','yes'),(45,45,'absent','could not attend','no'),(46,46,'present','useful workshop','yes'),(47,47,'present','very informative','yes'),(48,48,'present','excellent exhibition','yes'),(49,49,'present','great workshop','yes'),(50,50,'present','valuable symposium','yes');
Query OK, 50 rows affected (0.01 sec)
Records: 50  Duplicates: 0  Warnings: 0

mysql> show tables;
+-----------------------------------+
| Tables_in_college_club_management |
+-----------------------------------+
| club                              |
| event                             |
| faculty_coordinator               |
| membership                        |
| participation                     |
| student                           |
+-----------------------------------+
6 rows in set (0.01 sec)

mysql> select * from club;
+----+-----------------------+-----------+-----------------------------------------+--------------+------------+
| id | name                  | type      | description                             | founded_year | faculty_id |
+----+-----------------------+-----------+-----------------------------------------+--------------+------------+
|  1 | coding club           | technical | coding and programming activities       |         2018 |          1 |
|  2 | robotics club         | technical | robotics and automation projects        |         2019 |          2 |
|  3 | literary club         | cultural  | reading writing and literature          |         2017 |          3 |
|  4 | drama club            | cultural  | theatre and acting activities           |         2016 |          4 |
|  5 | music club            | cultural  | music and singing activities            |         2018 |          5 |
|  6 | dance club            | cultural  | dance and choreography activities       |         2019 |          6 |
|  7 | art club              | creative  | painting and creative arts              |         2020 |          7 |
|  8 | photography club      | creative  | photography and visual arts             |         2018 |          8 |
|  9 | sports club           | sports    | sports and fitness activities           |         2015 |          9 |
| 10 | entrepreneurship club | technical | startup and entrepreneurship activities |         2021 |         10 |
| 11 | ai club               | technical | artificial intelligence activities      |         2022 |         11 |
| 12 | cyber security club   | technical | cyber security awareness                |         2021 |         12 |
| 13 | web development club  | technical | web development projects                |         2020 |         13 |
| 14 | app development club  | technical | mobile application development          |         2020 |         14 |
| 15 | gaming club           | creative  | gaming and game development             |         2019 |         15 |
| 16 | debate club           | cultural  | debates and public speaking             |         2017 |         16 |
| 17 | quiz club             | academic  | quizzes and general knowledge           |         2016 |         17 |
| 18 | environment club      | social    | environment awareness activities        |         2018 |         18 |
| 19 | social service club   | social    | community service activities            |         2015 |         19 |
| 20 | finance club          | academic  | finance and investment awareness        |         2021 |         20 |
| 21 | science club          | academic  | science experiments and activities      |         2017 |         21 |
| 22 | math club             | academic  | mathematics and problem solving         |         2016 |         22 |
| 23 | design club           | creative  | graphic and product design              |         2020 |         23 |
| 24 | film club             | cultural  | film appreciation and filmmaking        |         2019 |         24 |
| 25 | management club       | academic  | management and leadership activities    |         2018 |         25 |
| 26 | coding society        | technical | competitive programming activities      |         2022 |         26 |
| 27 | innovation club       | technical | innovation and technology projects      |         2021 |         27 |
| 28 | drone club            | technical | drone technology and projects           |         2020 |         28 |
| 29 | electronics club      | technical | electronics projects and workshops      |         2017 |         29 |
| 30 | mechanical club       | technical | mechanical projects and design          |         2016 |         30 |
| 31 | civil club            | technical | civil engineering activities            |         2018 |         31 |
| 32 | aerospace club        | technical | aerospace and aviation activities       |         2022 |         32 |
| 33 | book club             | cultural  | books and reading discussions           |         2019 |         33 |
| 34 | poetry club           | cultural  | poetry and creative writing             |         2018 |         34 |
| 35 | fashion club          | creative  | fashion design and events               |         2020 |         35 |
| 36 | culinary club         | creative  | cooking and culinary activities         |         2021 |         36 |
| 37 | health club           | social    | health and wellness activities          |         2017 |         37 |
| 38 | fitness club          | sports    | fitness and wellness activities         |         2019 |         38 |
| 39 | cricket club          | sports    | cricket training and activities         |         2016 |         39 |
| 40 | football club         | sports    | football training and activities        |         2017 |         40 |
| 41 | badminton club        | sports    | badminton training and events           |         2018 |         41 |
| 42 | chess club            | sports    | chess and strategy activities           |         2015 |         42 |
| 43 | volleyball club       | sports    | volleyball training and events          |         2019 |         43 |
| 44 | trekking club         | sports    | trekking and outdoor activities         |         2018 |         44 |
| 45 | music production club | creative  | music production and recording          |         2022 |         45 |
| 46 | media club            | creative  | college media and content creation      |         2021 |         46 |
| 47 | social media club     | creative  | social media and digital content        |         2020 |         47 |
| 48 | arvr club             | technical | augmented and virtual reality projects  |         2022 |         48 |
| 49 | iot club              | technical | internet of things projects             |         2021 |         49 |
| 50 | research club         | academic  | research and academic activities        |         2017 |         50 |
+----+-----------------------+-----------+-----------------------------------------+--------------+------------+
50 rows in set (0.00 sec)

mysql> select * from event;
+----+---------------------------+------------+------------------+-------------+---------+------------+
| id | name                      | date       | venue            | type        | id_club | faculty_id |
+----+---------------------------+------------+------------------+-------------+---------+------------+
|  1 | coding contest            | 2026-01-10 | lab 1            | competition |       1 |          1 |
|  2 | robotics workshop         | 2026-01-15 | robotics lab     | workshop    |       2 |          2 |
|  3 | poetry evening            | 2026-01-20 | seminar hall     | cultural    |       3 |          3 |
|  4 | annual drama              | 2026-01-25 | auditorium       | cultural    |       4 |          4 |
|  5 | music fest                | 2026-02-01 | college ground   | cultural    |       5 |          5 |
|  6 | dance competition         | 2026-02-05 | auditorium       | competition |       6 |          6 |
|  7 | art exhibition            | 2026-02-10 | art gallery      | exhibition  |       7 |          7 |
|  8 | photography walk          | 2026-02-15 | campus           | activity    |       8 |          8 |
|  9 | sports meet               | 2026-02-20 | sports ground    | sports      |       9 |          9 |
| 10 | startup meetup            | 2026-02-25 | seminar hall     | seminar     |      10 |         10 |
| 11 | ai workshop               | 2026-03-01 | lab 2            | workshop    |      11 |         11 |
| 12 | cyber security seminar    | 2026-03-05 | seminar hall     | seminar     |      12 |         12 |
| 13 | web hackathon             | 2026-03-10 | computer lab     | competition |      13 |         13 |
| 14 | app development workshop  | 2026-03-15 | computer lab     | workshop    |      14 |         14 |
| 15 | gaming tournament         | 2026-03-20 | gaming lab       | competition |      15 |         15 |
| 16 | debate competition        | 2026-03-25 | auditorium       | competition |      16 |         16 |
| 17 | quiz competition          | 2026-04-01 | seminar hall     | competition |      17 |         17 |
| 18 | green campus drive        | 2026-04-05 | college campus   | social      |      18 |         18 |
| 19 | social service camp       | 2026-04-10 | community hall   | social      |      19 |         19 |
| 20 | finance seminar           | 2026-04-15 | seminar hall     | seminar     |      20 |         20 |
| 21 | science exhibition        | 2026-04-20 | science lab      | exhibition  |      21 |         21 |
| 22 | math challenge            | 2026-04-25 | classroom 1      | competition |      22 |         22 |
| 23 | design workshop           | 2026-05-01 | design lab       | workshop    |      23 |         23 |
| 24 | film festival             | 2026-05-05 | auditorium       | cultural    |      24 |         24 |
| 25 | management seminar        | 2026-05-10 | seminar hall     | seminar     |      25 |         25 |
| 26 | programming contest       | 2026-05-15 | computer lab     | competition |      26 |         26 |
| 27 | innovation fair           | 2026-05-20 | college ground   | exhibition  |      27 |         27 |
| 28 | drone workshop            | 2026-05-25 | open ground      | workshop    |      28 |         28 |
| 29 | electronics expo          | 2026-06-01 | electronics lab  | exhibition  |      29 |         29 |
| 30 | mechanical expo           | 2026-06-05 | workshop         | exhibition  |      30 |         30 |
| 31 | civil project expo        | 2026-06-10 | civil lab        | exhibition  |      31 |         31 |
| 32 | aerospace seminar         | 2026-06-15 | seminar hall     | seminar     |      32 |         32 |
| 33 | book discussion           | 2026-06-20 | library          | cultural    |      33 |         33 |
| 34 | poetry competition        | 2026-06-25 | auditorium       | competition |      34 |         34 |
| 35 | fashion show              | 2026-07-01 | college ground   | cultural    |      35 |         35 |
| 36 | food festival             | 2026-07-05 | college ground   | cultural    |      36 |         36 |
| 37 | health awareness          | 2026-07-10 | seminar hall     | social      |      37 |         37 |
| 38 | fitness challenge         | 2026-07-15 | sports ground    | sports      |      38 |         38 |
| 39 | cricket tournament        | 2026-07-20 | cricket ground   | sports      |      39 |         39 |
| 40 | football tournament       | 2026-07-25 | football ground  | sports      |      40 |         40 |
| 41 | badminton tournament      | 2026-08-01 | badminton court  | sports      |      41 |         41 |
| 42 | chess tournament          | 2026-08-05 | library hall     | sports      |      42 |         42 |
| 43 | volleyball tournament     | 2026-08-10 | volleyball court | sports      |      43 |         43 |
| 44 | trekking camp             | 2026-08-15 | college campus   | activity    |      44 |         44 |
| 45 | music production workshop | 2026-08-20 | music studio     | workshop    |      45 |         45 |
| 46 | media workshop            | 2026-08-25 | media lab        | workshop    |      46 |         46 |
| 47 | social media workshop     | 2026-09-01 | media lab        | workshop    |      47 |         47 |
| 48 | arvr exhibition           | 2026-09-05 | arvr lab         | exhibition  |      48 |         48 |
| 49 | iot workshop              | 2026-09-10 | iot lab          | workshop    |      49 |         49 |
| 50 | research symposium        | 2026-09-15 | seminar hall     | seminar     |      50 |         50 |
+----+---------------------------+------------+------------------+-------------+---------+------------+
50 rows in set (0.00 sec)

mysql> select * from faculty_cordinator;
ERROR 1146 (42S02): Table 'college_club_management.faculty_cordinator' doesn't exist
mysql> select * from faculty_coordinator;
+----+-----------------+-----------------------------+------------+-------------------------+
| id | name            | email                       | phone      | department              |
+----+-----------------+-----------------------------+------------+-------------------------+
|  1 | anil patil      | anil.patil@college.edu      | 9876500001 | computer engineering    |
|  2 | meena joshi     | meena.joshi@college.edu     | 9876500002 | information technology  |
|  3 | rajendra shinde | rajendra.shinde@college.edu | 9876500003 | electronics engineering |
|  4 | sunita deshmukh | sunita.deshmukh@college.edu | 9876500004 | mechanical engineering  |
|  5 | vikas kulkarni  | vikas.kulkarni@college.edu  | 9876500005 | civil engineering       |
|  6 | priya pawar     | priya.pawar@college.edu     | 9876500006 | computer engineering    |
|  7 | sachin more     | sachin.more@college.edu     | 9876500007 | information technology  |
|  8 | neha chavan     | neha.chavan@college.edu     | 9876500008 | electronics engineering |
|  9 | mahesh jadhav   | mahesh.jadhav@college.edu   | 9876500009 | mechanical engineering  |
| 10 | swati gaikwad   | swati.gaikwad@college.edu   | 9876500010 | civil engineering       |
| 11 | ramesh bhosale  | ramesh.bhosale@college.edu  | 9876500011 | computer engineering    |
| 12 | kavita salunkhe | kavita.salunkhe@college.edu | 9876500012 | information technology  |
| 13 | nilesh pawar    | nilesh.pawar@college.edu    | 9876500013 | electronics engineering |
| 14 | asha sharma     | asha.sharma@college.edu     | 9876500014 | mechanical engineering  |
| 15 | suresh mane     | suresh.mane@college.edu     | 9876500015 | civil engineering       |
| 16 | pooja shinde    | pooja.shinde@college.edu    | 9876500016 | computer engineering    |
| 17 | amit kadam      | amit.kadam@college.edu      | 9876500017 | information technology  |
| 18 | deepa thorat    | deepa.thorat@college.edu    | 9876500018 | electronics engineering |
| 19 | milind pawar    | milind.pawar@college.edu    | 9876500019 | mechanical engineering  |
| 20 | rekha more      | rekha.more@college.edu      | 9876500020 | civil engineering       |
| 21 | ajay chavan     | ajay.chavan@college.edu     | 9876500021 | computer engineering    |
| 22 | seema patil     | seema.patil@college.edu     | 9876500022 | information technology  |
| 23 | prashant jadhav | prashant.jadhav@college.edu | 9876500023 | electronics engineering |
| 24 | manisha shinde  | manisha.shinde@college.edu  | 9876500024 | mechanical engineering  |
| 25 | dilip pawar     | dilip.pawar@college.edu     | 9876500025 | civil engineering       |
| 26 | swara joshi     | swara.joshi@college.edu     | 9876500026 | computer engineering    |
| 27 | rohit more      | rohit.more@college.edu      | 9876500027 | information technology  |
| 28 | madhuri patil   | madhuri.patil@college.edu   | 9876500028 | electronics engineering |
| 29 | sanjay shinde   | sanjay.shinde@college.edu   | 9876500029 | mechanical engineering  |
| 30 | vandana pawar   | vandana.pawar@college.edu   | 9876500030 | civil engineering       |
| 31 | ganesh kadam    | ganesh.kadam@college.edu    | 9876500031 | computer engineering    |
| 32 | shilpa more     | shilpa.more@college.edu     | 9876500032 | information technology  |
| 33 | rahul patil     | rahul.patil@college.edu     | 9876500033 | electronics engineering |
| 34 | supriya jadhav  | supriya.jadhav@college.edu  | 9876500034 | mechanical engineering  |
| 35 | bharat shinde   | bharat.shinde@college.edu   | 9876500035 | civil engineering       |
| 36 | archana pawar   | archana.pawar@college.edu   | 9876500036 | computer engineering    |
| 37 | yogesh more     | yogesh.more@college.edu     | 9876500037 | information technology  |
| 38 | komal patil     | komal.patil@college.edu     | 9876500038 | electronics engineering |
| 39 | santosh jadhav  | santosh.jadhav@college.edu  | 9876500039 | mechanical engineering  |
| 40 | minal shinde    | minal.shinde@college.edu    | 9876500040 | civil engineering       |
| 41 | sunil pawar     | sunil.pawar@college.edu     | 9876500041 | computer engineering    |
| 42 | rutuja more     | rutuja.more@college.edu     | 9876500042 | information technology  |
| 43 | vishal patil    | vishal.patil@college.edu    | 9876500043 | electronics engineering |
| 44 | ashwini jadhav  | ashwini.jadhav@college.edu  | 9876500044 | mechanical engineering  |
| 45 | shweta shinde   | shweta.shinde@college.edu   | 9876500045 | civil engineering       |
| 46 | mahendra pawar  | mahendra.pawar@college.edu  | 9876500046 | computer engineering    |
| 47 | sakshi more     | sakshi.more@college.edu     | 9876500047 | information technology  |
| 48 | tejas patil     | tejas.patil@college.edu     | 9876500048 | electronics engineering |
| 49 | nikita jadhav   | nikita.jadhav@college.edu   | 9876500049 | mechanical engineering  |
| 50 | omkar shinde    | omkar.shinde@college.edu    | 9876500050 | civil engineering       |
+----+-----------------+-----------------------------+------------+-------------------------+
50 rows in set (0.00 sec)

mysql> select * from membership;
+------------+---------+------------+-------------+--------+
| student_id | club_id | join_date  | role        | status |
+------------+---------+------------+-------------+--------+
|          1 |       1 | 2025-07-10 | member      | active |
|          2 |       2 | 2025-07-12 | member      | active |
|          3 |       3 | 2025-07-15 | coordinator | active |
|          4 |       4 | 2025-07-18 | member      | active |
|          5 |       5 | 2025-07-20 | member      | active |
|          6 |       6 | 2025-07-22 | member      | active |
|          7 |       7 | 2025-07-25 | coordinator | active |
|          8 |       8 | 2025-07-27 | member      | active |
|          9 |       9 | 2025-08-01 | member      | active |
|         10 |      10 | 2025-08-03 | member      | active |
|         11 |      11 | 2025-08-05 | coordinator | active |
|         12 |      12 | 2025-08-07 | member      | active |
|         13 |      13 | 2025-08-10 | member      | active |
|         14 |      14 | 2025-08-12 | member      | active |
|         15 |      15 | 2025-08-15 | coordinator | active |
|         16 |      16 | 2025-08-17 | member      | active |
|         17 |      17 | 2025-08-20 | member      | active |
|         18 |      18 | 2025-08-22 | member      | active |
|         19 |      19 | 2025-08-25 | coordinator | active |
|         20 |      20 | 2025-08-27 | member      | active |
|         21 |      21 | 2025-09-01 | member      | active |
|         22 |      22 | 2025-09-03 | member      | active |
|         23 |      23 | 2025-09-05 | coordinator | active |
|         24 |      24 | 2025-09-07 | member      | active |
|         25 |      25 | 2025-09-10 | member      | active |
|         26 |      26 | 2025-09-12 | member      | active |
|         27 |      27 | 2025-09-15 | coordinator | active |
|         28 |      28 | 2025-09-17 | member      | active |
|         29 |      29 | 2025-09-20 | member      | active |
|         30 |      30 | 2025-09-22 | member      | active |
|         31 |      31 | 2025-09-25 | coordinator | active |
|         32 |      32 | 2025-09-27 | member      | active |
|         33 |      33 | 2025-09-28 | member      | active |
|         34 |      34 | 2025-09-29 | member      | active |
|         35 |      35 | 2025-09-30 | coordinator | active |
|         36 |      36 | 2025-10-01 | member      | active |
|         37 |      37 | 2025-10-02 | member      | active |
|         38 |      38 | 2025-10-03 | member      | active |
|         39 |      39 | 2025-10-04 | coordinator | active |
|         40 |      40 | 2025-10-05 | member      | active |
|         41 |      41 | 2025-10-06 | member      | active |
|         42 |      42 | 2025-10-07 | member      | active |
|         43 |      43 | 2025-10-08 | coordinator | active |
|         44 |      44 | 2025-10-09 | member      | active |
|         45 |      45 | 2025-10-10 | member      | active |
|         46 |      46 | 2025-10-11 | member      | active |
|         47 |      47 | 2025-10-12 | coordinator | active |
|         48 |      48 | 2025-10-13 | member      | active |
|         49 |      49 | 2025-10-14 | member      | active |
|         50 |      50 | 2025-10-15 | member      | active |
+------------+---------+------------+-------------+--------+
50 rows in set (0.00 sec)

mysql> select * from participation;
+------------+----------+------------+----------------------+-------------+
| student_id | event_id | attendance | feedback             | certificate |
+------------+----------+------------+----------------------+-------------+
|          1 |        1 | present    | excellent event      | yes         |
|          2 |        2 | present    | very informative     | yes         |
|          3 |        3 | present    | enjoyed the event    | yes         |
|          4 |        4 | absent     | could not attend     | no          |
|          5 |        5 | present    | very enjoyable       | yes         |
|          6 |        6 | present    | well organized       | yes         |
|          7 |        7 | present    | creative exhibition  | yes         |
|          8 |        8 | present    | good experience      | yes         |
|          9 |        9 | present    | great competition    | yes         |
|         10 |       10 | absent     | could not attend     | no          |
|         11 |       11 | present    | excellent workshop   | yes         |
|         12 |       12 | present    | useful seminar       | yes         |
|         13 |       13 | present    | exciting hackathon   | yes         |
|         14 |       14 | present    | very useful          | yes         |
|         15 |       15 | present    | fun tournament       | yes         |
|         16 |       16 | absent     | schedule conflict    | no          |
|         17 |       17 | present    | interesting quiz     | yes         |
|         18 |       18 | present    | good initiative      | yes         |
|         19 |       19 | present    | meaningful activity  | yes         |
|         20 |       20 | present    | informative session  | yes         |
|         21 |       21 | present    | excellent exhibition | yes         |
|         22 |       22 | absent     | could not attend     | no          |
|         23 |       23 | present    | helpful workshop     | yes         |
|         24 |       24 | present    | enjoyed the films    | yes         |
|         25 |       25 | present    | good seminar         | yes         |
|         26 |       26 | present    | challenging contest  | yes         |
|         27 |       27 | present    | innovative projects  | yes         |
|         28 |       28 | absent     | could not attend     | no          |
|         29 |       29 | present    | interesting projects | yes         |
|         30 |       30 | present    | good exhibition      | yes         |
|         31 |       31 | present    | useful projects      | yes         |
|         32 |       32 | present    | informative session  | yes         |
|         33 |       33 | absent     | could not attend     | no          |
|         34 |       34 | present    | enjoyed competition  | yes         |
|         35 |       35 | present    | great show           | yes         |
|         36 |       36 | present    | very enjoyable       | yes         |
|         37 |       37 | present    | important awareness  | yes         |
|         38 |       38 | present    | good challenge       | yes         |
|         39 |       39 | present    | great tournament     | yes         |
|         40 |       40 | absent     | could not attend     | no          |
|         41 |       41 | present    | well organized       | yes         |
|         42 |       42 | present    | interesting matches  | yes         |
|         43 |       43 | present    | great tournament     | yes         |
|         44 |       44 | present    | wonderful experience | yes         |
|         45 |       45 | absent     | could not attend     | no          |
|         46 |       46 | present    | useful workshop      | yes         |
|         47 |       47 | present    | very informative     | yes         |
|         48 |       48 | present    | excellent exhibition | yes         |
|         49 |       49 | present    | great workshop       | yes         |
|         50 |       50 | present    | valuable symposium   | yes         |
+------------+----------+------------+----------------------+-------------+
50 rows in set (0.00 sec)

mysql> select * from student;
+----+------------------+------------------------------+------------+-------------------------+------+
| id | name             | email                        | phone      | branch                  | year |
+----+------------------+------------------------------+------------+-------------------------+------+
|  1 | aarav patil      | aarav.patil@student.edu      | 9765400001 | computer engineering    |    2 |
|  2 | saanvi joshi     | saanvi.joshi@student.edu     | 9765400002 | information technology  |    2 |
|  3 | vihaan shinde    | vihaan.shinde@student.edu    | 9765400003 | electronics engineering |    3 |
|  4 | ananya pawar     | ananya.pawar@student.edu     | 9765400004 | computer engineering    |    1 |
|  5 | aditya more      | aditya.more@student.edu      | 9765400005 | mechanical engineering  |    4 |
|  6 | ishita patil     | ishita.patil@student.edu     | 9765400006 | civil engineering       |    2 |
|  7 | aryan jadhav     | aryan.jadhav@student.edu     | 9765400007 | computer engineering    |    3 |
|  8 | diya shinde      | diya.shinde@student.edu      | 9765400008 | information technology  |    1 |
|  9 | atharva pawar    | atharva.pawar@student.edu    | 9765400009 | electronics engineering |    4 |
| 10 | riya more        | riya.more@student.edu        | 9765400010 | computer engineering    |    2 |
| 11 | vedant patil     | vedant.patil@student.edu     | 9765400011 | mechanical engineering  |    3 |
| 12 | myra joshi       | myra.joshi@student.edu       | 9765400012 | information technology  |    2 |
| 13 | rohan shinde     | rohan.shinde@student.edu     | 9765400013 | civil engineering       |    1 |
| 14 | tanvi pawar      | tanvi.pawar@student.edu      | 9765400014 | computer engineering    |    4 |
| 15 | om patil         | om.patil@student.edu         | 9765400015 | electronics engineering |    2 |
| 16 | avani jadhav     | avani.jadhav@student.edu     | 9765400016 | information technology  |    3 |
| 17 | siddharth more   | siddharth.more@student.edu   | 9765400017 | computer engineering    |    1 |
| 18 | ishani shinde    | ishani.shinde@student.edu    | 9765400018 | mechanical engineering  |    2 |
| 19 | harsh pawar      | harsh.pawar@student.edu      | 9765400019 | civil engineering       |    3 |
| 20 | kavya patil      | kavya.patil@student.edu      | 9765400020 | computer engineering    |    4 |
| 21 | yash jadhav      | yash.jadhav@student.edu      | 9765400021 | information technology  |    2 |
| 22 | manya more       | manya.more@student.edu       | 9765400022 | electronics engineering |    1 |
| 23 | sahil shinde     | sahil.shinde@student.edu     | 9765400023 | computer engineering    |    3 |
| 24 | pranali pawar    | pranali.pawar@student.edu    | 9765400024 | civil engineering       |    2 |
| 25 | akshat patil     | akshat.patil@student.edu     | 9765400025 | mechanical engineering  |    4 |
| 26 | sakshi jadhav    | sakshi.jadhav@student.edu    | 9765400026 | computer engineering    |    1 |
| 27 | kunal more       | kunal.more@student.edu       | 9765400027 | information technology  |    3 |
| 28 | shruti shinde    | shruti.shinde@student.edu    | 9765400028 | electronics engineering |    2 |
| 29 | manav pawar      | manav.pawar@student.edu      | 9765400029 | computer engineering    |    4 |
| 30 | mitali patil     | mitali.patil@student.edu     | 9765400030 | civil engineering       |    1 |
| 31 | raj jadhav       | raj.jadhav@student.edu       | 9765400031 | mechanical engineering  |    2 |
| 32 | priya more       | priya.more@student.edu       | 9765400032 | computer engineering    |    3 |
| 33 | atharva shinde   | atharva.shinde@student.edu   | 9765400033 | information technology  |    4 |
| 34 | neha pawar       | neha.pawar@student.edu       | 9765400034 | electronics engineering |    1 |
| 35 | tejas patil      | tejas.patil@student.edu      | 9765400035 | computer engineering    |    2 |
| 36 | rutuja jadhav    | rutuja.jadhav@student.edu    | 9765400036 | civil engineering       |    3 |
| 37 | suyog more       | suyog.more@student.edu       | 9765400037 | mechanical engineering  |    4 |
| 38 | isha shinde      | isha.shinde@student.edu      | 9765400038 | computer engineering    |    1 |
| 39 | akshay pawar     | akshay.pawar@student.edu     | 9765400039 | information technology  |    2 |
| 40 | gargi patil      | gargi.patil@student.edu      | 9765400040 | electronics engineering |    3 |
| 41 | swaraj jadhav    | swaraj.jadhav@student.edu    | 9765400041 | computer engineering    |    4 |
| 42 | sneha more       | sneha.more@student.edu       | 9765400042 | civil engineering       |    1 |
| 43 | mohit shinde     | mohit.shinde@student.edu     | 9765400043 | mechanical engineering  |    2 |
| 44 | saniya pawar     | saniya.pawar@student.edu     | 9765400044 | computer engineering    |    3 |
| 45 | prathamesh patil | prathamesh.patil@student.edu | 9765400045 | information technology  |    4 |
| 46 | ashwini jadhav   | ashwini.jadhav@student.edu   | 9765400046 | electronics engineering |    1 |
| 47 | girish more      | girish.more@student.edu      | 9765400047 | computer engineering    |    2 |
| 48 | vaishnavi shinde | vaishnavi.shinde@student.edu | 9765400048 | civil engineering       |    3 |
| 49 | shubham pawar    | shubham.pawar@student.edu    | 9765400049 | mechanical engineering  |    4 |
| 50 | gauri patil      | gauri.patil@student.edu      | 9765400050 | computer engineering    |    2 |
+----+------------------+------------------------------+------------+-------------------------+------+
50 rows in set (0.00 sec)

mysql>
