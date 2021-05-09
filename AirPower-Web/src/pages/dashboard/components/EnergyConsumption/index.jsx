import React, { useEffect } from "react";
import Chart from "chart.js";

export default function EnergyConsumptionCard() {
  useEffect(() => {
    var ctx = document.getElementById("chart-0").getContext("2d");
    var myChart = new Chart(ctx, {
      type: "line",

      data: {
        labels: [
          "January",
          "February",
          "March",
          "April",
          "May",
          "June",
          "July",
          "August",
          "September",
          "October",
        ],
        datasets: [
          {
            label: "Power Consumption",
            display: true,
            pointStyle: "line",
            data: [
              39756,
              32115,
              29086,
              39269,
              23487,
              31673,
              34510,
              36492,
              35671,
              33943,
            ],
            backgroundColor: [
              "rgba(78,115,223,0.5)",
              "rgba(255, 99, 132, 0.2)",
              "rgba(54, 162, 235, 0.2)",
              "rgba(255, 206, 86, 0.2)",
              "rgba(75, 192, 192, 0.2)",
              "rgba(153, 102, 255, 0.2)",
              "rgba(255, 159, 64, 0.2)",
            ],
            borderColor: [
              "rgba(255, 99, 132, 1)",
              "rgba(54, 162, 235, 1)",
              "rgba(255, 206, 86, 1)",
              "rgba(75, 192, 192, 1)",
              "rgba(153, 102, 255, 1)",
              "rgba(255, 159, 64, 1)",
            ],
            borderWidth: 1,
          },
        ],
      },
      options: {
        aspectRatio: 4,
        legend: {
          display: false,
        },
        responsive: true,
        title: {
          display: false,
          text: "in (kWh)",
        },
        tooltips: {
          mode: "index",
          intersect: false,
        },
        hover: {
          mode: "nearest",
          intersect: true,
        },
        scales: {
          yAxes: [
            {
              display: false,
              stacked: true,
              ticks: {
                beginAtZero: true,
              },
              scaleLabel: {
                display: true,
                labelString: "Month",
              },
            },
          ],
          xAxes: [
            {
              display: false,
            },
          ],
        },
      },
    });
  }, []);

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
            Energy Consumption
          </h5>
          <h3 className="mt-3 mb-3">36,254 kWh</h3>
          <p className="mb-0 text-muted">
            <span className="text-success mr-2">
              <i className="fas fa-arrow-up"></i> 5.27%
            </span>
            <span className="text-nowrap">Since last month</span>
          </p>
        </div>
        <canvas id="chart-0"></canvas>
      </div>
    </div>
  );
}
