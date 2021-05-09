import * as express from "express";
import firebase from "firebase";
import * as bodyParser from "body-parser";

import fireapp from "./firebase";

const app = express();
const main = express();

main.use("/api", app);
main.use(bodyParser.json());
main.use(bodyParser.urlencoded({ extended: false }));

app.post("/send", async (req, res) => {
  try {
    const readings = {
      device_id: req.body["device_id"],
      last_seen: firebase.firestore.FieldValue.serverTimestamp(),
      current_read: req.body["read"],
    };

    await fireapp
      .firestore()
      .collection("devices")
      .doc(`${readings.device_id}`)
      .update({
        last_seen: readings.last_seen,
        current_read: readings.current_read,
      });
  } catch (e) {}
});

app.listen(5000, () => console.log("API Initialized"));
