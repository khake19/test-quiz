## 1: The new one

Welcome! You must be the new one! You know the _Chief Technology Officer_? Well, he loves creating cool working applications! Actually, we have a bare-bones project that needs some tweaks but all of our devs are busy right now. Would you mind throwing us a hand? Thanks!

### Objectives

*   Implement endpoints for the user to `create`, `read`, `update`, and `delete` questions
    *   You do **NOT** need to implement a view for this! You can populate data for your app by running these endpoints through your terminal.
    *   We work using test-driven development and we have already set up the tests for you. You can check out `backend/spec/controllers/api/v1/questions_controller_spec.rb` to see what's expected of you in your implementation of the endpoints above.
*   Implement a quiz view for the user to view and answer the questions **one at a time** and in **random** order
    *   `client/src/App.jsx` is the main file you'll need to work on to implement the view. There are comments written there to guide you on what you need to do.
    *   We want to see your styling skills! Below is the mockup which indicates how the quiz should look like.
    ![question mockup](../img/question.png)
    *   Implement an answer-checking logic in the backend so that once the user provides an answer and submits, the app shall give immediate feedback on whether the answer provided is **correct** or **incorrect**

!> Search for the `[LVL1-QUIZ]` tags across the project; They will help you as a guide to focus on this level.

!> Run the backend test suite using `bundle exec rspec --tag level_one` and do your best to cover all the specs.

[Next challenge](user_stories/level_two.md)
