---
name: self-improving-agent
description: "Captures learnings, errors, and corrections to enable continuous improvement. Use manually at the end of sessions or when significant events occur (errors, corrections, discoveries)."
---

# Self-Improvement Skill

A structured workflow for agents to log learnings, errors, and corrections, and then promote them into permanent project documentation or reusable skills.

## Quick Reference

| Situation | Action |
|-----------|--------|
| Command/operation fails | Log to `.learnings/ERRORS.md` |
| User corrects you | Log to `.learnings/LEARNINGS.md` with category `correction` |
| User wants missing feature | Log to `.learnings/FEATURE_REQUESTS.md` |
| API/external tool fails | Log to `.learnings/ERRORS.md` |
| Found better approach | Log to `.learnings/LEARNINGS.md` with category `best_practice` |
| Recurring issue | Promote to `AGENTS.md` or extract as a skill |

## Setup

Create a `.learnings/` directory in the project root:

```bash
mkdir -p .learnings
```

Copy templates from `assets/` or manually create the markdown files using the headers below.

## Logging Format

### Learning Entry

Append to `.learnings/LEARNINGS.md`:

```markdown
## [LRN-YYYYMMDD-XXX] category

**Logged**: ISO-8601 timestamp
**Priority**: low | medium | high | critical
**Status**: pending
**Area**: frontend | backend | infra | tests | docs | config

### Summary
One-line description of what was learned

### Details
Full context: what happened, what was wrong, what's correct

### Suggested Action
Specific fix or improvement to make

### Metadata
- Source: conversation | error | user_feedback
- Related Files: path/to/file.ext
- Tags: tag1, tag2
- See Also: LRN-20250110-001 (if related to existing entry)

---
```

### Error Entry

Append to `.learnings/ERRORS.md`:

```markdown
## [ERR-YYYYMMDD-XXX] skill_or_command_name

**Logged**: ISO-8601 timestamp
**Priority**: high
**Status**: pending
**Area**: frontend | backend | infra | tests | docs | config

### Summary
Brief description of what failed

### Error
```
Actual error message or output
```

### Context
- Command/operation attempted
- Input or parameters used

### Suggested Fix
If identifiable, what might resolve this

### Metadata
- Reproducible: yes | no | unknown
- Related Files: path/to/file.ext

---
```

### Feature Request Entry

Append to `.learnings/FEATURE_REQUESTS.md`:

```markdown
## [FEAT-YYYYMMDD-XXX] capability_name

**Logged**: ISO-8601 timestamp
**Priority**: medium
**Status**: pending
**Area**: frontend | backend | infra | tests | docs | config

### Requested Capability
What the user wanted to do

### User Context
Why they needed it, what problem they're solving

### Suggested Implementation
How this could be built

---
```

## Session Review Workflow

Since this skill does not rely on automatic hooks, it is crucial to perform a **Manual Session Review** at the end of every significant interaction or coding session.

1.  **Reflect**: Ask yourself:
    *   "Did I make any mistakes that the user corrected?" -> Log as **Correction**.
    *   "Did I discover a pattern that wasn't documented?" -> Log as **Insight**.
    *   "Did a tool or command fail unexpectedly?" -> Log as **Error**.
2.  **Log**: Write the entries to the appropriate files in `.learnings/`.
3.  **Check Pending**: Run a quick grep to see if you have pending items:
    ```bash
    grep "Status\*\*: pending" .learnings/*.md
    ```
4.  **Promote**: If an item is valuable for future sessions, move it to `AGENTS.md` (see below).

## Promoting to Project Memory

Learnings in `.learnings/` are temporary. To make them permanent, promote them to the project's primary context file (e.g., `AGENTS.md`, `README.md`, or a dedicated `PROJECT_CONTEXT.md`).

### Promotion Targets

| Target | What Belongs There |
|--------|-------------------|
| `AGENTS.md` | Workflows, automation rules, and agent-specific instructions. |
| `PROJECT_CONTEXT.md` | Project-specific facts, build conventions, and "gotchas". |
| `README.md` | General high-level documentation. |

### How to Promote

1.  **Distill** the learning into a concise rule or fact.
2.  **Add** it to the appropriate section in the target file.
3.  **Update** the original entry in `.learnings/`:
    *   Change `**Status**: pending` → `**Status**: promoted`
    *   Add `**Promoted**: AGENTS.md` (or the file you moved it to).

### Example

**Learning**:
> "I tried to run `npm install` but this project uses `pnpm`. It failed."

**Promotion (in AGENTS.md)**:
```markdown
## Build & Dependencies
- **Strict Rule**: Always use `pnpm` for this project. Do not use `npm`.
```

## Automatic Skill Extraction

If a learning represents a reusable capability (not just a project fact), you can extract it into a new Skill.

1.  **Identify**: A learning that is generic enough to be used in other projects or contexts.
2.  **Run Helper**:
    ```bash
    ./skills/self-improvement/scripts/extract-skill.sh skill-name
    ```
3.  **Customize**: Edit the generated `SKILL.md`.
4.  **Update**: Mark the original learning as `promoted_to_skill`.

## Gitignore Options

**Keep learnings local** (per-developer):
```gitignore
.learnings/
```

**Track learnings in repo** (team-wide knowledge base):
Don't add to .gitignore.

**Hybrid** (track templates, ignore entries):
```gitignore
.learnings/*.md
!.learnings/.gitkeep
```