[Go back](user_stories/level_one.md)

## 2: Some changes

Thanks for the help on the previous specs! If you’re still up for it, our _Product Manager_ just passed by and asked us to add more features to the site. Would you mind taking care of it as well? You rock!

Now that you're able to populate questions via CRUD which you implemented in the previous level, we would like to use those questions created as question bank to create quizzes. For that, we need to give the user the ability to `create`, `read`, `update`, and `delete` quizzes. To clarify, a quiz is composed of one or more questions.

In addition to that, we would like to give ability to the user to select a quiz from a list and answer the questions in it in random order.

### Objectives

!> Search for the `[LVL2-QUIZ]` tags across the project. They will help you as a guide to focus on this level.

*   Implement a view for the user to create quizzes out of questions
    *   Provide API endpoints to `create`, `read`, `update` and `delete` quizzes. These endpoints shall then be called by the view.

    ![mockup](../img/quiz_catalog.png)

    ![mockup](../img/add_edit_quiz.png)

*   Implement a view that lists all quizzes created and allows user to select one of those to answer

    ![mockup](../img/quiz_list.png)

    *   Selecting a quiz will show the questions within it one at a time and in random order

    ![question mockup](../img/question.png)

!> Run the backend test suite using `bundle exec rspec --tag level_two` and do your best to cover all the specs.

[Next challenge](user_stories/level_three.md)
