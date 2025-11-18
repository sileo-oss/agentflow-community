# AgentFlow Collections

Community-maintained collections of prompts and workflows for the AgentFlow MCP system.

## What is this?

This repository contains AI prompts and workflows that are automatically synced to [agentflowhq.dev](https://agentflowhq.dev). 

**How it works:**
- Collections are safely maintained in this Git repository with full version control and collaboration support
- Changes merged to main are automatically synced to [agentflowhq.dev](https://agentflowhq.dev)
- Users create and test collections on the web console, then submit them here via pull requests
- All collections become available through the AgentFlow MCP system

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

## File Formats

### metadata.json
Each collection must have a `metadata.json` file:
```json
{
  "name": "Your Collection Name",
  "description": "A brief description of what this collection does"
}
```

### Prompt Files (prompts/*.json)
Prompts are exported from the web console when you export your collection. Each prompt file contains the name, description, and prompt content.

**Note:** Create and validate prompts using the web console, then export the collection.

### Workflow Files (workflows/*.yaml)
Workflows are YAML files that define multi-step agent processes.

**Important:** Use the workflow definition helper through the AgentFlow MCP server to generate YAML definitions. Copy the YAML to the web console to create and test your workflow, then export it for Git. Manual editing is not recommended due to strict validation requirements.

### public_collections.yaml
To make a collection publicly discoverable, add its UUID:
```yaml
public_collections:
  - "550e8400-e29b-41d4-a716-446655440000"  # Example UUID
  - "your-collection-uuid-here"
```

## How to Contribute

### Step 1: Create & Test Your Collection

1. **Go to [agentflowhq.dev](https://agentflowhq.dev)** and create your collection
2. **Add prompts and workflows** (use the workflow definition helper for workflows)
3. **Configure your MCP client** to use your collection
4. **Test everything thoroughly** - Make sure all prompts and workflows work as expected
5. **Export your collection**:
   - Go to Collection Settings
   - Click "Export Collection"
   - Download the ZIP file

### Step 2: Add to Community Repository

1. **Fork this repository**
2. **Create a branch**: `git checkout -b add-my-collection`
3. **Extract the exported ZIP** into the `collections/` directory:
   ```bash
   unzip your-collection-export.zip -d collections/
   ```
   The ZIP already contains the correct structure with your collection UUID as the folder name
4. **Commit and push**:
   ```bash
   git add collections/
   git commit -m "Add [Collection Name]"
   git push origin add-my-collection
   ```
5. **Create a Pull Request**

### Step 3: Validation & Deployment

When you create a PR:
1. ✅ **Automatic validation** runs (checks syntax, structure, and workflow logic)
2. 🤖 **Bot comments** on your PR with validation results
3. 👤 **Owner reviews and approves** your PR
4. � **Merge to production** - After merge, your collection is validated again and synced live!

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

ODbL License - See LICENSE file for details.

## Questions?

- **Issues**: Report bugs or request features via [GitHub Issues](../../issues)
- **Discussions**: Ask questions in [GitHub Discussions](../../discussions)
- **Web Console**: [AgentFlow Web Console](https://agentflowhq.dev)
