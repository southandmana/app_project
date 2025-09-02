// Simple test for email validation. This will run with `node` or with Jest if installed.
const { isValidEmail } = require('../src/validate_email');

const cases = [
	['alice@example.com', true],
	['bob@example', false],
	['', false],
	[null, false],
	['x@y.co', true]
];

let failed = 0;
for (const [input, expected] of cases) {
	const result = isValidEmail(input);
	if (result !== expected) {
		console.error(`FAIL: ${input} -> expected ${expected} got ${result}`);
		failed++;
	}
}

if (failed === 0) {
	console.log('ALL TESTS PASS');
	process.exit(0);
} else {
	process.exit(2);
}
