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
insert into readers(name,birthdate,address,phoneNumber)values
('Hành trình của Coder', '1985-11-20', 'TP.HCM', '09123456789'),
('Bí mật của Lập trình viên', '1970-03-15', 'Đà Nẵng', '08987654321'),
('Đường đến Tri thức', '1992-07-01', 'Hà Nội', '03456789012'),
('Truyền thuyết về Dữ liệu', '1965-09-28', 'Huế', '07778889990'),
('Cuộc phiêu lưu của Kỹ sư', '2001-01-05', 'Cần Thơ', '09012345678'),
('Mật mã của Thời gian', '1978-05-10', 'Hải Phòng', '09665554443'),
('Vũ trụ Ảo', '1989-12-24', 'Nha Trang', '08123456789'),
('Những giấc mơ Code', '1995-02-14', 'Biên Hòa', '03876543210'),
('Kỷ nguyên Số', '1962-08-08', 'Vũng Tàu', '09234567890'),
('Sự tích Coder','1998-03-27','Hà Nội',012345678999);

update readers
SET name = CONCAT(name, ' genZ')
where YEAR(birthdate) between 1990 and 2000;

select * from readers
where  YEAR(birthdate) < 1975;

CREATE TABLE readers (
    readerId INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    birthDate DATE NOT NULL CHECK (birthDate > '1900-01-01'),
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


