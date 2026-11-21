from behave import given, when, then
from registration import Student, RegistrationError

@given('a student with ID "{student_id}"')
def step_given_student(context, student_id):
    context.student = Student(student_id)
    context.error = None

@given('the student already has {hours:d} registered hours')
def step_given_hours(context, hours):
    context.student.register("EXISTING", hours)

@given('the student has registered for "{code}" worth {hours:d} hours')
def step_given_registered(context, code, hours):
    context.student.register(code, hours)

@when('the student registers for "{code}" worth {hours:d} hours')
def step_when_register(context, code, hours):
    try:
        context.student.register(code, hours)
    except RegistrationError as e:
        context.error = str(e)

@when('the student registers again for "{code}" worth {hours:d} hours')
def step_when_register_again(context, code, hours):
    try:
        context.student.register(code, hours)
    except RegistrationError as e:
        context.error = str(e)

@when('the student drops "{code}"')
def step_when_drop(context, code):
    context.student.drop(code)

@then('the student has {hours:d} registered hours')
def step_then_hours(context, hours):
    assert context.student.total_hours == hours

@then('the registration is refused with "{message}"')
def step_then_refused(context, message):
    assert context.error == message