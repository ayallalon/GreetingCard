const e = require('express')
const { sql } = require('../database')

// GET 
async function getAllCards() {
    try {
        const pool = await sql.connect()
        const result = await pool.request()
            .query('SELECT * FROM Cards')
        return { success: true, cards: result.recordset }
    } catch (err) {
        return { success: false, message: 'Failed to retrieve cards: ' + err }
    }
}

// GET BY ID
async function getCardById(cardId) {
    try {
        const pool = await sql.connect()
        const result = await pool.request()
            .input('CardID',cardId)
            .query('SELECT * FROM Cards WHERE CardID = @CardID');
                return { success: true, card: result.recordset[0] }
      } catch (err) {
        return { success: false, message: 'Failed to retrieve card: ' + err }
    }
}

// UPDATE
async function updateCard(cardId, cardData) {
    try {
        const pool = await sql.connect()
        await pool.request()
            .input('CardID', cardId)
            .input('UserID', sql.NVarChar, cardData.UserID)
            .input('Style', sql.NVarChar, cardData.Style)
            .input('Text', sql.NVarChar, cardData.Text)
            .input('Background', sql.NVarChar, cardData.Background)
            .query('UPDATE Cards SET UserID = @UserID, Style = @Style, Text = @Text, Background = @Background WHERE CardID = @CardID');

            return { success: true, message: 'Card updated successfully' }
           } catch (err) {
        return { success: false, message: 'Failed to update card: ' + err }
    }
}

 //POST
async function createCard(newCard) {
    try {
        console.log("cardService",newCard);
        const pool = await sql.connect()
        const res = await pool.request()
            .input('UserID', sql.NVarChar, newCard.UserID) 
            .input('Style', sql.NVarChar, newCard.Style)
            .input('Text', sql.NVarChar, newCard.Text)
            .input('Background', sql.NVarChar, newCard.Background)
            .query('INSERT INTO Cards (UserID, Style, Text, Background) OUTPUT INSERTED.CardID VALUES (@UserID, @Style, @Text, @Background)')
        const newCardID = res.recordset[0].CardID; 
        console.log('New CardID:', newCardID);
        return { success: true, message: 'card created',CardID: newCardID }
    } catch (err) {
        console.log(err)
        return { success: false, message: 'card not created: ' + err }
    }
}

module.exports = {  getAllCards, getCardById, updateCard ,createCard}

