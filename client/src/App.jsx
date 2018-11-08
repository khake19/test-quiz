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
    <div className="container">
      <div className="header">
        <Link to="/" className="logo">
          <h1>Quipper</h1>
        </Link>
      </div>

      <Route exact path="/" component={Home} />
      <Route path="/quiz" component={Quiz} />
    </div>
  </Router>
);

/**
 *  These questions are currently hardcoded.
 *  [LVL1-QUIZ]
 *  TODO: Get the question list from the API
 **/
const questions = [{
  id: 1,
  content: "What is the capital of Malaysia?",
  answer: "Kuala Lumpur",
},{
  id: 2,
  content: "How many letters are there in the English alphabet?",
  answer: "26",
},{
  id: 3,
  content: "Who are snow white's friends?",
  answer: "7 dwarves",
}]

const Home = () => (
  <nav className="home-navigation">
    <ul>
      <li><Link to="/quiz">Answer questions</Link></li>
    </ul>
  </nav>
);

const Quiz = ({question}) => (
  <div className="quiz">
    <form>
      {
        /**
          TODO:
          [LVL1-QUIZ]
          Quiz should show one question at a time and in random order.
        **/
      }
      <QuizQuestionItem question={questions[0]} />
      {
        /**
          TODO:
          [LVL1-QUIZ]
          Pressing "Submit" button should send the answers to the API
        **/
      }
      <button type="submit" className="submit">Submit</button>
    </form>
  </div>
);

const QuizQuestionItem = ({question}) => (
  <div className="quiz-item-container">
    <div className = "question-container">
      <strong className="question-title">Question</strong>
      <div className="question-content">{question.content}</div>
    </div>
    <div className="answer-container">
      <strong className="answer-title"> Answer</strong>
      <input className="answer-space" type="text"/>
      <div className="answer-result"> Correct
        {
          /**
            TODO:
            [LVL1-QUIZ]
            Once user submits an answer,
            we should show if their answer it correct or incorrect.
          **/
        }
      </div>
    </div>
  </div>
)

export default App;
