import React from "react";
import Sidebar from "./Sidebar";

export default function DashboardWrapper({ children }) {
  return (
    <div className="dashboard__wrapper">
      <Sidebar />
      <main>{children}</main>
    </div>
  );
}
