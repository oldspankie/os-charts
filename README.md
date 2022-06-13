# os-charts

A `helm` chart repo, used with `ArgoCD` and `Istio`

### Scope
A helm chart repo utilizing:
- ArgoCD's `App of Apps` for chart deployment
- `Istio` for a service gateway
- Named values files to help deduplicate clutter
- A local helm library for templatizing `istio` (and eventually app) files
- Some homegrown projects to test with

### Related
- `canaryjs` - os-canary-k8s-js - https://github.com/oldspankie/os-canary-k8s-js
- `canarycore` - os-canary-k8s-core - https://github.com/oldspankie/os-canary-k8s-core