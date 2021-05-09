import React, { useState, useEffect, useRef } from "react";
import GoogleMapReact from "google-map-react";
import IconButton from "@material-ui/core/IconButton";
import useSupercluster from "use-supercluster";
import CloseRoundedIcon from "@material-ui/icons/CloseRounded";
import { dummyLocations, darkMapStyles } from "../../../../constants/constants";

function getAddressFromCoordinates({ latitude, longitude }) {
  return new Promise((resolve) => {
    const url = `https://reverse.geocoder.ls.hereapi.com/6.2/reversegeocode.json?apiKey=ELNna_rBYh3v_NOR9VgAeuOhI5DhqM8CnsymYdPyTn0&mode=retrieveAddresses&prox=${latitude},${longitude}`;
    fetch(url)
      .then((res) => res.json())
      .then((resJson) => {
        // the response had a deeply nested structure :/
        if (
          resJson &&
          resJson.Response &&
          resJson.Response.View &&
          resJson.Response.View[0] &&
          resJson.Response.View[0].Result &&
          resJson.Response.View[0].Result[0]
        ) {
          resolve(resJson.Response.View[0].Result[0].Location.Address.Label);
        } else {
          //   resolve();
          resolve("Location can't be determined");
        }
      })
      .catch((e) => {
        resolve("Location can't be determined");
        // console.log("Error in getAddressFromCoordinates", e);
        // resolve();
      });
  });
}

const AnyReactComponent = ({ lat, lng }) => {
  const [showDialog, setShowDialog] = useState(false);
  const [locationName, setLocationName] = useState("Calculating..");

  async function getLocation() {
    let _ = await getAddressFromCoordinates({ latitude: lat, longitude: lng });
    setLocationName(_);
  }
  useEffect(() => {
    getLocation();
  }, []);

  return (
    <div className="cluster__marker">
      {showDialog && (
        <div className="cluster__card" onClick={() => setShowDialog(false)}>
          <div className="cluster__card__content">
            <h2>7.64 kWh</h2>
            <div className="location__address">{locationName}</div>
          </div>
          {/* <i className="fas fa-times-circle" id="cluster__close__icon"></i> */}
          <IconButton
            onClick={() => {
              setShowDialog(false);
            }}
            id="cluster__close__icon"
            iconStyle={{ width: "20px", height: "20px" }}
            aria-label="delete"
            disabled
            color="primary"
          >
            <CloseRoundedIcon size={10} />
          </IconButton>
        </div>
      )}

      <div className="map__marker" onClick={() => setShowDialog(true)}>
        <img
          className="map__marker__image"
          //   src="https://developers.google.com/maps/documentation/javascript/examples/full/images/beachflag.png"
          src="http://ishandeveloper.com/map-marker-light.png"
        />
        {/* <div className="marker__circle"></div> */}
      </div>
    </div>
  );
};

const ClusterCircle = ({ count, factor }) => {
  return (
    <div
      style={{
        width: `${10 + factor * 40}px`,
        height: `${10 + factor * 40}px`,
      }}
      className="cluster-marker-circle"
    >
      {count}
    </div>
  );
};

export default function DashMap() {
  const [zoom, setZoom] = useState(10);
  const [bounds, setBounds] = useState(null);
  const mapRef = useRef();

  const points = dummyLocations.map((location) => ({
    type: "Feature",
    properties: {
      cluster: false,
      index: location.index,
      category: "power",
    },
    geometry: { type: "Point", coordinates: [location.lng, location.lat] },
  }));

  const { clusters } = useSupercluster({
    points,
    bounds,
    zoom,
    options: { radius: 75, maxZoom: 20 },
  });

  function createMapOptions(maps) {
    return {
      panControl: true,
      mapTypeControl: true,
      scrollwheel: true,
      styles: darkMapStyles,
    };
  }
  return (
    <div style={{ height: "100vh", width: "100%" }} id="dash-map">
      <GoogleMapReact
        // draggable={false}
        bootstrapURLKeys={{ key: "AIzaSyDggofUxTHuVIyd7vsZooPN7JLaA-MvY7E" }}
        defaultCenter={{
          lat: 30.7333,
          lng: 76.7794,
        }}
        yesIWantToUseGoogleMapApiInternals={true}
        onGoogleApiLoaded={({ map }) => {
          mapRef.current = map;
        }}
        options={createMapOptions}
        defaultZoom={10}
        onChange={({ zoom, bounds }) => {
          setZoom(zoom);
          setBounds([
            bounds.nw.lng,
            bounds.se.lat,
            bounds.se.lng,
            bounds.nw.lat,
          ]);
        }}
      >
        {clusters.map((cluster, index) => {
          const [lng, lat] = cluster.geometry.coordinates;
          const {
            cluster: isCluster,
            point_count: pointCount,
          } = cluster.properties;

          if (isCluster) {
            return (
              <ClusterCircle
                key={index}
                lat={lat}
                lng={lng}
                count={pointCount}
                factor={pointCount / points.length}
              />
            );
          }

          return <AnyReactComponent key={index} lat={lat} lng={lng} />;
        })}
        {/* {dummyLocations.map((loc) => (
          <AnyReactComponent key={loc.index} lat={loc.lat} lng={loc.lng} />
        ))} */}
      </GoogleMapReact>
    </div>
  );
}
