const {sql} = require('../database')

//POST
async function createUser(newUser){
    try{
        console.log(newUser)
        const pool = await sql.connect();
        const result = await pool.request()
            .input('UserID', sql.NVarChar, newUser.UserID) 
            .input('UserName', sql.NVarChar, newUser.UserName)
            .input('Email', sql.NVarChar, newUser.Email)
            .input('Password', sql.NVarChar, newUser.Password)
            .query('INSERT INTO Users (UserID, UserName, Email, Password) OUTPUT INSERTED.UserID VALUES (@UserID, @UserName, @Email, @Password)');
           // console.log(result.recordsets[0][0])
         return {success: true, message: 'user created',res: result.recordsets}
    }catch(err){
        return {success:  false, message:'user not created '+ err}

    }
  
}

module.exports = {createUser}