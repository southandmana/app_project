function isValidEmail(email) {
  if (typeof email !== 'string') return false;
  // Simple RFC-lite check
  return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
}

module.exports = { isValidEmail };
