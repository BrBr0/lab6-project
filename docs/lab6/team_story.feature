Feature: Borrowing a book from the library

    Scenario: Borrow an available book
        Given the book "Clean Code" is available
        When the member borrows it for 14 days
        Then the book status becomes "borrowed"

    Scenario: Cannot borrow an unavailable book
        Given the book "Refactoring" is already borrowed
        When the member tries to borrow it
        Then the system shows "Book not available"

    Scenario: Return a borrowed book
        Given the member has borrowed "Clean Code"
        When the member returns it
        Then the book status becomes "available"