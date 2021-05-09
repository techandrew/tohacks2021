import React, { useState, useEffect } from "react";
import app from "../../../../firebase";
import * as timeago from "timeago.js";
import CircularProgress from "@material-ui/core/CircularProgress";

export default function DemoCard() {
  const [power, setPower] = useState(null);
  const [lastSeen, setLastSeen] = useState(null);

  const fetchDataFromFirestore = async () => {
    await app
      .firestore()
      .collection("devices")
      .doc("183902183")
      .onSnapshot((e) => {
        setPower(e.data()["current_read"]);
        setLastSeen(e.data()["last_seen"]);
      });
  };

  useEffect(() => {
    fetchDataFromFirestore();
  }, []);

  return (
    <div className="col-md-4">
      <div className="card widget-flat">
        <div className="card-body">
          <div className="float-right">
            <i className="mdi mdi-account-multiple widget-icon"></i>
          </div>
          <h5
            className="text-muted font-weight-normal mt-0"
            title="Number of Customers"
          >
            Demonstration
          </h5>
          {(power == null || lastSeen == null) && (
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

          {power != null && lastSeen != null && (
            <>
              <div className="demonstration__content">
                <h2>{power.toFixed(3)} kWh</h2>
                <p>last seen {timeago.format(lastSeen.toDate())}</p>
              </div>
            </>
          )}
        </div>
      </div>
    </div>
  );
}
