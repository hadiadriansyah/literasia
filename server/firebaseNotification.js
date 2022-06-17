const admin = require("firebase-admin");
const serviceAccount = require('./firebase-service-account.json');
const FIREBASE_DATABASE_URL = "https://led-test-f72c4-default-rtdb.firebaseio.com";

admin.initializeApp({
    credential: admin.credential.cert(serviceAccount),
    databaseURL: FIREBASE_DATABASE_URL
});