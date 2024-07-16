const userService = require('../Services/userService')
const express = require('express')
const router = express.Router()

//Create user
router.post('/', async(req, res)=>{
        const newUser = req.body
        const result = await userService.createUser(newUser)
        if (result.success) {
        return res.status(201).json({ message: result.message, result:result.res })
    } else {
        return res.status(500).json({ message: result.message })
    }
})

module.exports = router;
