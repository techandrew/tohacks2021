import React, { useEffect, useState } from "react";
import CircularProgress from "@material-ui/core/CircularProgress";
import app from "../../../../firebase";

export default function ComplaintsCard() {
  const [complaintsCounter, setComplaintsCounter] = useState(null);

  const fetchComplaintsFromFirestore = async () => {
    await app
      .firestore()
      .collection("complaints")
      .orderBy("timestamp", "desc")
      .onSnapshot((e) => {
        let _pending = 0;
        e.docs.forEach((doc) => {
          let _data = doc.data();

          if (_data["status"] == 0) {
            _pending += 1;
          }
        });

        setComplaintsCounter(_pending);
      });
  };

  useEffect(() => {
    fetchComplaintsFromFirestore();
  }, []);

  return (
    <div className="col-md-8">
      <div className="card widget-flat">
        <div className="card-body">
          <div className="float-right">
            <i className="mdi mdi-account-multiple widget-icon"></i>
          </div>
          <h5
            className="text-muted font-weight-normal mt-0"
            title="Number of Customers"
          >
            Complaints
          </h5>
          {complaintsCounter == null && (
            <div
              style={{
                minHeight: "120px",
                display: "flex",
                justifyContent: "center",
                alignItems: "center",
              }}
            >
              <CircularProgress color="primary" />
            </div>
          )}
          {complaintsCounter != null && (
            <>
              {complaintsCounter > 0 && (
                <h3 className="mt-3 mb-3">
                  <i
                    className="fas fa-exclamation-triangle"
                    style={{ color: "red" }}
                  ></i>
                  High Priority
                </h3>
              )}
              {complaintsCounter == 0 && (
                <h3 className="mt-3 mb-3">
                  <i
                    className="fas fa-check-circle"
                    style={{ color: "green" }}
                  ></i>
                  All Good
                </h3>
              )}
              <p className="mb-0 text-muted">
                <span className="text-success mr-2">
                  {complaintsCounter} Complaints
                </span>
                <span className="text-nowrap">Since last day</span>
              </p>
            </>
          )}
        </div>
      </div>
    </div>
  );
}
