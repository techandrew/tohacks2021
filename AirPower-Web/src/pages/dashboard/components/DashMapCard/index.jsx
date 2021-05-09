import React, { useState, useEffect, useRef } from "react";
import GoogleMapReact from "google-map-react";
import useSupercluster from "use-supercluster";
import { dummyLocations, lightMapStyles } from "../../../../constants/constants";

const AnyReactComponent = ({ lat, lng }) => {
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

const ClusterCircle = ({ count, factor }) => {
  return (
    <div
      style={{
        width: `${10 + factor * 20}px`,
        height: `${10 + factor * 20}px`,
      }}
      className="cluster-marker-circle"
    >
      {count}
    </div>
  );
};

export default function DashMapCard() {
  const [zoom, setZoom] = useState(10);
  const [bounds, setBounds] = useState(null);
  const mapRef = useRef();

  const points = dummyLocations.map((location) => ({
    type: "Feature",
    properties: {
      cluster: false,
      crimeID: location.index,
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
      panControl: false,
      mapTypeControl: false,
      scrollwheel: true,
      styles: lightMapStyles,
    };
  }
  return (
    <div id="dash-map">
      <GoogleMapReact
        // draggable={false}
        bootstrapURLKeys={{ key: "AIzaSyDggofUxTHuVIyd7vsZooPN7JLaA-MvY7E" }}
        defaultCenter={{
          lat: 30.7333,
          lng: 76.7794,
        }}
        defaultZoom={10}
        yesIWantToUseGoogleMapApiInternals={true}
        onGoogleApiLoaded={({ map }) => {
          mapRef.current = map;
        }}
        options={createMapOptions}
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
      </GoogleMapReact>
    </div>
  );
}
