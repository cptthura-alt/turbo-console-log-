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

// 404 handler
app.use((req, res) => {
  console.log(`⚠️  404 Not Found: ${req.method} ${req.path} from ${req.ip}`);
  res.status(404).send('404 - Page Not Found');
});

// Error handler
app.use((err, req, res, next) => {
  console.error('❌ Server Error:');
  console.error(`   Path: ${req.method} ${req.path}`);
  console.error(`   Error: ${err.message}`);
  console.error(`   Stack: ${err.stack}`);
  res.status(500).send('500 - Internal Server Error');
});

const server = app.listen(port, () => {
  console.log('='.repeat(50));
  console.log('✨ Server is running!');
  console.log(`🌐 Local: http://localhost:${port}`);
  console.log(`🔧 Environment: ${process.env.NODE_ENV || 'development'}`);
  console.log(`📂 Serving static files from: /public`);
  console.log(`🎨 Template engine: EJS`);
  console.log('='.repeat(50));
  console.log('Press Ctrl+C to stop the server');
});

// Graceful shutdown handling
process.on('SIGTERM', () => {
  console.log('⚠️  SIGTERM signal received: closing HTTP server');
  server.close(() => {
    console.log('✅ HTTP server closed');
    process.exit(0);
  });
});

process.on('SIGINT', () => {
  console.log('\n⚠️  SIGINT signal received: closing HTTP server');
  server.close(() => {
    console.log('✅ HTTP server closed');
    process.exit(0);
  });
});