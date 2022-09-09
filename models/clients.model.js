pool = require("../utils/db.js");
module.exports = {
    async list() {
        try {
            conn = await pool.getConnection();
            sql = "SELECT dni,nombre,apellido1,apellido2,direccion,email FROM clientes";
            const rows = await conn.query(sql);
            conn.end();
            return rows;
        } catch (err) {
            throw err;
        }
    }
}; 

