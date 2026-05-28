#!/bin/bash
cd /root/db-backup
pg_dump postgresql://twp_user:twp_secure_2026@localhost:5432/twp_bookings > backup_$(date +%Y%m%d_%H%M%S).sql
# Keep only last 30 backups
ls -t backup_*.sql | tail -n +31 | xargs -r rm
git add -A
git commit -m "backup $(date +%Y-%m-%d)"
git push origin main
