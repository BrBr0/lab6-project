Feature: Course registration
    As a student
    I want to register for courses
    So that I can build my timetable without breaking the rules

    Background:
        Given a student with ID "2023001"

    Scenario: Register within the limit
        When the student registers for "SET312" worth 3 hours
        Then the student has 3 registered hours

    Scenario: Refuse a course that breaks the 18-hour limit
        Given the student already has 15 registered hours
        When the student registers for "SET472" worth 4 hours
        Then the registration is refused with "credit-hour limit is 18"

    Scenario: Refuse a duplicate course
        Given the student has registered for "SET312" worth 3 hours
        When the student registers again for "SET312" worth 3 hours
        Then the registration is refused with "SET312 is already registered"

    Scenario: Drop a registered course
        Given the student has registered for "SET312" worth 3 hours
        When the student drops "SET312"
        Then the student has 0 registered hours