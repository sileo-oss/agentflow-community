# AgentFlow Collections - Public Repository Setup

This document describes the setup and configuration of the AgentFlow Collections public repository.

## Repository Structure

```
agentflow-collections/
├── .github/workflows/
│   ├── sync-collections.yml    # Main sync workflow
│   └── validate.yml           # PR validation workflow
├── collections/               # Collections directory
│   └── sample-uuid-1234/     # Sample collection
│       ├── metadata.json     # Collection metadata
│       ├── prompts/          # Prompt files
│       └── workflows/        # Workflow files
├── scripts/
│   └── validate-collections.sh # Validation script
├── CONTRIBUTING.md           # Contribution guidelines
├── README.md                # Repository overview
├── SETUP.md                 # This file
├── public_collections.yaml  # Public collections config
└── setup-public-repo.sh     # Setup script
```

## Workflow Overview

### 1. Sync Collections Workflow (`sync-collections.yml`)

**Triggers:**
- Push to main branch (changes to `collections/**` or `public_collections.yaml`)
- Manual dispatch with options

**Features:**
- Uses Docker container from private repository
- Incremental sync (only changed files)
- Automatic `LAST_SYNC_COMMIT` management
- Dry run support
- Error handling and recovery

**Environment Variables:**
- `ADMIN_API_TOKEN` (secret): Admin API token
- `API_BASE_URL` (secret): AgentFlow API base URL
- `LAST_SYNC_COMMIT` (variable): Managed automatically

### 2. Validation Workflow (`validate.yml`)

**Triggers:**
- Pull requests affecting collections
- Push to main branch

**Checks:**
- JSON/YAML syntax validation
- Collection structure validation
- Public collections configuration validation
- Required fields verification

## Setup Instructions

### 1. Repository Creation

```bash
# Create new public repository
gh repo create your-org/agentflow-collections --public

# Clone and set up
git clone https://github.com/your-org/agentflow-collections.git
cd agentflow-collections

# Copy files from this setup
cp -r /path/to/phase2-public-repo/* .

# Run setup script
./setup-public-repo.sh
```

### 2. Configure Repository Secrets

In GitHub repository settings → Secrets and variables → Actions:

**Secrets:**
- `ADMIN_API_TOKEN`: Your AgentFlow admin API token
- `API_BASE_URL`: Your AgentFlow API base URL (e.g., `https://api.agentflowhq.dev/api/v1`)

**Variables:**
- `LAST_SYNC_COMMIT`: (will be managed automatically by workflow)

### 3. Configure Repository Permissions

**Actions permissions:**
- Enable GitHub Actions
- Allow actions to write to repository variables
- Allow workflows to create and approve pull requests (if needed)

**Branch protection (recommended):**
- Require PR reviews for main branch
- Require status checks (validation workflow)
- Require branches to be up to date

### 4. Docker Image Access

Ensure the public repository can access the Docker image:

**Option A: Public Docker Image**
- Make the Docker image public in GitHub Container Registry
- No additional configuration needed

**Option B: Private Docker Image**
- Add the public repository to the private repository's package access
- Configure `GITHUB_TOKEN` permissions

## Testing the Setup

### 1. Validate Repository Structure

```bash
# Run validation script
./scripts/validate-collections.sh

# Check workflow syntax
gh workflow list
```

### 2. Test Sync Workflow

```bash
# Make a test change
echo '{"name": "test", "description": "test"}' > collections/test-collection/metadata.json

# Commit and push
git add .
git commit -m "Test sync workflow"
git push

# Check workflow run
gh run list --workflow=sync-collections.yml
```

### 3. Test Validation Workflow

```bash
# Create a PR with changes
git checkout -b test-validation
# Make some changes...
git push origin test-validation
gh pr create --title "Test validation" --body "Testing validation workflow"

# Check validation results
gh pr checks
```

## Maintenance

### Updating Docker Image

When the sync system is updated in the private repository:

1. New Docker image is automatically built and published
2. Public repository automatically uses the latest image
3. No changes needed in public repository

### Managing Public Collections

Edit `public_collections.yaml` to control which collections are publicly visible:

```yaml
collection_ids:
  - collection-uuid-1
  - collection-uuid-2
```

### Monitoring Sync Operations

- Check GitHub Actions runs for sync status
- Monitor API logs for sync operations
- Use dry run mode for testing changes

## Troubleshooting

### Common Issues

**Sync Failures:**
- Check `ADMIN_API_TOKEN` is valid
- Verify `API_BASE_URL` is correct
- Check Docker image accessibility
- Review sync logs in Actions

**Validation Failures:**
- Run `./scripts/validate-collections.sh` locally
- Check JSON/YAML syntax
- Verify collection structure
- Ensure required fields are present

**Permission Issues:**
- Verify repository secrets are configured
- Check Actions permissions
- Ensure Docker image access

### Getting Help

- Check GitHub Actions logs
- Review workflow run details
- Test locally with validation script
- Check AgentFlow API status

## Security Considerations

### Secrets Management
- Never commit API tokens or sensitive data
- Use repository secrets for configuration
- Rotate tokens regularly

### Content Review
- All changes go through PR review process
- Validation workflow catches common issues
- Community moderation for content quality

### Access Control
- Public repository for collections only
- Private repository for sync implementation
- Controlled access to admin functions

## Next Steps

After setup is complete:

1. **Move existing collections** from private repository
2. **Update documentation** with actual repository URLs
3. **Set up community guidelines** and moderation
4. **Announce to community** and gather feedback
5. **Monitor and iterate** based on usage patterns