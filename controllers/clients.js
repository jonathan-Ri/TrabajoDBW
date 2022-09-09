const express = require("express");
const router = express.Router();
const clientsModel = require("../models/clients.model");
router.get("/", async function (request, response) {
    let listClients = await clientsModel.list();
     response.render("clients", { 
        lista: listClients,
        type: "LISTA",
    });
});
module.exports = router;


