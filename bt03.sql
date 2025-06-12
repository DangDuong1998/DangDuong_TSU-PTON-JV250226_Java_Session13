CREATE DATABASE library_management;
USE library_management;
drop table books;
drop table readers;
drop table borrows;
CREATE TABLE books (
    bookId INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL UNIQUE,
    author VARCHAR(50) NOT NULL,
    publishedYear YEAR NOT NULL,
    category VARCHAR(50) NOT NULL
);
alter table books
modify column publishedYear smallint not null;
insert into books (title, author, publishedYear, category) VALUES
-- ('A Tale of Two Cities', 'Charles Dickens', 1859, 'Historical Fiction'),
('Brave New World', 'Aldous Huxley', 1932, 'Dystopian'),
('The Great Gatsby', 'F. Scott Fitzgerald', 1925, 'Classic'),
('1984', 'George Orwell', 1949, 'Dystopian'),
('Animal Farm', 'George Orwell', 1945, 'Political Fiction'),
('The Catcher in the Rye', 'J.D. Salinger', 1951, 'Classic'),
('To Kill a Mockingbird', 'Harper Lee', 1960, 'Classic'),
('Pride and Prejudice', 'Jane Austen', 1813, 'Romance'),
('The Hobbit', 'J.R.R. Tolkien', 1937, 'Fantasy'),
('The Alchemist', 'Paulo Coelho', 1988, 'Adventure');

update books
set author = 'Đặng Thái Dương'
where bookId = 1;
SELECT * FROM books
WHERE title LIKE 'A%' OR title LIKE 'B%';


CREATE TABLE readers (
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
        REFERENCES readers (readerId)
);


