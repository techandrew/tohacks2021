import React, { useState, useEffect } from "react";

// Components
import { useHistory } from "react-router-dom";
import Button from "@material-ui/core/Button";
import Swal from "sweetalert2";
import MuiPhoneNumber from "material-ui-phone-number";
import CircularProgress from "@material-ui/core/CircularProgress";

// Styles
import "./styles/index.scss";
import Lottie from "lottie-react-web";
import animation from "./styles/lottie.json";
import { useAuth } from "../../contexts/AuthContext";

const LoginPage = () => {
  const history = useHistory();
  const { login, currentUser } = useAuth();
  const [validNumber, setValidNumber] = useState(false);
  const [loading, setLoading] = useState(false);
  const [currentNumber, setCurrentNumber] = useState("+91");

  useEffect(() => {
    if (currentUser != null) history.push("/dashboard/home");
  }, []);

  async function handleSubmit(e) {
    e.preventDefault();

    try {
      // setError("");
      setLoading(true);
      await login(currentNumber);
      // history.push("/");
    } catch {
      console.log("FAILED TO AUTH");
      setLoading(false);
      Swal.fire({
        icon: "error",
        title: "Oops...",
        text: "Something went wrong!",
      });
    }
  }
  return (
    <>
      <section className="login__wrapper">
        <div className="login__box__container">
          <div className="lottie__wrapper">
            <Lottie
              options={{
                animationData: animation,
                loop: true,
              }}
            />
          </div>
          <h1 className="login__header">Let's, Log In.</h1>
          <div className="get__otp__wrapper">
            <MuiPhoneNumber
              className="phone__number"
              defaultCountry={"in"}
              regions={"asia"}
              value={currentNumber}
              onChange={(e) => {
                setCurrentNumber(e);

                if (e.length == 15 && !validNumber) setValidNumber(true);
                else if (validNumber) setValidNumber(false);
              }}
            />
            ,
            <div className="otp__button__wrapper">
              <Button
                className="otp__button"
                variant="contained"
                onClick={handleSubmit}
                color="primary"
                disabled={!validNumber || loading}
                size="large"
              >
                {loading && <CircularProgress color="primary" size={20} />}
                <div className="otp__button__text">Get OTP</div>
              </Button>
            </div>
          </div>
        </div>
      </section>
    </>
  );
};

export default LoginPage;
