const request = require('supertest');
const app = require('./index');

describe('Haikus Application', () => {
  describe('GET /', () => {
    it('should return 200 OK', async () => {
      const response = await request(app).get('/');
      expect(response.status).toBe(200);
      expect(response.type).toBe('text/html');
    });

    it('should contain haiku content', async () => {
      const response = await request(app).get('/');
      expect(response.text).toContain('Haikus for Mona');
    });
  });

  describe('GET /nonexistent', () => {
    it('should return 404 for non-existent routes', async () => {
      const response = await request(app).get('/nonexistent');
      expect(response.status).toBe(404);
      expect(response.text).toContain('404 - Not Found');
    });
  });
});
