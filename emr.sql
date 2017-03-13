DROP TABLE IF EXISTS `pat_script`;
DROP TABLE IF EXISTS `pat_diag`;
DROP TABLE IF EXISTS `diagnosis`;
DROP TABLE IF EXISTS `prescriptions`;
DROP TABLE IF EXISTS `patients`;
DROP TABLE IF EXISTS `physicians`;

CREATE TABLE `physicians` (
 `id` int NOT NULL AUTO_INCREMENT,
 `fname` varchar(255) NOT NULL,
 `lname` varchar(255) NOT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `patients` (
 `id` int NOT NULL AUTO_INCREMENT,
 `pid` int,
 `fname` varchar(255) NOT NULL,
 `lname` varchar(255) NOT NULL,
 PRIMARY KEY (`id`),
 FOREIGN KEY (`pid`) REFERENCES physicians(`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE `prescriptions` (
 `id` int NOT NULL AUTO_INCREMENT,
 `name` varchar(255) NOT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `diagnosis` (
 `id` int NOT NULL AUTO_INCREMENT,
 `name` varchar(255) NOT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `pat_script` (
 `patid` int,
 `preid` int, 
 `pid` int NOT NULL,
 PRIMARY KEY (`patid`, `preid`),
 FOREIGN KEY (`pid`) REFERENCES physicians(`id`) ON UPDATE CASCADE,
 FOREIGN KEY (`patid`) REFERENCES patients(`id`) ON UPDATE CASCADE,
 FOREIGN KEY (`preid`) REFERENCES prescriptions(`id`) /*ON DELETE SET NULL*/ ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE `pat_diag` (
 `patid` int,
 `did` int, 
 PRIMARY KEY (`patid`, `did`),
 FOREIGN KEY (`patid`) REFERENCES patients(`id`) /*ON DELETE SET NULL*/ ON UPDATE CASCADE,
 FOREIGN KEY (`did`) REFERENCES diagnosis(`id`) /*ON DELETE SET NULL*/ ON UPDATE CASCADE
) ENGINE=InnoDB;

insert into `diagnosis` (`name`) values ('Fartitis'),('Dragon Pox'), ('Greyscale'), ('Lycanthropy'), ('Shame'), ('Vampiris'), ('Bendii Syndrome'), ('TS-19'), ('Stick It To the Man-Neosis'), ('Head-go-boom-boom-itis'), ('Croatoan virus'), ('Electrogonnorhea'), ('Bone-itis'), ('You are dead');
insert into `physicians` (`fname`,`lname`) values('Doc','Doctorson'),('Madi-Si','Entist'),('Franklin','Stein'),('J.','Eckle');
insert into  `prescriptions` (`name`) values('Medicintinol'),('Ice'),('Knuckle Sandwich'),('Suckin it Up');
insert into `patients`(`fname`,`lname`,`pid`) values ('John','Smith',1),('Ralph','Stevens',1);

/*Searches to find patients with general info, patients and all their diagnosis,patients and all their prescriptions, query to add/remove prescriptions, diagnosis, physician, ADD/REMOVE? patients */