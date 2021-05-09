import React from "react";

export default function TheftStatusCard() {
  return (
    <div className="col-md-6">
      <div className="card widget-flat">
        <div className="card-body">
          <div className="float-right">
            <i className="mdi mdi-account-multiple widget-icon"></i>
          </div>
          <h5
            className="text-muted font-weight-normal mt-0"
            title="Number of Customers"
          >
            Theft Status
          </h5>
          <h3 className="mt-3 mb-3">
            <i className="fas fa-check" style={{color:"green"}}></i> No theft detected
          </h3>
          <p className="mb-0 text-muted">
            <span className="text-success mr-2">
              <i className="fas fa-history"></i> 6 Thefts
            </span>
            <br />
            <span className="text-nowrap">Since last month</span>
          </p>
        </div>
      </div>
    </div>
  );
}
