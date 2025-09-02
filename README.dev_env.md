# Developer environment helper

Run the environment checker to verify required tools:

```bash
./scripts/env_check.sh
```

Recommended: open the repository in VS Code using the provided `.devcontainer` for a consistent environment.

Backup/restore helper:

```bash
./scripts/backup_restore.sh backup path/to/file.db
./scripts/backup_restore.sh restore path/to/file.db backup_filename
```

CI: see `.github/workflows/ci.yml` for lint, tests, CodeQL and dependency checks.

Run the minimal test locally (no install required):

```bash
node ./tests/sample.test.js
```
