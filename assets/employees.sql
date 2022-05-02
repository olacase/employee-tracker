DROP DATABASE IF EXISTS employees;
CREATE DATABASE employees;
USE employees;
CREATE TABLE department (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(30) UNIQUE NOT NULL
);
CREATE TABLE role (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(30) UNIQUE NOT NULL,
  salary DECIMAL UNSIGNED NOT NULL,
  department_id INT UNSIGNED NOT NULL,
  INDEX dep_ind (department_id),
  CONSTRAINT fk_department FOREIGN KEY (department_id) REFERENCES department(id) ON DELETE CASCADE
);
CREATE TABLE employee (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  role_id INT UNSIGNED NOT NULL,
  INDEX role_ind (role_id),
  CONSTRAINT fk_role FOREIGN KEY (role_id) REFERENCES role(id) ON DELETE CASCADE,
  manager_id INT UNSIGNED,
  INDEX man_ind (manager_id),
  CONSTRAINT fk_manager FOREIGN KEY (manager_id) REFERENCES employee(id) ON DELETE SET NULL
);
use employees;
INSERT INTO department
    (name)
VALUES
    ('Operations'),
    ('Sales'),
    ('Accounting'),
    ('Managers');
INSERT INTO role
    (title, salary, department_id)
VALUES
    ('General Manager', 11000000, 1),
    ('Sales Lead', 4000000, 1),
    ('VP Production', 15000000, 2),
    ('Senior IT Analyst', 8000000, 2),
    ('Chief Analyst', 7000000, 3),
    ('SocialMedia Specialist', 3000000, 3),
    ('Managing Director', 45000000, 4),
    ('MD PA', 25000000, 4);
INSERT INTO employee
    (first_name, last_name, role_id, manager_id)
VALUES
    ('Olamide', 'Bello', 1, NULL),
    ('Peniel', 'Bello', 2, 1),
    ('Margaret', 'Michael', 3, NULL),
    ('Victoria', 'Francis', 4, 3),
    ('Anissa', 'Earl', 5, NULL),
    ('Pearson', 'jackson', 6, 5),
    ('Freddy', 'Kruger', 7, NULL),
    ('Maggie', 'Ricka', 8, 7);
    
