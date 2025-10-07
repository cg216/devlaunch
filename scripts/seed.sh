#!/usr/bin/env bash
set -euo pipefail
set -a; source secrets/seed.env; set +a
node packages/db/seed.cjs
