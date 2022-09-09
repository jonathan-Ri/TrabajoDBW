const express = require("express"); 
const dotenv = require("dotenv");
const app = express();
dotenv.config();

app.set("view engine", "ejs");
app.set("views", "views");
app.use("/clients", require("./controllers/clients"));



app.listen(process.env.SERVER_PORT, function () {
     console.log("Server listening at: " + process.env.SERVER_PORT)
});
