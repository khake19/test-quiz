import React from 'react';
import { BrowserRouter as Router, Route, Link } from "react-router-dom";

const App = () => (
  <Router>
    <div>
      <ul>
        <li>
          <Link to="/">Home</Link>
        </li>
        <li>
          <Link to="/quiz">Quiz</Link>
        </li>
        <li>
          <Link to="/admin">Admin</Link>
        </li>
      </ul>

      <hr />

      <Route exact path="/" component={Home} />
      <Route path="/quiz" component={Quiz} />
      <Route path="/admin" component={Admin} />
    </div>
  </Router>
);

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
    Welcome to Quiz master
  </div>
);

const Quiz = () => (
  <div>
    Here's your quiz!

    <form>
      { questions.map(question => <QuizQuestionItem question={question} />) }

      <button type="submit">Submit</button>
    </form>
  </div>
);

const QuizQuestionItem = ({question}) => (
  <div>
    <p>{question.question}</p>
    <input type="text"/>
  </div>
)

const Admin = () => (
  <div>
    Update quiz questions here

    { questions.map(question => <AdminQuestionItem question={question} />) }
  </div>
);

const AdminQuestionItem = ({question}) => (
  <div>
    <dl>
      <dt>{question.question}</dt>
      <dd>{question.answer}</dd>
    </dl>
    <p>
      <a href="#">Edit</a>
      <a href="#">Delete</a>
    </p>
  </div>
)

export default App;
