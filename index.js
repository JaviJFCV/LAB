const express = require('express');
const axios = require('axios');
const app = express();
const PORT = process.env.PORT || 80;

// Endpoint para obtener los datos de la API externa
app.get('/insurance', async (req, res) => {
    try {
        const response = await axios.get('https://dn8mlk7hdujby.cloudfront.net/interview/insurance/58');
        res.json(response.data);
    } catch (error) {
        res.status(500).json({ error: 'Error al obtener los datos' });
    }
});

// Iniciar servidor
app.listen(PORT, () => {
    console.log(`Servidor corriendo en el puerto ${PORT}`);
});
