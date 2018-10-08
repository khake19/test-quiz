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
      <div className="header">
        <Link to="/" className="logo">
          <h1>Quipper</h1>
        </Link>
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
const questions = [
  {
    id: 1,
    question: "What is the capital of Malaysia?",
    answer: "Kuala Lumpur",
  },
  {
    id: 2,
    question: "How many letters are there in the English alphabet?",
    answer: "26",
  },
  {
    id: 3,
    question: "Who are snow white's friends?",
    answer: "7 dwarves",
  },
]

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
  <div className="quiz">
    <form>
      {/**
          TODO:

          Quiz should show one question at a time and in random order.
        **/}
      <QuizQuestionItem question={questions[0]} />

      {/**
          TODO:

          Pressing "Submit" button should send the answers to the API
        **/}

      <div className="result">
        Correct
        {/**
            TODO:

            Once user submits an answer,
            we should show if their answer it correct or incorrect.
          **/}
      </div>

      <button type="submit" className="submit">Submit</button>
    </form>
  </div>
);

const QuizQuestionItem = ({question}) => (
  <div>
    <strong>Question</strong>
    <p>{question.question}</p>

    <strong>Answer</strong>
    <input type="text"/>
  </div>
)

const Admin = () => (
  <div>
    <table border="1">
      <tr>
        <th>Question</th>
        <th>Answer</th>
        <th>Edit</th>
        <th>Delete</th>
      </tr>
      { questions.map(question => <AdminQuestionItem question={question} />) }
    </table>
    <a href="#">Add question</a>
  </div>
);

const AdminQuestionItem = ({question}) => (
  <tr>
    <td>{question.question}</td>
    <td>{question.answer}</td>
    <td>
      {/**
          TODO:

          Pressing "Edit" button should allow user to edit questions and answers
        **/}
      <a href="#">Edit</a>
    </td>
    <td>
      {/**
          TODO:

          Pressing "Delete" button should remove the question
        **/}
      <a href="#">Delete</a>
    </td>
  </tr>
)

export default App;
