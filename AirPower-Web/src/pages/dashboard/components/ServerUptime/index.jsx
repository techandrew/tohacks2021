import React from "react";

export default function ServerUptimeCard() {
  return (
    <div className="col-md-6">
      <div className="card widget-flat">
        <div className="card-body">
          <div className="float-right">
            <i className="mdi mdi-cart-plus widget-icon"></i>
          </div>
          <h5
            className="text-muted font-weight-normal mt-0"
            title="Number of Orders"
          >
            Server Uptime
          </h5>
          <h3 className="mt-3 mb-3">
            <i className="fas fa-check" style={{ color: "green" }}></i> 2 Days,
            16 Hours
          </h3>
          <p className="mb-0 text-muted">
            <span className="text-danger mr-2">
              <i className="fas fa-exclamation-triangle"></i> 3 days ago
            </span>
            <span className="text-nowrap">Last Downtime</span>
          </p>
        </div>
      </div>
    </div>
  );
}
