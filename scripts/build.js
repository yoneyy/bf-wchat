const fs = require('fs');
const path = require('path');
const { spawn } = require('child_process');

const { stdout } = spawn('tsc', ['-p', 'tsconfig.json'], { cwd: process.cwd() });
stdout.on('close', () => {
  const libraryPath = path.join(__dirname, '../dist/index.d.ts');
  const code = fs
    .readFileSync(libraryPath, 'utf8')
    .replace('export default WeWorkChat;', '');
  const result = `${code}\rexport = WeWorkChat;`;
  fs.writeFileSync(libraryPath, result, { encoding: 'utf8' });
});
