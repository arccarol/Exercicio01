CREATE DATABASE exProjeto 
GO
USE exProjeto

CREATE TABLE project(
id   INT NOT NULL IDENTITY(10001, 1),
nome    VARCHAR(45) NOT NULL,
discription  VARCHAR(45) NOT NULL,
datap  DATE NOT NULL CHECK (datap > '2014-09-01')
PRIMARY KEY (id)
)
GO 
CREATE TABLE users (
id_users INT NOT NULL IDENTITY(1, 1),
nome VARCHAR(45) NOT NULL,
username VARCHAR(45) NOT NULL UNIQUE,
password_user VARCHAR(45) NOT NULL DEFAULT '123mudar',
email VARCHAR(45) NOT NULL
PRIMARY KEY (id_users)
)
GO 
CREATE TABLE users_has_projects(
id   INT NOT NULL,
id_users   INT NOT NULL,
FOREIGN KEY (id) REFERENCES project(id),
FOREIGN KEY (id_users) REFERENCES users(id_users)
)

DROP TABLE users_has_projects;

ALTER TABLE users
ALTER COLUMN username VARCHAR(10);

ALTER TABLE users
ALTER COLUMN password_user VARCHAR(8);


INSERT INTO users VALUES 
('Maria', 'Rh_maria', '123mudar', 'maria@empresa.com'),
('Paulo', 'Ti_paulo', '123@456', 'paulo@empresa.com'),
('Ana', 'Rh_ana', '123mudar', 'ana@empresa.com'),
('Clara', 'Ti_clara', '123mudar', 'clara@empresa.com'),
('Aparecido', 'Rh_apareci', '55@1cido', 'aparecido@empresa.com')

SELECT *
FROM users

INSERT INTO project VALUES 
('Re-folha', 'Refatoração das Folhas', '05/09/2014'),
('Manuntenção PCs', 'Manuntenção PCs', '06/09/2014'),
('Auditoria', 'NULL', '07/09/2014')

SELECT *
FROM project

INSERT INTO users_has_projects VALUES
(10001, 1),
(10001, 5),
(10003, 3),
(10002, 4),
(10002, 2)

SELECT *
FROM users_has_projects

UPDATE project
SET datap = '2014-09-12'
WHERE id = 10002;

UPDATE users
SET username = 'Rh_cido'
WHERE id_users = 5;

UPDATE users
SET password_user = '888@*'
WHERE username = 'Rh_maria' AND password_user = '123mudar';

DELETE FROM users_has_projects
WHERE id_users = 2 AND id = 10002;