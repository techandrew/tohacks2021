import React, { useState, useEffect } from "react";
import DashboardWrapper from "../../shared_components/DashboardWrapper";
import app from "../../firebase";
import CircularProgress from "@material-ui/core/CircularProgress";
import * as timeago from "timeago.js";
import "./styles/index.scss";
import Lottie from "lottie-react-web";
import animation from "./styles/lottie.json";
import GoogleMapReact from "google-map-react";

const ComplaintsPage = () => {
  const [complaints, setComplaints] = useState(null);
  const [pendingCounter, SetPendingCounter] = useState(0);
  const [assignedCounter, SetAssignedCounter] = useState(0);
  const [CompletedCounter, SetCompletedCounter] = useState(0);
  const [selectedIndex, setSelectedIndex] = useState(null);
  const [currentTab, setCurrentTab] = useState(null);

  const statusToString = (statusCode) => {
    if (statusCode === 0) return "Pending";
    else if (statusCode === 1) return "Assigned";
    else return "Completed";
  };

  useEffect(() => {
    fetchComplaintsFromFirestore();
  }, []);

  const fetchComplaintsFromFirestore = async () => {
    await app
      .firestore()
      .collection("complaints")
      .orderBy("timestamp", "desc")
      .onSnapshot((e) => {
        const _complaints = [];
        let _pending = 0,
          _assigned = 0,
          _completed = 0;

        e.docs.forEach((doc) => {
          let _data = doc.data();

          if (_data["status"] == 0) {
            _pending += 1;
          } else if (_data["status"] == 1) {
            _assigned += 1;
          } else {
            _completed += 1;
          }

          _complaints.push({
            id: doc.id,
            account: _data["account_no"],
            category: _data["category"],
            summary: _data["summary"],
            status: _data["status"],
            timestamp: _data["timestamp"],
            user: _data["user_name"],
            location: _data["geo_location"],
          });
        });

        setComplaints(_complaints);
        SetPendingCounter(_pending);
        SetAssignedCounter(_assigned);
        SetCompletedCounter(_completed);
      });
  };

  const getTabbedComplaints = () => {
    if (currentTab == null) return complaints;
    if (currentTab == 0) return complaints.filter((e) => e.status == 0);
    if (currentTab == 1) return complaints.filter((e) => e.status == 1);
    if (currentTab == 2) return complaints.filter((e) => e.status == 2);
  };

  return (
    <DashboardWrapper>
      {!complaints && (
        <div className="loading__wrapper">
          <CircularProgress color="primary" />
        </div>
      )}
      {complaints && (
        <section className="complaints__wrapper row">
          <div className="complaints__tabs col-md-3">
            <h1 className="complaints__header">Complaints Tracker</h1>

            <div
              className="complaint__tab"
              onClick={() => {
                setCurrentTab(null);
                setSelectedIndex(null);
              }}
            >
              All ({`${pendingCounter + assignedCounter + CompletedCounter}`})
            </div>

            <div
              className="complaint__tab"
              onClick={() => {
                setCurrentTab(0);
                setSelectedIndex(null);
              }}
            >
              Pending ({`${pendingCounter}`})
            </div>
            <div
              className="complaint__tab"
              onClick={() => {
                setCurrentTab(1);
                setSelectedIndex(null);
              }}
            >
              Assigned ({`${assignedCounter}`})
            </div>
            <div
              className="complaint__tab"
              onClick={() => {
                setCurrentTab(2);
                setSelectedIndex(null);
              }}
            >
              Completed ({`${CompletedCounter}`})
            </div>
          </div>

          <div className="complaints__listings__sidebar col-md-3">
            {getTabbedComplaints().map((complaint, index) => {
              return (
                <div
                  className={
                    index == selectedIndex
                      ? "complaint__listing active"
                      : "complaint__listing"
                  }
                  key={complaint.id}
                  onClick={() => setSelectedIndex(index)}
                >
                  <div className="top__details">
                    <div className="account__number">{complaint.account}</div>
                    <div className="time__ago">
                      {timeago.format(complaint.timestamp.toDate())}
                    </div>
                  </div>

                  <div className="complaint__category">
                    {complaint.category}
                  </div>

                  <div className="complaint__user">{complaint.user}</div>
                </div>
              );
            })}
          </div>
          {selectedIndex === null && (
            <div className="complaint__lottie__wrapper">
              <Lottie
                options={{
                  animationData: animation,
                  loop: true,
                }}
              />
            </div>
          )}
          {selectedIndex !== null && (
            <div className="complaints__content col-md-6">
              <div className="row top__details">
                <div className="col-md-6">
                  <div className="category__label">Category</div>
                  <div className="category__name">
                    {getTabbedComplaints()[selectedIndex].category}
                  </div>
                </div>
                <div className="col-md-6" id="account_col">
                  <div className="category__label">Account Number</div>
                  <div className="account__number">
                    {getTabbedComplaints()[selectedIndex].account}
                  </div>
                </div>
              </div>

              <div className="row status">
                <div className="col-md-4">
                  <div className="category__label">Status</div>
                  <div className="complaint__select">
                    <select
                      id="standard-select"
                      defaultValue={getTabbedComplaints()[selectedIndex].status}
                      onChange={async (e) => {
                        if (currentTab !== null && selectedIndex - 1 > 0) {
                          setSelectedIndex(selectedIndex - 1);
                        } else {
                          setSelectedIndex(null);
                        }

                        await app
                          .firestore()
                          .collection("complaints")
                          .doc(getTabbedComplaints()[selectedIndex].id)
                          .update({
                            status: parseInt(e.target.value),
                          });
                      }}
                    >
                      <option value="0">Pending</option>
                      <option value="1">Assigned</option>
                      <option value="2">Completed</option>
                    </select>
                  </div>
                </div>
              </div>

              <div className="row complaint__content">
                <div className="category__label">Summary of Issue</div>
                <p className="issue__summary">
                  {getTabbedComplaints()[selectedIndex].summary}
                </p>

                <div
                  className="complaint__location"
                  style={{ width: "100%", height: "50vh" }}
                >
                  {/* {getTabbedComplaints()[selectedIndex].location["latitude"]}
                    {getTabbedComplaints()[selectedIndex].location["longitude"]} */}
                  <GoogleMapReact
                    draggable={false}
                    bootstrapURLKeys={{
                      key: "AIzaSyDggofUxTHuVIyd7vsZooPN7JLaA-MvY7E",
                    }}
                    defaultCenter={{
                      lat: getTabbedComplaints()[selectedIndex].location[
                        "latitude"
                      ],
                      lng: getTabbedComplaints()[selectedIndex].location[
                        "longitude"
                      ],
                    }}
                    defaultZoom={10}
                  >
                    <MapMarkerComponent
                      lat={
                        getTabbedComplaints()[selectedIndex].location[
                          "latitude"
                        ]
                      }
                      lng={
                        getTabbedComplaints()[selectedIndex].location[
                          "longitude"
                        ]
                      }
                    />
                  </GoogleMapReact>
                </div>
              </div>
            </div>
          )}
        </section>
      )}
    </DashboardWrapper>
  );
};

const MapMarkerComponent = ({ lat, lng }) => {
  return (
    <div className="cluster__marker">
      <div className="map__marker">
        <img
          className="map__marker__image"
          //   src="https://developers.google.com/maps/documentation/javascript/examples/full/images/beachflag.png"
          src="http://ishandeveloper.com/map-marker.png"
        />
      </div>
    </div>
  );
};

export default ComplaintsPage;
