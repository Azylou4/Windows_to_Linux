-- Создание таблицы пользователей
CREATE TABLE Users (
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    department VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

-- Создание таблицы компьютеров
CREATE TABLE Computers (
    computer_id SERIAL PRIMARY KEY,
    inventory_number VARCHAR(50) UNIQUE NOT NULL,
    computer_name VARCHAR(100) NOT NULL,
    migration_status VARCHAR(50) NOT NULL,
    start_date DATE,
    completed_date DATE,
    user_id INTEGER,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Создание таблицы инцидентов
CREATE TABLE Incidents (
    incident_id SERIAL PRIMARY KEY,
    computer_id INTEGER,
    description TEXT NOT NULL,
    status VARCHAR(50) NOT NULL,
    reported_date DATE NOT NULL,
    FOREIGN KEY (computer_id) REFERENCES Computers(computer_id)
);

-- Добавление пользователей
INSERT INTO Users (name, department, email) VALUES
('Dmitry Filin', 'Finance', 'dima.fil1234@bank.com'),
('Anna Po', 'IT', 'poan1999@bank.com'),
('Firan Portu', 'IT', 'portufiran24@bank.com'),
('Eugene Artamonov', 'HR', 'eugenearta111155@bank.com');

-- Добавление компьютеров
INSERT INTO Computers (inventory_number, computer_name, migration_status, start_date, completed_date, user_id) VALUES
('INV001-100142', 'Dima-PC', 'Pending', '2024-05-01', NULL, 1),
('INV005-402518', 'Anna-PC', 'Pending', '2024-06-01', NULL, 2),
('INV004-518936', 'Firan-PC', 'In Progress', '2024-06-04', NULL, 3),
('INV005-951829', 'EugeneArta-PC', 'Completed', '2024-06-04', '2024-06-05', 4);

-- Добавление инцидентов
INSERT INTO Incidents (computer_id, description, status, reported_date) VALUES
(1, 'Network issue during migration', 'Open', '2024-05-01'),
(2, 'Software compatibility problem', 'Resolved', '2024-05-05'),
(3, 'Data backup failed', 'In Progress', '2024-05-10');