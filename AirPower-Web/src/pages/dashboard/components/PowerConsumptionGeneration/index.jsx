import React, { useEffect } from "react";
import Chart from "chart.js";

export default function PowerConsumptionGenerationCard() {
  useEffect(() => {
    //CHART: MAIN DASH

    var ctx = document.getElementById("chart-main").getContext("2d");
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
            label: "Consumed",
            display: true,
            pointStyle: "line",
            data: [
              53245,
              47858,
              48654,
              47556,
              35804,
              56707,
              42567,
              61871,
              49617,
              36274,
            ],
            backgroundColor: ["rgba(45,55,68,0.5)"],
            borderColor: ["rgba(78,115,223,1)"],
            fill: false,
          },
          {
            label: "Generated",
            display: true,
            pointStyle: "line",
            data: [
              40403,
              42203,
              58366,
              54765,
              56421,
              43776,
              74522,
              53283,
              69656,
              44357,
            ],
            backgroundColor: ["rgba(0,0,255,0.5)"],
            borderColor: ["rgba(255, 0, 0, 1)"],
            fill: false,
          },
        ],
      },
      options: {
        aspectRatio: 1.5,
        legend: {
          display: true,
        },
        responsive: true,
        title: {
          display: true,
          text: "Power Consumption & Generation",
          fontFamily: "Poppins",
          fontSize: 14,
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
              display: true,
              ticks: {
                beginAtZero: true,
              },
              scaleLabel: {
                display: true,
                labelString: "in MegaWatts (MW)",
              },
            },
          ],
          xAxes: [
            {
              display: true,
            },
          ],
        },
      },
    });
  }, []);

  return (
    <div className="col-md-6">
      <div className="row card" id="generation__card">
        <canvas id="chart-main"></canvas>
      </div>
    </div>
  );
}
