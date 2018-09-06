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

const Home = () => (
  <div>
    Welcome to Quiz master
  </div>
);

const Quiz = () => (
  <div>
    Here's your quiz!
  </div>
);

const Admin = () => (
  <div>
    Update quiz questions here
  </div>
);

export default App;
