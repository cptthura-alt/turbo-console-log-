let express = require('express');
let app = express();
let ejs = require('ejs');
const haikus = require('./haikus.json');
const port = process.env.PORT || 3000;

app.use(express.static('public'))
app.set('view engine', 'ejs');

app.get('/', (req, res) => {
  res.render('index', {haikus: haikus});
});

// 404 handler
app.use((req, res) => {
  res.status(404).send('404 - Not Found');
});

// Error handler
app.use((err, req, res, next) => {
  // Only log stack traces in development
  if (process.env.NODE_ENV !== 'production') {
    console.error(err.stack);
  } else {
    console.error(`Error: ${err.message}`);
  }
  res.status(500).send('500 - Internal Server Error');
});

// Only start server if not being required by another module (for testing)
if (require.main === module) {
  app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
  });
}

module.exports = app;