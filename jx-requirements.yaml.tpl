cluster:
  clusterName: "${cluster_name}"
  environmentGitOwner: ""
  project: "${gcp_project}"
  provider: gke
  zone: "${zone}"
gitops: true
environments:
- key: dev
- key: staging
- key: production
ingress:
  domain: "${parent_domain}"
  externalDNS: true
  tls:
    email: ""
    enabled: ${domain_enabled}
    production: true
kaniko: true
secretStorage: vault
versionStream:
  ref: ${version_stream_ref}
  url: ${version_stream_url}
webhook: prow
