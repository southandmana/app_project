# Runbooks

Example runbook template for high-priority alert: service_down

- Title: service_down
- Symptoms: Service returns 5xx or unhealthy endpoints
- Severity: P1
- Steps:
  1. Check service logs for errors
  2. Check recent deploys
  3. If recent deploy, roll back
  4. Check resource metrics (CPU, memory)
  5. If resource exhaustion, scale up or restart pods
- Postmortem: capture timeline and root cause
