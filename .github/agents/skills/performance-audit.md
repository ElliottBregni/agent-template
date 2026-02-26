---
name: performance-audit
description: "Guide for identifying and documenting performance bottlenecks in backend services and frontend code. Use this when asked to audit performance, investigate latency, optimize queries, or review Core Web Vitals."
license: MIT
---

# Skill: Performance Audit

Identify and document performance bottlenecks in backend services and frontend code.

## Trigger
Invoked when latency increases, under load testing, or on-demand perf review requests.

## Backend Performance Checklist

### Database
- [ ] No N+1 queries (eager load or batch)
- [ ] Indexes on foreign keys and frequent WHERE/ORDER BY columns
- [ ] No SELECT * — select only needed columns
- [ ] Pagination on all list endpoints
- [ ] Query execution plans reviewed for slow queries (EXPLAIN ANALYZE)
- [ ] Connection pool sized appropriately
- [ ] Read replicas used for reporting queries

### API / Service
- [ ] p95/p99 latency tracked and alerted
- [ ] Synchronous calls to slow services replaced with async/queue
- [ ] Caching in place for expensive, stable reads
- [ ] Unnecessary serialization/deserialization eliminated
- [ ] Payload size minimized

### Caching Strategy
| Layer | Tool | TTL | Invalidation |
|-------|------|-----|--------------|
| Application | Redis/Memcached | seconds-minutes | on write |
| HTTP | CDN/reverse proxy | minutes-hours | cache-control |
| Client | browser/app | seconds | ETag/Last-Modified |

## Frontend Performance Checklist

### Load Time
- [ ] Core Web Vitals: LCP < 2.5s, FID < 100ms, CLS < 0.1
- [ ] Bundle size analyzed (webpack-bundle-analyzer / vite-bundle-visualizer)
- [ ] Code splitting on routes
- [ ] Images: WebP/AVIF, lazy loading, srcset
- [ ] Fonts: font-display: swap, subset fonts

### Runtime
- [ ] No layout thrashing (batch DOM reads and writes)
- [ ] React: no unnecessary re-renders (React DevTools Profiler)
- [ ] Large lists virtualized (react-virtual, tanstack-virtual)
- [ ] Expensive computations memoized

## Output Format
```
## Performance Audit: [scope]

### Critical (p99 > 2s or user-visible lag)
- [Issue]: [measurement] → [fix]

### High (p99 200-2000ms degradation)
- [Issue]: [measurement] → [fix]

### Medium (optimization opportunity)
- [Issue] → [fix]

### Metrics Baseline
| Endpoint | p50 | p95 | p99 |
|----------|-----|-----|-----|
```
