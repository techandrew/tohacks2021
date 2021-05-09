import firebase from "firebase/app";
import "firebase/firestore";

// Initialize Firebase
const fireapp = firebase.initializeApp({
  apiKey: "AIzaSyA3oT0aS5oLqcJ2udExiQaxtXRBNPuYMOQ",
  authDomain: "airwatt-bachmanity.firebaseapp.com",
  projectId: "airwatt-bachmanity",
  storageBucket: "airwatt-bachmanity.appspot.com",
  messagingSenderId: "232268529696",
  appId: "1:232268529696:web:0b816b8cfdcc8e8d5dbc45",
});

export default fireapp;
