import React from "react";
import {
  BrowserRouter as Router,
  Switch,
  Route,
  Redirect,
} from "react-router-dom";
import "bootstrap/dist/css/bootstrap-grid.min.css";
import "./main.scss";

// Components
import { AuthProvider } from "./contexts/AuthContext";
import PrivateRoute from "./shared_components/PrivateRoute";
import {
  LoginPage,
  DashboardPage,
  LandingPage,
  ClustersPage,
  ComplaintsPage,
} from "./pages";

const AirPowerApp = () => {
  return (
    <>
      <Router>
        <AuthProvider>
          <Switch>
            <Route path="/" exact={true} component={LandingPage} />
            <PrivateRoute
              exact
              path="/dashboard/home"
              component={DashboardPage}
            />
            <PrivateRoute
              exact
              path="/dashboard/cluster"
              component={ClustersPage}
            />
            <PrivateRoute
              exact
              path="/dashboard/complaints"
              component={ComplaintsPage}
            />
            <Route path="/login" component={LoginPage} />
            <Redirect from="*" to="/dashboard/home" />
          </Switch>
        </AuthProvider>
      </Router>
    </>
  );
};

export default AirPowerApp;
