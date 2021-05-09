import React, { useEffect } from "react";
import Chart from "chart.js";

export default function ProductionCostCard() {
  useEffect(() => {
    //CHART: PRODUCT COST

    var ctx = document.getElementById("chart-1").getContext("2d");
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
            pointStyle: "line",
            data: [
              404036,
              422023,
              518366,
              547765,
              569421,
              443776,
              764522,
              553283,
              1039656,
              744357,
            ],
            backgroundColor: ["rgba(45,55,68,0.5)"],
            borderColor: ["rgba(45, 55, 68, 1)"],
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
          text: "in Lakhs",
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
            <i className="mdi mdi-cart-plus widget-icon"></i>
          </div>
          <h5
            className="text-muted font-weight-normal mt-0"
            title="Number of Orders"
          >
            Production Cost
          </h5>
          <h3 className="mt-3 mb-3">₹ 5,83,543</h3>
          <p className="mb-0 text-muted">
            <span className="text-danger mr-2">
              <i className="fas fa-arrow-down"></i> 1.08%
            </span>
            <span className="text-nowrap">Since last month</span>
          </p>
        </div>
        <canvas id="chart-1"></canvas>
      </div>
    </div>
  );
}
