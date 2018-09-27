/**
 *  This file contains the client-side implementation of Quiz Master.
 *
 *  Feel free to extract the application elements to their own files.
 *
 *  Search for the string "TODO:" to check which parts need to be implemented
 **/

import React from 'react';
import { BrowserRouter as Router, Route, Link } from "react-router-dom";

const App = () => (
  <Router>
    <div>
      <div class="header">
        <Link to="/" class="logo">Quipper</Link>
      </div>

      <Route exact path="/" component={Home} />
      <Route path="/quiz" component={Quiz} />
      <Route path="/admin" component={Admin} />
    </div>
  </Router>
);

/**
 *  These questions are currently hardcoded.
 *
 *  TODO: Get the question list from the API
 **/
const sampleQuestion = {
  id: 1,
  question: "What is the capital of Malaysia?",
  answer: "Kuala Lumpur",
}

const Home = () => (
  <div>
    <ul>
      <li>
        <Link to="/quiz">Answer questions</Link>
      </li>
      <li>
        <Link to="/admin">Manage questions</Link>
      </li>
    </ul>
  </div>
);

const Quiz = ({question}) => (
  <div class="quiz">
    <form>
      <strong>Question</strong>
      <p>{sampleQuestion.question}</p>

      <strong>Answer</strong>
      <input type="text"/>

      {/**
          TODO:

          Pressing "Submit" button should send the answers to the API
        **/}
      <button type="submit" class="submit">Submit</button>
    </form>
  </div>
);

const Admin = () => (
  <div>
    Update quiz questions here

    <AdminQuestionItem question={sampleQuestion} />)
  </div>
);

const AdminQuestionItem = ({question}) => (
  <div>
    <dl>
      <dt>{question.question}</dt>
      <dd>{question.answer}</dd>
    </dl>
    <p>
      {/**
          TODO:

          Pressing "Edit" button should allow user to edit questions and answers
        **/}
      <a href="#">Edit</a>
      {/**
          TODO:

          Pressing "Delete" button should remove the question
        **/}
      <a href="#">Delete</a>
    </p>
  </div>
)

export default App;
