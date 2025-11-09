# AgentFlow Collections

Community-maintained collections of prompts and workflows for the AgentFlow MCP system.

## What is this?

This repository contains AI prompts and workflows that are automatically synced to [agentflowhq.dev](https://agentflowhq.dev). 

**How it works:**
- Collections are managed in this Git repository (version control, collaboration)
- Changes are automatically deployed to [agentflowhq.dev](https://agentflowhq.dev)
- Users can create and test collections on the web console, then submit them here
- All collections are available through the AgentFlow MCP system

**Repository Structure:**
```
├── collections/                    # All collections
│   └── <collection-uuid>/          # Each collection (UUID as folder name)
│       ├── metadata.json           # Collection name and description
│       ├── prompts/                # Prompts directory
│       │   └── *.json              # Individual prompt files
│       └── workflows/              # Workflows directory
│           └── *.yaml              # Individual workflow files
├── public_collections.yaml         # Controls which collections are public
└── .github/workflows/              # Automated CI/CD workflows
    ├── validate-pr.yml             # Validates collections on PR
    └── sync-collections.yml        # Validates and syncs to production on merge
```

## How to Contribute

### Step 1: Create Your Collection

**Option A: Use the Web Console (Recommended)**
1. Go to [agentflowhq.dev](https://agentflowhq.dev)
2. Create your collection, prompts, and workflows (workflows should be defined with workflow definition helper)
3. Test everything works as expected
4. Note your collection UUID

**Option B: Create Locally**
1. Generate a UUID: `uuidgen | tr '[:upper:]' '[:lower:]'`
2. Create directory: `mkdir collections/<your-uuid>`
3. Add `metadata.json`:
   ```json
   {
     "name": "Your Collection Name",
     "description": "Brief description"
   }
   ```
4. Add prompts in `prompts/` directory
5. Add workflows in `workflows/` directory
6. **Validate using the AgentFlow MCP tool** (don't manually write workflow YAML)

### Step 2: Submit Your Collection

1. **Fork this repository**
2. **Create a branch**: `git checkout -b add-my-collection`
3. **Copy your collection** to the `collections/` directory
4. **Commit and push**:
   ```bash
   git add collections/your-uuid/
   git commit -m "Add [Collection Name]"
   git push origin add-my-collection
   ```
5. **Create a Pull Request**

### Step 3: Validation & Deployment

When you create a PR:
1. ✅ **Automatic validation** runs (checks syntax, structure, and workflow logic)
2. 🤖 **Bot comments** on your PR with validation results
3. 👤 **Owner reviews and approves** your PR
4. � **OMerge to production** - After merge, your collection is validated again and synced live!

## Guidelines

- **Use descriptive names** for collections, prompts, and workflows
- **Test your content** before submitting (use the web console!)
- **Use snake_case** for file names (e.g., `my_prompt.json`)
- **No sensitive data** - Never include API keys, passwords, or personal information
- **Keep it focused** - Each collection should have a clear theme or purpose

## Collection Visibility & Management

### Option 1: Community Collections (Recommended)
Add your collection to this repository to share it with the community:

1. Submit your collection to this repo (see "How to Contribute" above)
2. Add its UUID to `public_collections.yaml` to make it publicly discoverable
3. Your collection can be updated via Git PRs
4. Community can contribute improvements

### Option 2: Independent Public Collections
You can make your own collections public without adding them to this repo:

1. Create your collection on [agentflowhq.dev](https://agentflowhq.dev)
2. **Lock the collection** (prevents accidental edits via web console)
3. Add its UUID to `public_collections.yaml` in this repo
4. Submit a PR with just the `public_collections.yaml` change

**Important Notes:**
- **Locked collections cannot be unlocked** - this is permanent
- Collections in this repo are automatically locked and managed via Git
- Locking is recommended before making a collection public
- You can make collections public/private by adding/removing from `public_collections.yaml`

---

## License

MIT License - See LICENSE file for details.

## Questions?

- **Issues**: Report bugs or request features via [GitHub Issues](../../issues)
- **Discussions**: Ask questions in [GitHub Discussions](../../discussions)
- **Documentation**: [AgentFlow Documentation](https://docs.agentflowhq.dev)
