const express = require("express");
const cors = require("cors");

const app = express();

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// ROUTES
app.get("/", (req, res) => {
  res.send("Welcome");
});

require("./app/routes/notificationRoute")(app);


// Start
const PORT = 3000;
app.listen(PORT, () => console.log(`Server listening on port ${PORT}`));
