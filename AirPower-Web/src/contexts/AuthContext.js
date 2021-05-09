import React, { useContext, useState, useEffect } from "react";
import { auth } from "../firebase";
import fb from "firebase/app";
import Swal from "sweetalert2";
import { useHistory } from "react-router-dom";

const AuthContext = React.createContext();

export function useAuth() {
  return useContext(AuthContext);
}

export function AuthProvider({ children }) {
  const history = useHistory();
  const [currentUser, setCurrentUser] = useState();
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const unsubscribe = auth.onAuthStateChanged((user) => {
      setCurrentUser(user);
      setLoading(false);
    });

    return unsubscribe;
  }, []);

  let recaptcha = new fb.auth.RecaptchaVerifier("recaptcha", {
    size: "invisible",
  });

  async function login(phone) {
    auth.signInWithPhoneNumber(phone, recaptcha).then((e) => {
      Swal.fire({
        title: "Verify OTP",
        text: `Enter the One-Time Password sent to ${phone}`,
        input: "number",
        closeOnConfirm: false,
        animation: "slide-from-top",
        confirmButtonText: "Confirm",
        inputPlaceholder: "OTP",
        inputValidator: (value) => {
          if (value.length < 6) {
            return "OTP must be of 6 digits";
          } else if (value.length == 6) {
            e.confirm(value).then((result) => {
              setCurrentUser(result.user);
              history.push("/dashboard/home");
            });
          }
        },
      });
    });
  }

  async function logout() {
    await auth.signOut();
    history.push("/");
  }

  const value = {
    currentUser,
    login,
    logout,
  };

  return (
    <AuthContext.Provider value={value}>
      {!loading && children}
    </AuthContext.Provider>
  );
}
