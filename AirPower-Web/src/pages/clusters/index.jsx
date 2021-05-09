import React from "react";
import DashboardWrapper from "../../shared_components/DashboardWrapper";
import DashMap from "../dashboard/components/DashMap";

const ClustersPage = () => {
  return (
    <DashboardWrapper>
      <section className="dashboard__cluster">
          <DashMap />
      </section>
    </DashboardWrapper>
  );
};

export default ClustersPage;
