# AgentFlow Collections

Community-maintained collections of prompts and workflows for AgentFlow MCP system.

## 🚀 Quick Start

This repository contains AI prompts and workflows that are automatically synced to the AgentFlow API. All content is managed through Git, providing version control, collaboration, and automated deployment.

## 📁 Repository Structure

```
├── collections/                 # Main directory for all collections
│   └── <collection-uuid>/       # Each collection is a folder named by its UUID
│       ├── metadata.json        # Collection name and description
│       ├── prompts/             # Prompts for this collection
│       │   └── <name>.json      # Individual prompt files
│       └── workflows/           # Workflows for this collection
│           └── <name>.yaml      # Individual workflow files
├── public_collections.yaml     # Configuration for public visibility
├── .github/workflows/           # Automated sync system
└── CONTRIBUTING.md             # Contribution guidelines
```

## 🤝 Contributing

We welcome contributions from the community! Here's how to get started:

### Adding a New Collection

1. **Fork this repository**
2. **Create a new collection directory** with a UUID name:
   ```bash
   mkdir collections/12345678-1234-1234-1234-123456789abc
   ```
3. **Add metadata.json**:
   ```json
   {
     "name": "My Collection",
     "description": "Description of what this collection does"
   }
   ```
4. **Add prompts and workflows** (see format below)
5. **Test your changes** (see Testing section)
6. **Submit a pull request**

### File Formats

#### Collection Metadata (`metadata.json`)
```json
{
  "name": "Collection Name",
  "description": "Brief description of the collection's purpose"
}
```

#### Prompt Format (`prompts/*.json`)
```json
{
  "name": "prompt_name",
  "description": "What this prompt does",
  "content": "The actual prompt text that will be sent to the AI..."
}
```

#### Workflow Format (`workflows/*.yaml`)
```yaml
name: Workflow Name
description: What this workflow accomplishes
diagram: |-
  graph TD
    step1[First Step] --> step2[Second Step]
steps:
  - name: step1
    description: Description of first step
    actions:
      - "What the step does"
    user_prompt: "Prompt shown to user"
    context:
      read_keys: []
      write_keys: ["variable_name"]
    allowed_next_steps: ["step2"]
    continuation_logic: "When to proceed to next step"
    success_condition: "How to know step succeeded"
```

### Editing Existing Collections

1. **Fork the repository**
2. **Make your changes** to existing files
3. **Test your changes**
4. **Submit a pull request** with a clear description

### Testing Your Changes

Before submitting a PR, please test your changes:

1. **Validate JSON/YAML syntax**:
   ```bash
   # Test JSON files
   cat collections/uuid/prompts/my_prompt.json | jq .
   
   # Test YAML files  
   cat collections/uuid/workflows/my_workflow.yaml | yq .
   ```

2. **Check collection structure**:
   - Ensure metadata.json exists and is valid
   - Verify prompt and workflow files follow the correct format
   - Check that file names use underscores (not spaces or hyphens)

## 🔄 How Sync Works

Changes to this repository are automatically synced to the AgentFlow API:

1. **Make changes** to collections in Git
2. **Create Pull Request** with your changes  
3. **After review and merge** - GitHub Actions automatically syncs changes to API
4. **Collections are locked** in API - only editable via Git

### Sync Features

- **Smart Change Detection**: Only syncs files that actually changed
- **Public Collections**: Managed via `public_collections.yaml`
- **Error Recovery**: Failed syncs are automatically retried
- **Dry Run Support**: Test changes without affecting the API

## 📋 Collection Guidelines

### Content Quality
- **Clear descriptions**: Write helpful descriptions for prompts and workflows
- **Tested content**: Ensure prompts and workflows work as expected
- **Appropriate scope**: Keep collections focused on specific use cases
- **No sensitive data**: Never include API keys, passwords, or personal information

### Naming Conventions
- **Collections**: Use descriptive names that indicate purpose
- **Files**: Use snake_case for prompt and workflow files
- **Prompts**: Use clear, descriptive names that indicate function
- **Workflows**: Name workflows based on the process they automate

### Organization
- **Logical grouping**: Group related prompts and workflows in the same collection
- **Incremental complexity**: Start with basic functionality, add advanced features
- **Documentation**: Include clear descriptions and examples where helpful

## 🔒 Public Collections

Collections can be made publicly visible by adding their UUID to `public_collections.yaml`:

```yaml
collection_ids:
  - 12345678-1234-1234-1234-123456789abc  # My Public Collection
  - 87654321-4321-4321-4321-cba987654321  # Another Public Collection
```

Public collections are discoverable by all AgentFlow users.

## 🆘 Getting Help

- **Issues**: Report bugs or request features via GitHub Issues
- **Discussions**: Ask questions in GitHub Discussions
- **Documentation**: Check the [AgentFlow Documentation](https://docs.agentflowhq.dev)

## 📜 License

This repository is licensed under the MIT License. By contributing, you agree that your contributions will be licensed under the same license.

## 🙏 Acknowledgments

Thanks to all contributors who help make AgentFlow collections better for everyone!

---

**Ready to contribute?** Check out our [Contributing Guide](CONTRIBUTING.md) for detailed instructions.