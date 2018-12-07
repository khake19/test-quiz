## The new one

Welcome! You must be the new one! You know the _Chief Technology Officer_? Well, he loves creating cool applications! Actually, we have a bare-bones project that needs some tweaks, but all of our devs are busy right now. Would you mind throwing us a hand? Thanks!

### Objectives

*   **Implement endpoints for questions**
    *   We work using test-driven development and we have already set up the tests for you. You can check out `backend/spec/controllers/questions_controller_spec.rb` to see what's expected in your implementation of the endpoints. Please do **NOT** edit this file!
    *   Open `backend/controllers/api/questions_controller.rb` and write the necessary code needed to make the tests pass.
    *   You do **NOT** need to implement a view for this! You can populate data for your app by running these endpoints through your terminal.

*   **Implement answer-checking logic in the Question Model**
    *   Check out the tests written in `backend/spec/models/question_spec.rb` to see the specifications of the answer checker. Again, please do **NOT** edit this file.
    *   Write the code in `backend/models/question.rb` to make the tests pass.

*   **Implement the Quiz component for the view**
    *   `client/src/App.jsx` is the only file you'll need to work on. There are comments written there to guide you on what you need to do.
    *   The question currently shown is hard-coded. Show the actual questions present in the database by fetching them using the endpoints you implemented in the backend.
    *   Show only one question at a time! The `Next` button should allow the user of the app to go from one question to another.
    *   Clicking the `Submit` button will make the app check if the answer provided by the user is correct or not. The result should be shown to the user right away.

    ![question mockup](../img/question.png)

### Unit Test

!> We've provided unit test for backend side. Run the backend test suite using `bundle exec rspec` and do your best to cover all the specs.

!> For the front end part, we don't use unit test. Please follow the given mock up.
