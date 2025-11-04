# Contributing to AgentFlow Collections

Thank you for your interest in contributing to AgentFlow Collections! This guide will help you get started with contributing prompts, workflows, and improvements to the community.

## 🚀 Quick Start

1. **Fork** this repository
2. **Clone** your fork locally
3. **Create a branch** for your changes
4. **Make your changes** following our guidelines
5. **Test** your changes locally
6. **Submit a pull request**

## 📋 Before You Start

### Understanding the System

- **Git as Source of Truth**: All collections are managed in Git and automatically synced to the AgentFlow API
- **Locked Collections**: Collections synced from Git cannot be edited directly in the API
- **Automatic Sync**: Changes merged to main are automatically deployed
- **Change Detection**: Only modified files are synced, making the process efficient

### What You Can Contribute

- **New Collections**: Complete sets of related prompts and workflows
- **Individual Prompts**: Useful AI prompts for specific tasks
- **Workflows**: Multi-step AI processes for complex tasks
- **Improvements**: Better descriptions, bug fixes, optimizations
- **Documentation**: Help improve guides and examples

## 🏗️ Development Setup

### Prerequisites

- Git installed and configured
- Text editor or IDE
- Basic understanding of JSON and YAML formats
- (Optional) `jq` and `yq` for validation

### Local Setup

```bash
# Fork and clone the repository
git clone https://github.com/YOUR_USERNAME/agentflow-community.git
cd agentflow-community

# Create a branch for your changes
git checkout -b feature/my-new-collection

# Make your changes...

# Test your changes (see Testing section)

# Commit and push
git add .
git commit -m "Add new collection for data analysis"
git push origin feature/my-new-collection
```

## 📝 Contribution Types

### 1. Adding a New Collection

**When to create a new collection:**
- You have a set of related prompts/workflows for a specific domain
- The content doesn't fit well in existing collections
- You want to create a themed set of AI tools

**Steps:**
1. Generate a UUID for your collection:
   ```bash
   # On macOS/Linux
   uuidgen | tr '[:upper:]' '[:lower:]'
   
   # Or use online UUID generator
   ```

2. Create the collection directory:
   ```bash
   mkdir collections/your-uuid-here
   ```

3. Add metadata.json:
   ```json
   {
     "name": "Data Analysis Toolkit",
     "description": "Collection of prompts and workflows for data analysis tasks"
   }
   ```

4. Add prompts and workflows (see format guides below)

### 2. Adding Prompts to Existing Collections

**Steps:**
1. Choose the appropriate collection
2. Create a new JSON file in the `prompts/` directory
3. Follow the prompt format (see below)
4. Test the prompt works as expected

### 3. Adding Workflows to Existing Collections

**Steps:**
1. Choose the appropriate collection
2. Create a new YAML file in the `workflows/` directory
3. Follow the workflow format (see below)
4. Test the workflow logic

### 4. Improving Existing Content

**Common improvements:**
- Better descriptions and documentation
- Bug fixes in workflow logic
- Optimized prompt text
- Additional context or examples

## 📄 File Format Guidelines

### Collection Metadata (`metadata.json`)

```json
{
  "name": "Collection Name",
  "description": "Clear, concise description of what this collection provides"
}
```

**Requirements:**
- `name`: Human-readable collection name (required)
- `description`: Brief explanation of collection purpose (required)
- Keep descriptions under 200 characters
- Use clear, professional language

### Prompt Format (`prompts/*.json`)

```json
{
  "name": "analyze_data_trends",
  "description": "Analyzes data trends and provides insights",
  "content": "Analyze the following data and identify key trends, patterns, and insights. Focus on:\n\n1. Overall trends and direction\n2. Notable patterns or anomalies\n3. Potential causes or correlations\n4. Actionable recommendations\n\nData:\n{data_input}\n\nProvide a clear, structured analysis with specific examples from the data."
}
```

**Requirements:**
- `name`: Snake_case identifier (required)
- `description`: What the prompt does (required)  
- `content`: The actual prompt text (required)
- Names should be descriptive and unique within the collection
- Content should be clear, specific, and actionable

**Best Practices:**
- Include placeholders like `{data_input}` for dynamic content
- Structure prompts with clear sections or numbered points
- Provide context about expected input/output format
- Test prompts with real examples

### Workflow Format (`workflows/*.yaml`)

```yaml
name: Data Analysis Workflow
description: Complete workflow for analyzing datasets and generating reports
diagram: |-
  graph TD
    upload[Upload Data] --> validate[Validate Data]
    validate --> analyze[Analyze Trends]
    analyze --> report[Generate Report]
    report --> review[Review Results]
steps:
  - name: upload_data
    description: Upload and prepare the dataset
    actions:
      - "Request user to upload or provide dataset"
      - "Validate data format and structure"
    user_prompt: "Please upload your dataset or provide the data you'd like to analyze"
    context:
      read_keys: []
      write_keys: ["raw_data", "data_format"]
    allowed_next_steps: ["validate_data"]
    continuation_logic: "After data is provided, proceed to validation"
    success_condition: "Data has been successfully uploaded and stored"
    
  - name: validate_data
    description: Check data quality and structure
    actions:
      - "Examine data structure and format"
      - "Identify any data quality issues"
      - "Suggest data cleaning if needed"
    context:
      read_keys: ["raw_data", "data_format"]
      write_keys: ["validation_results", "cleaned_data"]
    allowed_next_steps: ["analyze_trends"]
    continuation_logic: "If data is valid or cleaned, proceed to analysis"
    success_condition: "Data validation completed and any issues addressed"
```

**Requirements:**
- `name`: Human-readable workflow name (required)
- `description`: What the workflow accomplishes (required)
- `diagram`: Mermaid diagram showing workflow flow (optional but recommended)
- `steps`: Array of workflow steps (required)

**Step Requirements:**
- `name`: Snake_case step identifier (required)
- `description`: What this step does (required)
- `actions`: List of actions performed (required)
- `context`: Variables read/written (required)
- `allowed_next_steps`: Valid next steps (required)
- `continuation_logic`: When to proceed (required)
- `success_condition`: How to know step succeeded (required)

## 🧪 Testing Your Changes

### 1. Syntax Validation

**JSON Files:**
```bash
# Test all JSON files
find collections -name "*.json" -exec sh -c 'echo "Testing $1" && cat "$1" | jq .' _ {} \;

# Test specific file
cat collections/uuid/prompts/my_prompt.json | jq .
```

**YAML Files:**
```bash
# Test all YAML files  
find collections -name "*.yaml" -exec sh -c 'echo "Testing $1" && cat "$1" | yq .' _ {} \;

# Test specific file
cat collections/uuid/workflows/my_workflow.yaml | yq .
```

### 2. Structure Validation

**Check collection structure:**
```bash
# Verify metadata exists
ls collections/*/metadata.json

# Check for required directories
find collections -type d -name prompts
find collections -type d -name workflows
```

### 3. Content Testing

**Prompt Testing:**
- Test prompts with sample inputs
- Verify they produce expected outputs
- Check for clarity and usefulness

**Workflow Testing:**
- Walk through each step logically
- Ensure step transitions make sense
- Verify context variables are properly used

### 4. Local Sync Testing (Advanced)

If you have access to a local AgentFlow API instance:

```bash
# Set up environment
export ADMIN_API_TOKEN="dev-admin-token-12345"
export API_BASE_URL="http://localhost:8787/api/v1"

# Test sync (dry run)
DRY_RUN=true node scripts/sync-collections.js
```

## 📏 Quality Standards

### Content Quality

**Prompts:**
- Clear, specific instructions
- Appropriate level of detail
- Professional language
- Tested with real examples
- No sensitive information

**Workflows:**
- Logical step progression
- Clear success conditions
- Proper error handling
- Realistic user interactions
- Complete context management

**Collections:**
- Focused theme or domain
- Consistent quality across items
- Appropriate scope (not too broad/narrow)
- Clear organization

### Technical Standards

**File Organization:**
- Correct directory structure
- Proper file naming (snake_case)
- Valid JSON/YAML syntax
- Required fields present

**Documentation:**
- Clear descriptions
- Helpful examples where appropriate
- Proper grammar and spelling
- Professional tone

## 🔄 Pull Request Process

### 1. Before Submitting

- [ ] Changes are tested and working
- [ ] All files have valid syntax
- [ ] Descriptions are clear and helpful
- [ ] No sensitive information included
- [ ] Changes follow our guidelines

### 2. PR Description Template

```markdown
## Description
Brief description of what this PR adds or changes.

## Type of Change
- [ ] New collection
- [ ] New prompt(s)
- [ ] New workflow(s)
- [ ] Bug fix
- [ ] Documentation improvement
- [ ] Other (please describe)

## Collections Affected
- Collection Name (UUID): Brief description of changes

## Testing
- [ ] JSON/YAML syntax validated
- [ ] Content tested with sample inputs
- [ ] All required fields present
- [ ] No sensitive information included

## Additional Notes
Any additional context or notes for reviewers.
```

### 3. Review Process

1. **Automated Checks**: Syntax validation and structure checks
2. **Content Review**: Maintainers review for quality and appropriateness
3. **Testing**: Changes are tested in a staging environment
4. **Approval**: At least one maintainer approval required
5. **Merge**: Changes are merged and automatically synced

### 4. After Merge

- Changes are automatically synced to the AgentFlow API
- Collections become available to users
- You'll be credited as a contributor

## 🎯 Contribution Ideas

### Beginner-Friendly

- Add prompts for common tasks (writing, analysis, coding)
- Improve existing prompt descriptions
- Fix typos or formatting issues
- Add examples to documentation

### Intermediate

- Create workflows for multi-step processes
- Add complete collections for specific domains
- Improve workflow logic and error handling
- Contribute to testing and validation tools

### Advanced

- Create complex multi-step workflows
- Contribute to sync system improvements
- Help with documentation and guides
- Mentor other contributors

## 🆘 Getting Help

### Questions?

- **GitHub Discussions**: Ask questions and get help from the community
- **GitHub Issues**: Report bugs or request features
- **Documentation**: Check the [AgentFlow Documentation](https://docs.agentflowhq.dev)

### Common Issues

**Syntax Errors:**
- Use `jq` for JSON validation
- Use `yq` for YAML validation
- Check for missing commas, quotes, or brackets

**Workflow Logic:**
- Ensure all steps have valid next steps
- Check that context variables are properly managed
- Verify success conditions are achievable

**Collection Organization:**
- Keep related content together
- Use clear, descriptive names
- Maintain consistent quality within collections

## 📜 Code of Conduct

We are committed to providing a welcoming and inclusive environment for all contributors. Please:

- Be respectful and constructive in all interactions
- Focus on what is best for the community
- Show empathy towards other community members
- Accept constructive criticism gracefully
- Help others learn and grow

## 🙏 Recognition

Contributors are recognized in several ways:

- **GitHub Contributors**: Automatic recognition in repository
- **Release Notes**: Major contributions highlighted in releases
- **Community Showcase**: Outstanding contributions featured in community updates

Thank you for contributing to AgentFlow Collections! Your contributions help make AI more accessible and useful for everyone.