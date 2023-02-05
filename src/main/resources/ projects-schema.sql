DROP TABLE IF EXISTS material;
DROP TABLE IF EXISTS step;
DROP TABLE IF EXISTS project_category;
DROP TABLE IF EXISTS project;
DROP TABLE IF EXISTS category;

CREATE TABLE category (
category_id INT AUTO_INCREMENT NOT NULL,
category_name VARCHAR(128) NOT NULL,
PRIMARY KEY (category_id)
);

CREATE TABLE project (
project_id INT AUTO_INCREMENT NOT NULL,
project_name VARCHAR(128) NOT NULL,
estimated_hours DECIMAL(7,2) NULL,
actual_hours DECIMAL(7,2) NULL,
difficulty INT NULL,
notes TEXT NULL,
PRIMARY KEY (project_id)
);

CREATE TABLE project_category (
project_id INT  NOT NULL,
category_id INT NOT NULL,
FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE,
FOREIGN KEY (category_id) REFERENCES category (category_id) ON DELETE CASCADE,
UNIQUE KEY (project_id, category_id)
);

CREATE TABLE step (
step_id INT AUTO_INCREMENT NOT NULL,
project_id INT NOT NULL,
step_text TEXT NOT NULL,
step_order INT NOT NULL,
PRIMARY KEY (step_id),
FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE
);

CREATE TABLE material (
material_id INT AUTO_INCREMENT NOT NULL,
project_id INT NOT NULL,
material_name VARCHAR(128) NOT NULL,
num_required INT NULL,
cost DECIMAL(7,2) NULL,
PRIMARY KEY (material_id),
FOREIGN KEY (project_id) REFERENCES project (project_id)
);


INSERT INTO material (project_id, material_name,num_required,cost) VALUES (2, 'Door hangers', 1, 3.00);
INSERT INTO material (project_id, material_name,num_required,cost) VALUES (1, 'Closet hangers', 3, 9.00);
INSERT INTO material (project_id, material_name,num_required,cost) VALUES (3, 'Door', 1, 10.00);
INSERT INTO material (project_id, material_name,num_required,cost) VALUES (4, 'paint', 1, 12.00);

INSERT INTO step (project_id, step_text ,step_order) VALUES (2, 'Align hangers on opening side', 1);
INSERT INTO step (project_id, step_text ,step_order) VALUES (1, 'Align hangers on closet', 1);
INSERT INTO step (project_id, step_text ,step_order) VALUES (3, 'take out the old door', 1);
INSERT INTO step (project_id, step_text ,step_order) VALUES (4, 'clean de wall', 1);

INSERT INTO category  (category_id,category_name)VALUES (1, 'closet');
INSERT INTO category  (category_id,category_name)VALUES (2, 'door');
INSERT INTO category  (category_id,category_name)VALUES (3, 'door');
INSERT INTO category  (category_id,category_name)VALUES (4, 'repair');

INSERT INTO project_category (project_id, category_id)VALUES (1,1);
INSERT INTO project_category (project_id, category_id)VALUES (2,2);
INSERT INTO project_category (project_id, category_id)VALUES (3,3);
INSERT INTO project_category (project_id, category_id)VALUES (4,4);
