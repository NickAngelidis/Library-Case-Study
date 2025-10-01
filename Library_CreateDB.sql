-- Create the database
CREATE DATABASE LibraryDB;
USE LibraryDB;

-- Authors table
CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Country VARCHAR(100)
);

-- Genres table
CREATE TABLE Genres (
    GenreID INT PRIMARY KEY AUTO_INCREMENT,
    GenreName VARCHAR(50) NOT NULL
);

-- Books table
CREATE TABLE Books (
	BookID INT PRIMARY KEY AUTO_INCREMENT, 
	Title VARCHAR(30) NOT NULL,
    AuthorID INT,
    GenreID INT,
    PublishedYear YEAR,
    CopiesAvailable INT DEFAULT 0,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID),
    FOREIGN KEY (GenreID) REFERENCES Genres(GenreID)
    );

-- Members table
CREATE TABLE Members (
    MemberID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    JoinDate DATE,
    City VARCHAR(100)
);

-- Borrowings table
CREATE TABLE Borrowings (
    BorrowID INT PRIMARY KEY AUTO_INCREMENT,
    BookID INT,
    MemberID INT,
    BorrowDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

 -- Insert Data
INSERT INTO Authors (Name, Country) VALUES
('George Orwell', 'United Kingdom'),
('Jane Austen', 'United Kingdom'),
('Mark Twain', 'United States'),
('J.K. Rowling', 'United Kingdom'),
('Ernest Hemingway', 'United States'),
('Haruki Murakami', 'Japan'),
('Agatha Christie', 'United Kingdom'),
('Leo Tolstoy', 'Russia'),
('Stephen King', 'United States'),
('Gabriel Garcia Marquez', 'Colombia');

INSERT INTO Genres (GenreName) VALUES
('Fiction'),
('Mystery'),
('Fantasy'),
('Classic'),
('Science Fiction'),
('Historical'),
('Thriller');

INSERT INTO Books (Title, AuthorID, GenreID, PublishedYear, CopiesAvailable) VALUES
('1984', 1, 1, 1949, 5),
('Pride and Prejudice', 2, 4, 1913, 3),
('Adventures of Huckleberry Finn', 3, 4, 1984, 4),
('Harry Potter 2', 4, 3, 1997, 7),
('The Old Man and the Sea', 5, 1, 1952, 3),
('Norwegian Wood', 6, 1, 1987, 4),
('Murder on the Orient Express', 7, 2, 1934, 6),
('War and Peace', 8, 6, 1969, 2),
('The Shining', 9, 7, 1977, 5),
('One Hundred Years of Solitude', 10, 1, 1967, 4),
('Animal Farm', 1, 1, 1945, 5),
('Carrie', 9, 7, 1974, 4);

INSERT INTO Members (Name, JoinDate, City) VALUES
('Alice Johnson', '2020-02-15', 'New York'),
('Bob Smith', '2021-05-10', 'Los Angeles'),
('Charlie Brown', '2019-08-21', 'Chicago'),
('Diana Prince', '2022-01-05', 'New York'),
('Edward Norton', '2020-09-12', 'Boston'),
('Fiona Apple', '2023-03-18', 'Seattle'),
('George Miller', '2018-11-22', 'Los Angeles'),
('Hannah Williams', '2024-04-30', 'Boston'),
('Ian McKellen', '2021-07-14', 'Chicago'),
('Julia Roberts', '2022-12-02', 'New York');

INSERT INTO Borrowings (BookID, MemberID, BorrowDate, ReturnDate) VALUES
(1, 1, '2024-01-10', '2024-01-28'),
(4, 2, '2024-02-15', '2024-03-05'),
(7, 3, '2024-02-20', '2024-03-30'),
(2, 4, '2024-03-01', '2024-03-20'),
(10, 5, '2024-03-05', '2024-03-30'),
(6, 6, '2024-03-12', '2024-04-05'),
(3, 7, '2024-04-01', '2024-04-29'),
(5, 8, '2024-04-10', '2024-05-20'),
(9, 9, '2024-05-01', '2024-05-25'),
(11, 10, '2024-05-05', '2024-06-15'),
(4, 1, '2024-06-01', '2024-06-25'),
(12, 3, '2024-06-10', '2024-07-20'),
(8, 5, '2024-07-15', '2024-08-15'),
(1, 2, '2024-07-20', '2024-08-10'),
(7, 6, '2024-08-01', NULL), -- still borrowed
(5, 7, '2024-08-15', '2024-09-30'),
(3, 8, '2024-09-01', NULL), -- still borrowed
(10, 9, '2024-09-05', '2024-09-29'),
(2, 10, '2024-09-15', NULL);





