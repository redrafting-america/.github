# Redrafting America — Organization Working Handbook

**Version:** 002.20260818.165308

This repository owns the Redrafting America GitHub organization profile and the
current map of its websites, applications, repositories, and local working folders.
It describes the organization **as built today**. Product-specific technical and
governance documentation remains with the product that owns it.

## Current organization structure

Redrafting America currently maintains four GitHub repositories:

| Repository | Purpose | Visibility |
|---|---|---|
| [`.github`](https://github.com/redrafting-america/.github) | Organization profile and this working handbook | Public |
| [`redrafting-america-site`](https://github.com/redrafting-america/redrafting-america-site) | Source for the Redrafting America public website | Public |
| `system-observatory-app` | Native macOS System Observatory application | Private |
| `system-observatory-site` | Source for the System Observatory public landing page | Private |

Repository visibility and website availability are separate. A private source
repository may deploy a publicly accessible website.

## Public websites

| Website | Address | Source repository | Role |
|---|---|---|---|
| Redrafting America | [redraftingamerica.org](https://redraftingamerica.org) | `redrafting-america-site` | Primary nonprofit and civic-project website |
| System Observatory | [systemobservatory.app](https://systemobservatory.app) | `system-observatory-site` | Product landing page for System Observatory |

Each website has its own repository, domain, deployment configuration, and release
history. Website source does not belong in an application repository.

## System Observatory

System Observatory is a software product currently developed in repositories hosted by
the Redrafting America GitHub organization. Its final personal-versus-organizational
ownership model has not yet been decided. Its public message is:

> Always useful screensavers. Never flying toasters.

The product is deliberately split into two repositories:

- `system-observatory-app` contains the macOS application, Xcode project, application
  tests, native Help, and product design documentation.
- `system-observatory-site` contains the public landing page, concept presentation for
  C-TOP, M-TOP, and L-TOP, website animation, and deployment configuration.

This separation allows the public website and the native application to be developed,
tested, deployed, and released independently.

## Local working layout

The active local Git workspace is:

```text
/Users/toddmcguckin/Projects/redrafting-america/
├── .github/
├── redrafting-america-site/
├── system-observatory-app/
└── system-observatory-site/
```

Each child directory is an independent Git repository with its own `origin`. The
`redrafting-america/` parent directory is an organization workspace, not a repository.

## Repository naming standard

Repository names use lowercase words separated by hyphens. Product repositories use a
shared product prefix followed by their role:

```text
<product>-app
<product>-site
```

The organization website follows the same role suffix:

```text
redrafting-america-site
system-observatory-app
system-observatory-site
```

The `.github` name is GitHub's required conventional repository name and is the sole
exception.

## Synchronization and audit logs

Use the stable organization synchronizer from the Redrafting America iCloud operations
tree:

```bash
/Users/toddmcguckin/Library/Mobile\ Documents/com~apple~CloudDocs/Projects/Redrafting-America/scripts/git-sync-all.sh "Describe the changes"
```

The script inventories the GitHub organization and the local workspace, synchronizes
each repository, verifies local and remote state, and writes an execution audit bundle.

Operational logs are **not** stored in GitHub and there is no `logs` repository. They
are local iCloud data at:

```text
/Users/toddmcguckin/Library/Mobile Documents/com~apple~CloudDocs/Projects/Redrafting-America/logs/
```

The synchronizer writes its bundles beneath `logs/gitsyncall/<year>/<month>/`.

Before a live synchronization, add `--dry-run` to the command and review every proposed
commit, deletion, clone, pull, and push. The live command stages all changes within each
repository it processes.

## Ownership boundaries

- This `.github` repository owns organization-level orientation and the public GitHub
  profile.
- Each website repository owns its own source, deployment configuration, and website
  documentation.
- The System Observatory app repository owns native application source, Xcode settings,
  tests, Help, and product documentation.
- Logs, caches, generated build products, and recovery copies remain outside Git unless
  a product explicitly defines a different controlled process.

## Change discipline

When repositories or domains change:

1. Update this handbook and `profile/README.md` first.
2. Rename or move the repository and local folder.
3. Update Git remotes, deployment configuration, and development tools.
4. Run product tests and an organization-wide synchronization dry run.
5. Reconcile this handbook with the verified as-built state.

Do not add a new repository merely to represent a folder category. Create one only when
the work needs an independent access boundary, release lifecycle, deployment target, or
substantially separate history.

---

<sub>Redrafting America · Organization Working Handbook · Version 002.20260818.165308 · <em>Veritas Super Omnia</em></sub>
