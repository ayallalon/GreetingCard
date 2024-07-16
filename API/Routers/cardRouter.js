const cardService =require('../Services/cardService')
const express = require('express')
const router = express.Router()

//Get all cards
router.get('/', async (req, res) => {
    const result = await cardService.getAllCards()
    if (result.success) {
        return res.status(200).json(result.cards);
    } else {
        return res.status(500).json({ message: result.message })
    }
});

//Get card by ID
router.get('/:cardId', async (req, res) => {
    const cardId = req.params.cardId;
    const result = await cardService.getCardById(cardId)
    if (result.success) {
        return res.status(200).json(result.card);
    } else {
        return res.status(404).json({ message: result.message })
    }
});

//Update card
router.put('/:cardId', async (req, res) => {
    const cardId = req.params.cardId;
    const cardData = req.body;
    const result = await cardService.updateCard(cardId, cardData);
    if (result.success) {
        return res.status(200).json({ message: result.message })
    } else {
        return res.status(404).json({ message: result.message })
    }
});

//Create card
router.post('/', async (req, res) => {
    const newCard = req.body;
    const result = await cardService.createCard(newCard);
    if (result.success) {
       
        return res.status(201).json({ message: result.message , CardID: result.CardID})
    } else {
        return res.status(500).json({ message: result.message })
    }
})

module.exports = router;

