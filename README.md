# Redrafting America — Working Handbook

**Version:** 001.20260813.031804

Internal reference for people who work **at** the project. It answers three questions:
where does a file live, what is it called, and what state is it in.

This page is a **map, not the law**. The authoritative standards are the `rda-*` skill
files in the [`skills`](https://github.com/redrafting-america/skills) repository. Where
this page and a skill file disagree, **the skill file wins** — and the disagreement is a
bug in this page. Each section below names the skill it mirrors and the version it was
copied from.

Looking for the public-facing overview? That's the
[organization profile](https://github.com/redrafting-america).

---

## Contents

- [The tree](#the-tree) · [Significant folders](#significant-folders)
- [Canonical filenames](#canonical-filenames) · [File Type codes](#file-type-codes) · [Lifecycle codes](#lifecycle-codes)
- [The number registry](#the-number-registry) · [House rules](#house-rules) · [The skill family](#the-skill-family)

---

## The tree

> **Target state, not current state.** This is the structure adopted from the File Tree
> Audit (Option B — consolidate to three repositories). Migration has **not** yet run.
> What is on disk today is twelve independent repositories in a flat row. See
> [Migration status](#migration-status).

```
redrafting-america/
│
├── managed/                    everything under file governance
│   ├── source/                 working copies · every lifecycle · editable
│   │   ├── governance/         GOV  ← Bylaws, Constitution v2.0, Earned Presidency
│   │   ├── legal/              LAW  ← 501(c)(3) application, PA Dept of State filings
│   │   ├── publications/       PBL  ← Founder's Introduction, white papers, blog
│   │   ├── correspondence/     COR  ← attorney, state, general
│   │   ├── systems/            SYS  ← rda-* skills, scripts, phone routing
│   │   ├── data/               DAT  ← extensions.csv, structured records
│   │   ├── graphics/           GRA  ← brand, campaigns, logos
│   │   ├── reference/          REF  ← Utopia Project bylaws, statutes, research
│   │   ├── operations/         OPS  ← procedures, standards, references
│   │   ├── financial/          FIN  ← accounting, budgets, filings
│   │   └── temporary/          TMP  ← awaiting classification · drains to empty
│   │
│   └── published/              immutable · read-only · same eleven names
│       └── …
│
├── records/                    evidence ABOUT managed files
│   ├── registry/               GOV.txt · OPS.txt · SYS.txt · GRA.txt · BACKLOG.csv
│   ├── audits/                 audit reports, by type and identity
│   └── ledger/                 PUBLICATION-LEDGER.csv
│
├── intake/                     presented, not yet ingested — drains to empty
│
├── web/                        own naming standard · deployment target
│   ├── assets/images/          identity-prefixed renditions
│   └── pages/                  address-bound · never renamed
│
├── _trash/                     quarantine pending review — see House rules
│
└── .local/                     never versioned: logs · caches · recovery
```

Three repositories under the target state: **`managed`**, **`records`**, **`web`**.
`.local/` and `_trash/` are never versioned.

---

## Significant folders

Ordered by importance to the organization, not by depth or alphabet.

| Folder | Location | Purpose |
|---|---|---|
| `governance` | `managed/source/governance/` | The governing instruments themselves — Bylaws, Constitution v2.0, Earned Presidency. Everything else in the project exists to support what lives here. |
| `legal` | `managed/source/legal/` | Obligations to an external authority: the 501(c)(3) application, PA Department of State filings, agreements. Distinct from `governance`, which is authority the organization exercises over itself. |
| `registry` | `records/registry/` | One `<TYPE>.txt` per File Type, allocating permanent identity numbers. The single source of truth for what identifier a work holds. Never edited casually. |
| `audits` | `records/audits/` | Audit reports. Publication depends on these; a report that cannot be produced means the work it cleared is **not validly published**. Treat as evidence, not paperwork. |
| `published` | `managed/published/` | Released, authorized, immutable. Read-only as a unit, hash-verified, backed up as a unit. Nothing is edited here — a change means a new version in `source/`. |
| `publications` | `managed/source/publications/` | Works written for an unrestricted public audience: the Founder's Introduction, white papers, Drafting Room editorial. |
| `ledger` | `records/ledger/` | `PUBLICATION-LEDGER.csv` — the record of what was published, when, at what version and hash. |
| `systems` | `managed/source/systems/` | The `rda-*` skill family, automation scripts, phone call-routing config. Anything that causes or controls system behavior. |
| `correspondence` | `managed/source/correspondence/` | Letters and messages to a defined recipient — attorney, PA Dept of State, general. Filed by primary purpose, so an attorney letter about the 501(c)(3) is correspondence, not legal. |
| `graphics` | `managed/source/graphics/` | Controlled visual works maintained as reusable assets — brand system, logos, campaign artwork. |
| `data` | `managed/source/data/` | Structured records preserved for reference, retrieval, or machine processing. Phone extensions, indexes, exports. |
| `reference` | `managed/source/reference/` | Background and source material supporting another managed file without standing on its own — Utopia Project bylaws, statutes, research. |
| `operations` | `managed/source/operations/` | How organizational activities get performed: procedures, standards, internal references. |
| `financial` | `managed/source/financial/` | Accounting, budgets, tax and audit records. |
| `web` | `web/` | The public site. Its own naming standard and deploy pipeline — deliberately **not** under `managed/`, because page paths are address-bound and must never be renamed. |
| `intake` | `intake/` | Landing area for material presented but not yet classified and filed. Healthy state is empty. |
| `temporary` | `managed/source/temporary/` | `TMP` — works awaiting formal classification under a documented exception. Also healthy when empty. |
| `_trash` | `_trash/` | Quarantine. Files moved out of active use, held pending review. Never emptied automatically. |
| `.local` | `.local/` | Logs, caches, recovery copies. Never versioned, never counted, never cited. |

---

## Canonical filenames

*Mirrors `rda-canonical-filename` 006.20260812.234025.*

```
[ORG]-[TYPE]-[NUMBER]_[LIFECYCLE]_[FILE-NAME]_[VARIANT]_[VERSION]_[DATE].[EXT]
```

`VARIANT` is optional. When it does not apply, **omit the field and its underscore
entirely** — never `none`, never `na`, never a doubled underscore:

```
[ORG]-[TYPE]-[NUMBER]_[LIFECYCLE]_[FILE-NAME]_[VERSION]_[DATE].[EXT]
```

Worked example:

```
RDA-GOV-001_ADR_bylaws_v1.0_20260812.docx
└┬┘ └┬┘ └┬┘ └┬┘ └──┬─┘ └─┬┘ └───┬──┘ └─┬┘
 │   │   │   │     │     │      │      └── EXT       authoritative format
 │   │   │   │     │     │      └───────── DATE      UTC, YYYYMMDD
 │   │   │   │     │     └──────────────── VERSION   per the RDA-OPS rule
 │   │   │   │     └────────────────────── FILE-NAME lowercase, hyphens
 │   │   │   └──────────────────────────── LIFECYCLE current state — changes
 │   │   └──────────────────────────────── NUMBER    3 digits, permanent
 │   └──────────────────────────────────── TYPE      primary purpose, permanent
 └──────────────────────────────────────── ORG       RDA
```

**The line that matters:** `ORG-TYPE-NUMBER` is *permanent identity*. Everything after
it is *changeable state*. A work keeps its number through every rename, revision,
reclassification, retirement, and withdrawal — forever.

| Field | Rule |
|---|---|
| **ORG** | `RDA` unless a governing authority specifies otherwise. Permanent. |
| **TYPE** | Authorized File Type code, by **primary organizational purpose**. Permanent. Never inferred from the extension. |
| **NUMBER** | Exactly three digits, leading zeros included. Unique within TYPE. Assigned once, never reused. Permanent. |
| **LIFECYCLE** | Authorized Lifecycle code. Current state — expected to change. Never inferred from a file's location or content. |
| **FILE-NAME** | Lowercase words, hyphen-separated. No spaces, underscores, or special characters. May change when the description changes. |
| **VARIANT** | Optional. A distinct rendition or intended use. Omitted entirely when absent. |
| **VERSION** | Per the applicable RDA-OPS versioning rule — e.g. `v1.0`, `v0.21`. Confirm the increment trigger before renaming. |
| **DATE** | Eight digits, `YYYYMMDD`, **UTC**. Do not substitute a local date without confirming it matches UTC. |
| **EXT** | Must match the actual authoritative format, including internal content type for packaged formats. Never changed just to look compliant. |

Legacy four-digit numbers exist. **Flag them for resolution — never truncate automatically.**

---

## File Type codes

*Mirrors `rda-authorized-vocabulary` 006.20260812.232757. Eleven codes, one folder each,
one-to-one and total.*

Classify by **primary organizational purpose** — what the work is chiefly for, not what
it is about or what format it happens to be in.

| Code | Folder | Primary purpose |
|---|---|---|
| **GOV** | `governance` | Establishes, exercises, delegates, constrains, or formally records the organization's governing authority. |
| **LAW** | `legal` | Establishes, documents, analyzes, defends, or satisfies a legal right, obligation, agreement, filing, or proceeding — typically involving an external party or authority. |
| **PBL** | `publications` | Communicates substantive content to an unrestricted or broadly public audience. |
| **COR** | `correspondence` | Conveys information, requests, decisions, or notices to a specific person, organization, or defined recipient group. |
| **SYS** | `systems` | Executable, configurable, or machine-operational assets that cause or control system behavior. |
| **DAT** | `data` | Preserves discrete facts, records, values, or observations for storage, retrieval, analysis, or machine processing. |
| **GRA** | `graphics` | Controlled visual works maintained as reusable organizational assets. |
| **REF** | `reference` | Preserves background research or source material supporting another managed file, without independently constituting an authoritative work. |
| **OPS** | `operations` | Human-oriented documents defining, directing, standardizing, or recording how organizational activities are performed. |
| **FIN** | `financial` | Financial accounting, planning, reporting, control, taxation, audit, or compliance. |
| **TMP** | `temporary` | Does not yet conform to another type; awaiting formal classification under a documented migration exception. |

**Two boundaries that come up constantly:**

- **SYS vs OPS** — SYS is instructions to a *machine*; OPS is instructions to a *person*.
  A script is SYS. The procedure describing when to run it is OPS.
- **GOV vs LAW** — GOV is authority the organization exercises over *itself*. LAW is an
  obligation running to an *external* authority. The Bylaws are GOV; filing them with the
  Commonwealth is LAW.

Never invent a code. A new File Type requires a folder name assigned in the same
recommendation packet.

---

## Lifecycle codes

*Mirrors `rda-authorized-vocabulary` 006.20260812.232757. Eight codes.*

| Code | State | Meaning |
|---|---|---|
| **ADR** | Active Draft | Being written or edited. Has not entered formal review. |
| **DFR** | Draft for Review | Circulated for substantive review. Revisions expected, possibly significant. |
| **DFA** | Draft for Approval | Drafting and review complete. Awaiting a formal content-governance approval decision. |
| **RLC** | Release Candidate | Approved and frozen for final compliance review, checksum confirmation, and publication authorization. A substantive change sends it back. |
| **PUB** | Published | Authorized, released to its approved location, and recorded in the registry. |
| **SUP** | Superseded | Replaced by a newer published version. Still authoritative for its historical effective period; retained for audit. |
| **RET** | Retired | Reached the end of its useful life with nothing wrong with it. No successor. Identifier and records remain permanent. |
| **WDN** | Withdrawn | Pulled because something is **wrong** — issued in error, materially incorrect, or otherwise unsafe to rely on. Covers both never-published and retracted-after-publication. |

**Withdrawal is not deletion.** A withdrawn version stays in the record, marked `WDN`, so
anyone holding a copy can discover its status. Reason and authority must be recorded in
every case; a retraction must also record the date from which it must no longer be relied on.

Quick discriminator:

- **SUP** — something newer replaced it. Still good for its era.
- **RET** — nothing replaced it. Nothing wrong with it. Just done.
- **WDN** — something is wrong with it. Stop relying on it.

---

## The number registry

*Mirrors `rda-canonical-filename` 006.20260812.234025.*

One plain-text file per **File Type** — `GOV.txt`, `OPS.txt`, `SYS.txt`, `GRA.txt` — in
`records/registry/`. No registries for Lifecycle codes: NUMBER is unique within TYPE,
while lifecycle changes over time.

Four rules, all hard:

1. An entry reserves its `ORG-TYPE-NUMBER` **permanently** — regardless of any later
   lifecycle change, description change, variant, version, date, format, relocation,
   retirement, withdrawal, supersession, or deletion.
2. **Never delete an allocation entry, reuse a missing number, or renumber to close a gap.**
   Gaps are normal and permanent.
3. The next number is the **highest valid NUMBER anywhere in that registry, plus one** —
   not the last physical line. Read the whole file.
4. Never issue a number from memory, from filenames, or from an assumed sequence. The
   registry is the only source.

---

## House rules

### Never delete — move to `_trash/`

Nothing in this workspace gets deleted. Files that need to go away are moved to
`_trash/YYYY-MM-DD/` with their original path preserved underneath, and logged in
`_trash/MANIFEST.md`. Emptying it is a deliberate human act, never automatic.

This applies to automated agents working in the repository as well as people. See
[`CLAUDE.md`](https://github.com/redrafting-america/.github) at the workspace root for
the full standing instruction, including why the macOS Trash is not an acceptable
substitute.

### UTC, always

Dates in filenames, version strings, and registry entries are UTC. The local date and
the UTC date disagree for part of every day — check before stamping.

### Version strings

Governed files and skills carry a version in the form:

```
Version: NNN.YYYYMMDD.HHMMSS
```

Zero-padded three-digit sequence, UTC date, UTC time. The time component is a deliberate
tiebreaker: two copies claiming the same sequence resolve automatically in favor of the
later timestamp instead of stopping for human review.

### Migration status

The tree above is the **target**. On disk today:

- Twelve independent private repositories under `github.com/redrafting-america/`, each
  with its own remote. **The workspace root is not a repository.**
- Recommended sequence before migrating: back up `records/audits/`, finish the graphics
  run, build `BACKLOG.csv` against today's paths, then migrate and verify by file count
  and hash.

Always confirm which repository a path belongs to before committing.

---

## The skill family

Eleven `rda-*` skills in [`skills`](https://github.com/redrafting-america/skills). They
call each other in a defined order — audit produces findings, the report presents them,
remediation acts on them, and the editing skill does the actual file surgery.

| Skill | Version | Owns |
|---|---|---|
| `rda-authorized-vocabulary` | 006 | The eleven File Type and eight Lifecycle codes. Selection, validation, boundaries. |
| `rda-canonical-filename` | 006 | Filename construction, parsing, validation, and permanent-identity allocation. |
| `rda-document-control` | 001 | Populating the DOCUMENT CONTROL page and file properties after registry entry. |
| `rda-document-audit` | 005 | Auditing a document against a standard. Produces findings only. |
| `rda-audit-report` | 007 | The four-section color-coded report: Blockers, Warnings, Future Enhancements, Compliance Score. |
| `rda-remediation-workflow` | 006 | Acting on findings one at a time, with version bookkeeping and the remediation log. |
| `rda-msw-editing` | 007 | Raw-XML `.docx`/`.dotx` surgery that preserves existing formatting exactly. |
| `rda-publish-managed-file` | 002 | Promotion to `PUB` — requirements, procedure, and retraction. |
| `rda-skill-maintenance` | 013 | Content standards and the authoring process for the family. |
| `rda-skills-template` | 002 | The ten-section structure every skill file must follow. |
| `rda-sync-skills` | 007 | Synchronizing skills between local snapshots and the active copy. |

Versions are the sequence component as of this page's version stamp. `rda-docx-editing`
was renamed to `rda-msw-editing` and keeps the same permanent identity, `RDA-SYS-005` —
a rename is not a retirement.

---

<sub>Redrafting America · Working Handbook · Version 001.20260813.031804 · <em>Veritas Super Omnia</em></sub>
