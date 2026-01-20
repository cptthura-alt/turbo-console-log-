let express = require('express');
let app = express();
let ejs = require('ejs');
const haikus = require('./haikus.json');
const port = process.env.PORT || 3000;

console.log('🚀 Initializing Haikus for Codespaces application...');
console.log('📦 Loading dependencies: Express, EJS');
console.log(`📊 Loaded ${haikus.length} haikus from haikus.json`);

app.use(express.static('public'))
app.set('view engine', 'ejs');

app.get('/', (req, res) => {
  console.log(`📥 Incoming request: ${req.method} ${req.path} from ${req.ip}`);
  res.render('index', {haikus: haikus});
  console.log(`✅ Successfully rendered ${haikus.length} haikus`);
});

app.listen(port, () => {
  console.log('='.repeat(50));
  console.log('✨ Server is running!');
  console.log(`🌐 Local: http://localhost:${port}`);
  console.log(`🔧 Environment: ${process.env.NODE_ENV || 'development'}`);
  console.log(`📂 Serving static files from: /public`);
  console.log(`🎨 Template engine: EJS`);
  console.log('='.repeat(50));
  console.log('Press Ctrl+C to stop the server');
});