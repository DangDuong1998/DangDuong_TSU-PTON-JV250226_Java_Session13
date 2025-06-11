CREATE DATABASE library_management;
USE library_management;

CREATE TABLE books (
    bookId INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL UNIQUE,
    author VARCHAR(50) NOT NULL,
    publishedYear YEAR NOT NULL,
    category VARCHAR(50) NOT NULL
);

CREATE TABLE reader (
    readerId INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    birthDate DATE NOT NULL CHECK (birthDate < CURRENT_DATE()),
    address VARCHAR(255),
    phoneNUmber VARCHAR(11)
);

CREATE TABLE borrows (
    borrowId INT AUTO_INCREMENT PRIMARY KEY,
    borrowDate DATE NOT NULL CHECK (borrowDate <= CURRENT_DATE()),
    returnDate DATE,
    bookId INT,
    readerId INT,
    FOREIGN KEY (bookId)
        REFERENCES books (bookId),
    FOREIGN KEY (readerId)
        REFERENCES reader (readerId)
);


