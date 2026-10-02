# 120A Church Street

Shared food rankings, SQLite database, photo uploads, and cartoon kitchen.

Run locally with Python 3.12 or later: `python server.py`.

Railway uses the included Dockerfile. Attach a persistent volume at `/data`, set `DATA_DIR=/data`, and run exactly one replica. Health check: `/health`.

Database schema migrations are in `drizzle/`. Startup applies unapplied migrations and verifies their hashes. The three supplied foods are seeded without overwriting existing ratings. Ratings use version checks to prevent overwriting concurrent edits. New photos are stored on the persistent volume.

Editing is open without a password, as requested. The frontend loads records from `/api/foods` and refreshes every 15 seconds while no form is being edited. Browser local storage is not used for shared records.

Tests: `python tests/test_storage.py`.
