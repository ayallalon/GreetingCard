
const sql = require('mssql');

async function connectDB() {
    try {
        await sql.connect('Server=sql16appdev;Database=GCDB;User Id=ww;Password=Aa!123456;Encrypt=true; TrustServerCertificate=True');
        console.log("Connected to database");
    } catch (err) {
        console.log("Database connection failed:", err);
        throw err;
    }
}
module.exports = {
    connectDB,
    sql 
};