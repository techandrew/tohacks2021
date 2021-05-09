import React, { useEffect } from "react";
import "./styles/index.scss";
import { Link } from "react-router-dom";
import Typed from "react-typed";

export default function LandingPage() {
  const useScript = (url) => {
    useEffect(() => {
      const script = document.createElement("script");

      script.src = url;
      script.async = true;

      document.body.appendChild(script);

      return () => {
        document.body.removeChild(script);
      };
    }, [url]);
  };

  //   useEffect(() => {
  //     const script = document.createElement("script");

  //     script.src = "scripts/gsap-animations.js";
  //     script.async = true;

  //     document.body.appendChild(script);

  //     return () => {
  //       document.body.removeChild(script);
  //     };
  //   }, []);

  useScript(
    "https://cdnjs.cloudflare.com/ajax/libs/gsap/2.0.2/TweenMax.min.js"
  );
  useScript(
    "https://cdnjs.cloudflare.com/ajax/libs/ScrollMagic/2.0.6/ScrollMagic.js"
  );
  useScript(
    "https://cdnjs.cloudflare.com/ajax/libs/ScrollMagic/2.0.6/plugins/animation.gsap.js"
  );
  useScript(
    "https://cdnjs.cloudflare.com/ajax/libs/ScrollMagic/2.0.6/plugins/debug.addIndicators.min.js"
  );
  useScript("scripts/gsap-animations.js");

  return (
    <section className="landing__section">
      <nav className="nav__wrapper">
        <span className="nav__logo">
          <img
            src="images/logo-dark.png"
            alt="AirPower Logo"
            className="nav__logo__img"
          />
        </span>

        <span className="nav__links">
          <Link to="/login" className="nav__link signup__btn">
            Admin Login
          </Link>
        </span>
      </nav>

      <div className="landing__wrapper">
        <div className="mac__wrapper">
          <div className="macbook__pro__wrapper">
            <img
              id="study__background"
              className="mac__desktop"
              src="images/landing/bg2.png"
            />

            <div className="mac__screens">
              <div className="col">
                <div className="row">
                  <div className="col-md-3">
                    <img
                      id="top__left__1"
                      className="mac__screen"
                      src="images/landing/top-left-left.png"
                    />
                    <img
                      id="top__left__bottom"
                      className="mac__screen"
                      src="images/landing/top-left-bottom.png"
                    />
                  </div>
                  <div className="col-md-3">
                    <img
                      id="top__left__2"
                      className="mac__screen"
                      src="images/landing/top-left-right.png"
                    />
                    <img
                      id="top__left__bottom__2"
                      className="mac__screen"
                      src="images/landing/top-right-bottom.png"
                    />
                  </div>

                  <div className="col-md-6">
                    <img
                      id="top__right"
                      className="mac__screen"
                      src="images/landing/top-right.png"
                    />
                  </div>
                </div>
                <div className="row">
                  <div className="col-md-6">
                    <img
                      id="bottom__left"
                      className="mac__screen"
                      src="images/landing/bottom-left.png"
                    />
                  </div>
                  <div className="col-md-4">
                    <img
                      id="bottom__right"
                      className="mac__screen"
                      src="images/landing/bottom-right.png"
                    />
                  </div>
                </div>
              </div>
            </div>

            <div className="mac__text">
              <h1>AirPower</h1>
              <h2>
                Smart{" "}
                <Typed
                  loop
                  typeSpeed={40}
                  backSpeed={60}
                  strings={[
                    "Power Distribution",
                    "Savings",
                    "Home Automation",
                    "Energy Management",
                  ]}
                  smartBackspace
                  shuffle={false}
                  backDelay={1000}
                  fadeOut={false}
                  fadeOutDelay={100}
                  loopCount={0}
                  showCursor
                  cursorChar="|"
                />
              </h2>
              <img src="images/landing/device.png" className="mac__device" />

              {/* <div class="call__to__action">
            <button class="start__learning__btn">Start Learning</button>
          </div> */}
            </div>
          </div>
        </div>

        <div className="promotion__text">
          <h2>Powerful dashboard</h2>
          <p>
            An incredibly powerful & intutive dashboard, for seamless
            integration between all the services.
          </p>
        </div>

        <div className="complaints__info__text">
          <h2>Complaints Tracker</h2>
          <p>
            Keep on track with all the issues, that your consumers are facing,
            in a powerful yet simple way.
          </p>
        </div>

        <div className="theft__info__text">
          <h2>Theft Detection</h2>
          <p>
            Stay on track with all the issues, that your consumers are facing,
            in a powerful yet simple way.
          </p>
        </div>

        <div className="map__cluster__overlay">
          <div className="map__cluster__info__text">
            <h2>Map Clusters</h2>
            <p>
              Realtime updates that can pan across a whole city, state or even a
              continent, helping you detect power fluctations, outrage etc.
            </p>
          </div>
        </div>

        <div className="there__info__text">
          <h2>You'd think, that's all?</h2>
          <p>No, there's more!</p>
        </div>
      </div>

      <section className="showcase__wrapper">
        <div className="showcase__phone">
          <img
            src="images/landing/mockups/center.png"
            className="showcase__phone__img"
            id="phone__main"
          />
          <img
            src="images/landing/mockups/left2.png"
            className="showcase__phone__img"
            id="phone__left__2"
          />
          <img
            src="images/landing/mockups/left.png"
            className="showcase__phone__img"
            id="phone__left__1"
          />
          <img
            src="images/landing/mockups/right.png"
            className="showcase__phone__img"
            id="phone__right__1"
          />

          <img
            src="images/landing/mockups/right2.png"
            className="showcase__phone__img"
            id="phone__right__2"
          />
        </div>

        <div className="app__informatic__1">
          <h2>Perfect Companion</h2>
          <p>
            Provide an immersive experience to your consumers, with our
            companion app.
          </p>
        </div>
      </section>
    </section>
  );
}
