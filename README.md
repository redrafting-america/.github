# Redrafting America — Organization Working Handbook

**Version:** 003.20260819.081124

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

System Observatory is being created by Redrafting America as a nonprofit-owned software
product. Its application and website repositories are maintained within the Redrafting
America GitHub organization. Its public message is:

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

The script inventories the GitHub organization and local workspace and then treats a
normal interactive run as an approved delivery operation. For each repository containing
work, it shows the changes and requires confirmation that Todd and Codex reviewed the
work and that appropriate local verification passed. It then commits and pushes a
feature branch, creates or reuses a pull request, requires at least one successful GitHub
check, merges without administrator bypass, fast-forwards the local default branch, and
verifies that local and GitHub `main` contain the same commit.

The script distinguishes branch synchronization from delivery completion. A pushed
feature branch is not complete until its pull request is green, merged, and verified on
the default branch. Failed, missing, skipped, cancelled, pending, conflicted, or
review-blocked checks leave the pull request open and report delivery pending.

Operational logs are **not** stored in GitHub and there is no `logs` repository. They
are local iCloud data at:

```text
/Users/toddmcguckin/Library/Mobile Documents/com~apple~CloudDocs/Projects/Redrafting-America/logs/
```

The synchronizer writes its bundles beneath `logs/git-sync-all/<year>/<month>/`.

Before a live delivery, add `--dry-run` and review every proposed branch, commit, push,
pull request, check, merge, clone, and reconciliation action. During a live interactive
run, answer yes only for repositories whose complete change set has been reviewed and
tested. Unattended runs must use `--sync-only`; that mode may synchronize already
committed feature branches but cannot stage, commit, create pull requests, or merge.

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

<sub>Redrafting America · Organization Working Handbook · Version 003.20260819.081124 · <em>Veritas Super Omnia</em></sub>
