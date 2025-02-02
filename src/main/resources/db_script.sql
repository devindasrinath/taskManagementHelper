CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    user_name VARCHAR(50) NOT NULL,
    password TEXT NOT NULL,
    roles VARCHAR(50)[] NOT NULL
);

CREATE TABLE projects (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description TEXT
);

CREATE TABLE tasks (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description TEXT,
	estimation INTEGER NOT NULL DEFAULT 0,
	status VARCHAR(20) NOT NULL DEFAULT 'TODO',
    project_id INTEGER NOT NULL REFERENCES projects(id) ON DELETE CASCADE
);

CREATE TABLE project_user_mapping (
    id SERIAL PRIMARY KEY,
    project_id INTEGER NOT NULL REFERENCES projects(id) ON DELETE CASCADE,
    user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE tasks_user_mapping (
    id SERIAL PRIMARY KEY,
    task_id INTEGER NOT NULL REFERENCES tasks(id) ON DELETE CASCADE,
    user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE
);

INSERT INTO users(user_name, password, roles) 
VALUES ('admin', 'admin', '{admin,member}');
