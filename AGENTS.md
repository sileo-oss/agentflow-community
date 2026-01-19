# AgentFlow Community Collections

**Purpose**: Repository for public AgentFlow prompts, workflows, and collections, synced to production.

## Structure
- `collections/<uuid>/`: Collection folders (UUID-named).
    - `metadata.json`: Collection metadata.
    - `prompts/`: Directory for individual prompts.
    - `workflows/`: Directory for workflow definitions.
    - `skills/`: Directory for specialized skills and knowledge.
- `public_collections.yaml`: Registry of public collection UUIDs.

## Contributing Content
1. **Create & Test**: Use [agentflowhq.dev](https://agentflowhq.dev) to build and test content.
2. **Export**: Export collection as ZIP from the UI.
3. **Add**: Unzip into `collections/` (folder name must be UUID).
4. **Register**: Add UUID to `public_collections.yaml` for visibility.

## Validation
- **CI**: Automated validation on PR (syntax, structure).
- **Format**:
    - `metadata.json`: Name and description.
    - `prompts/*.json`: Web-exported format.
    - `workflows/*.yaml`: Web-exported format. **Do not hand-edit workflows.**
    - `skills/<skill-name>/`:
        - `SKILL.md`: Required main instruction file with YAML frontmatter.
        - `references/`: Optional documentation directory (supports nested folders).
        - `scripts/`: Optional directory for executable scripts.
        - `assets/`: Optional directory for templates and static resources.

## Key Rules
- **No Secrets**: Never commit API keys/tokens.
- **Source of Truth**: Git is the master; changes here sync to the API.
