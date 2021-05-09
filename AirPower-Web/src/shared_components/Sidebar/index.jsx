import React from "react";
import "./styles/index.scss";

import { NavLink, Link } from "react-router-dom";
import { useAuth } from "../../contexts/AuthContext";

const Sidebar = () => {
  const { logout } = useAuth();

  return (
    <nav className="sidebar__wrapper">
      <ul className="sidebar__nav">
        <li className="sidebar__item  sidebar__logo">
          <Link to="/" className="sidebar__item__link ">
            <img
              src="../../images/logo-light.png"
              alt="AirPower"
              className="sidebar__logo__img"
            />
          </Link>
          <span className="sidebar__text">Home</span>
        </li>

        <li className="sidebar__item">
          <NavLink
            to="/dashboard/home"
            href="#landing-section"
            className="sidebar__item__link"
            activeClassName="sidebar__item__link active"
          >
            <i className="fas fa-chart-line"></i>
          </NavLink>
          <span className="sidebar__text">Dashboard</span>
        </li>

        <li className="sidebar__item">
          <NavLink
            to="/dashboard/cluster"
            href="#landing-section"
            className="sidebar__item__link"
            activeClassName="sidebar__item__link active"
          >
            <i className="fas fa-map"></i>
          </NavLink>
          <span className="sidebar__text">Clusters</span>
        </li>

        <li className="sidebar__item">
          <NavLink
            to="/dashboard/complaints"
            href="#landing-section"
            className="sidebar__item__link"
            activeClassName="sidebar__item__link active"
          >
            <i className="fas fa-exclamation-triangle"></i>
          </NavLink>
          <span className="sidebar__text">Complaints</span>
        </li>

        <li className="sidebar__item">
          <div
            style={{ cursor: "pointer" }}
            onClick={() => logout()}
            className="sidebar__item__link"
          >
            <i className="fas fa-sign-out-alt"></i>
          </div>
          <span className="sidebar__text">Complaints</span>
        </li>
      </ul>
    </nav>
  );
};

export default Sidebar;
