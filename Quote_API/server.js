const express = require('express');
const morgan = require('morgan');
const app = express();

const { quotes } = require('./data');
const { getRandomElement } = require('./utils');

const PORT = process.env.PORT || 4001;
app.listen(PORT);

app.use(express.static('public'));

//GET REQUEST
app.get('/api/quotes/random', (req,res,next)=>{
  const randomQuote = getRandomElement(req.params);
  res.json({quotes: randomQuote});
});

//GET REQUEST
app.get('/api/quotes', (req, res) => {

    if (!req.query.hasOwnProperty('person')) {
        res.send({ quotes: quotes });
    } else {
        const getAuthorQuote = quotes.filter(quote => quote.person === req.query.person)
        res.send({ quotes: getAuthorQuote })
    }
});
//POST
app.post('/api/quotes', (req, res) => {
    if (req.query.quote && req.query.person) {
        const addQuote = { quote: req.query.quote, person: req.query.person };
        quotes.push(addQuote)
        res.send({ quote: addQuote });
    } else {
        res.status(400).send();
    }
});

