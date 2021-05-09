import React from "react";
import DashboardWrapper from "../../shared_components/DashboardWrapper";

import {
  EnergyConsumptionCard,
  ProductionCostCard,
  ServerUptimeCard,
  TheftStatusCard,
  PowerConsumptionGenerationCard,
  DashMapCard,
  ComplaintsCard,
  DemoCard
} from "./components";

import "./styles/index.scss";

const DashboardPage = () => {
  return (
    <DashboardWrapper>
      <section className="dashboard__home">
        <div className="row">
          <div className="col-md-6">
            <div className="grid-row row">
              <EnergyConsumptionCard />
              <ProductionCostCard />
            </div>

            <div class="grid-row row">
              <TheftStatusCard />
              <ServerUptimeCard />
            </div>
          </div>

          <PowerConsumptionGenerationCard />
        </div>

        <div className="row dashboard__map__container">
          <div className="col-md-6">
            <div className="card">
              <DashMapCard />
            </div>
          </div>
          <div className="col-md-6">
            <div class="grid-row row">
              <ComplaintsCard />
              <DemoCard />
            </div>
          </div>
        </div>
      </section>
    </DashboardWrapper>
  );
};

export default DashboardPage;
