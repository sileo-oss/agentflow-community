# AgentFlow Collections - Reorganization and Enhancement Suggestions

## Current State Analysis

### Existing Collections

**1. Playground (15768452-a6da-44e0-b4fa-909bd7397533)**
- Mixed content with no clear theme
- Contains: greeting workflow (demo), tool discovery (technical), celebrity game (entertainment), wisdom generator (personal development)
- Described as "no guarantee on content"

**2. Engineering Commons (1cac8a88-4a27-41d7-85e7-c0ac14870025)**
- Focus: Development workflows and code generation
- Contains: OpenAPI generator, project warmup, spec-driven development, spec-driven planning, architecture analysis

**3. Engineering Quality (abb60aa0-4df8-41f8-a745-9f6aec179b59)**
- Focus: Code review and quality assessment
- Contains: explain project, review dev experience, review project structure, review security, review test coverage

### Issues with Current Organization

- **Playground** mixes unrelated content (demos, games, personal development)
- **Engineering Commons** combines both analysis and active development (different activities)
- **Engineering Quality** is well-focused but could be expanded
- No clear separation between learning/onboarding vs production workflows
- Missing key developer workflows (bug fixing, testing, deployment)

## Proposed Reorganization

### **Collection 1: Getting Started & Examples**
*Purpose: Onboarding, learning, and demo content*

**Existing Content to Move Here:**
- greeting_workflow (simple example)
- tool_discovery_and_execution (learning tool usage)
- who_am_i_celebrity_showdown (fun demo)

**New Additions:**

**Prompts:**
- `hello_world_mcp` - Simple prompt demonstrating MCP tool usage with a basic example
- `workflow_tutorial` - Interactive guide explaining workflow concepts and structure

**Workflows:**
- `interactive_onboarding` - Walks new users through AgentFlow features step-by-step
- `build_your_first_workflow` - Guided workflow creation with validation and tips

### **Collection 2: Project Analysis & Documentation**
*Purpose: Understanding and documenting existing codebases*

**Existing Content to Move Here:**
- explain_project
- project_warm_up
- architecture_analysis_and_documentation
- review_project_structure

**New Additions:**

**Prompts:**
- `analyze_dependencies` - Reviews package.json/requirements.txt for outdated, vulnerable, or unnecessary dependencies
- `identify_tech_debt` - Scans for TODO comments, deprecated patterns, and technical debt hotspots
- `generate_api_documentation` - Creates comprehensive API docs from code comments and signatures
- `explain_data_flow` - Traces how data moves through the application from input to output

**Workflows:**
- `comprehensive_project_audit` - Multi-step workflow combining architecture, dependencies, and tech debt analysis
- `onboarding_documentation_generator` - Creates new developer onboarding docs with setup instructions, architecture overview, and contribution guidelines
- `changelog_generator` - Analyzes git history and generates structured changelog with categorized changes

### **Collection 3: Code Quality & Security**
*Purpose: Assessing and improving code quality*

**Existing Content to Move Here:**
- review_dev_experience
- review_test_coverage
- review_security_posture

**New Additions:**

**Prompts:**
- `review_error_handling` - Evaluates error handling patterns, logging, and failure recovery mechanisms
- `review_performance` - Identifies performance bottlenecks, inefficient algorithms, and optimization opportunities
- `review_accessibility` - Checks frontend code for WCAG compliance and accessibility best practices
- `review_api_design` - Evaluates REST/GraphQL API design for consistency, versioning, and best practices
- `detect_code_smells` - Identifies common anti-patterns, duplicated code, and maintainability issues

**Workflows:**
- `pre_deployment_checklist` - Systematic review of security, performance, tests, and documentation before deployment
- `code_review_assistant` - Guides through comprehensive code review with multiple quality dimensions
- `security_hardening` - Step-by-step workflow to identify and fix security vulnerabilities

### **Collection 4: Development Workflows**
*Purpose: Building new features systematically*

**Existing Content to Move Here:**
- spec_driven_planning
- spec_driven_development
- OpenAPI Generator (code generation)

**New Additions:**

**Prompts:**
- `generate_unit_tests` - Creates unit tests for selected functions/classes with edge cases
- `generate_integration_tests` - Builds integration test scenarios based on API endpoints or workflows
- `refactor_suggestion` - Analyzes code and suggests refactoring opportunities with before/after examples
- `generate_migration_script` - Creates database migration scripts from schema changes
- `create_feature_branch_plan` - Generates structured plan for implementing a feature with tasks and estimates

**Workflows:**
- `tdd_workflow` - Test-driven development workflow: write test → implement → refactor loop
- `bug_fix_workflow` - Systematic bug investigation: reproduce → diagnose → fix → test → document
- `feature_implementation` - End-to-end feature development from requirements to deployment
- `database_migration_workflow` - Safe database schema changes with rollback plans
- `api_endpoint_builder` - Guided creation of new API endpoints with validation, tests, and docs

### **Collection 5: Personal & Productivity**
*Purpose: Non-technical support and productivity*

**Existing Content to Move Here:**
- Wisdom Generator

**New Additions:**

**Prompts:**
- `meeting_notes_summarizer` - Converts meeting transcripts into action items and decisions
- `code_explanation_for_stakeholders` - Translates technical concepts into business-friendly language
- `estimate_complexity` - Provides time/complexity estimates for features or tasks
- `learning_path_generator` - Creates personalized learning roadmap for new technologies
- `retrospective_facilitator` - Guides team retrospectives with structured questions

**Workflows:**
- `sprint_planning_assistant` - Helps break down epics into stories with acceptance criteria
- `technical_writing_workflow` - Guides creation of blog posts, documentation, or technical articles
- `career_development_planner` - Helps developers identify skills gaps and create growth plans

### **Collection 6: DevOps & Infrastructure** (New)
*Purpose: Infrastructure, deployment, and operations*

**Prompts:**
- `review_dockerfile` - Analyzes Dockerfile for best practices, security, and optimization
- `review_ci_cd_pipeline` - Evaluates CI/CD configuration for efficiency and reliability
- `generate_kubernetes_manifests` - Creates K8s deployment configs from application requirements
- `infrastructure_cost_analysis` - Reviews cloud resources for cost optimization opportunities
- `monitoring_setup_guide` - Suggests logging, metrics, and alerting strategy
- `review_terraform_code` - Analyzes infrastructure-as-code for best practices and security
- `container_security_scan` - Reviews container images and configurations for vulnerabilities

**Workflows:**
- `deployment_automation` - Sets up automated deployment pipeline with rollback capability
- `disaster_recovery_planning` - Creates backup, recovery, and incident response procedures
- `environment_setup` - Configures dev/staging/prod environments with proper secrets management
- `infrastructure_migration` - Guides migration between cloud providers or infrastructure patterns

### **Collection 7: Team Collaboration** (New)
*Purpose: Facilitating team communication and knowledge sharing*

**Prompts:**
- `generate_pr_description` - Creates comprehensive pull request descriptions from git diff
- `code_review_checklist` - Provides context-aware checklist for reviewing PRs
- `architecture_decision_record` - Helps document architectural decisions with context and consequences
- `incident_postmortem` - Structures incident analysis with timeline, root cause, and action items
- `technical_debt_proposal` - Creates business case for addressing technical debt
- `onboarding_buddy_guide` - Generates personalized onboarding plan for new team members

**Workflows:**
- `pr_review_workflow` - Systematic pull request review covering functionality, tests, docs, and style
- `knowledge_transfer` - Guides knowledge sharing sessions with documentation and Q&A
- `technical_rfc_process` - Structured workflow for proposing and discussing technical changes
- `incident_response` - Coordinates incident handling from detection to resolution to postmortem

## Key Improvements

### Better Cohesion
Each collection now has a clear, single purpose that's immediately understandable to users browsing the catalog.

### Logical Progression
Collections follow a natural developer journey:
1. Learn the system (Getting Started)
2. Understand existing code (Analysis & Documentation)
3. Improve quality (Quality & Security)
4. Build new features (Development Workflows)
5. Deploy and operate (DevOps & Infrastructure)
6. Collaborate effectively (Team Collaboration)
7. Personal growth (Personal & Productivity)

### Clearer Naming
More descriptive collection names that indicate their purpose without requiring users to explore the contents.

### Separation of Concerns
- Analysis/documentation separate from active development
- Quality/security reviews grouped together
- Examples/demos isolated from production workflows
- Infrastructure concerns separated from application development
- Team processes distinguished from individual workflows

### Scalability
This structure makes it easier to add new content to the right place and for users to find what they need.

## High-Impact Additions (Priority Order)

Based on common developer needs, these additions would provide the most immediate value:

1. **bug_fix_workflow** - Developers spend 30-50% of time on bugs; systematic approach improves efficiency
2. **generate_unit_tests** - Testing is often neglected but critical for code quality
3. **analyze_dependencies** - Security vulnerabilities and outdated packages are major concerns
4. **pre_deployment_checklist** - Prevents production issues and reduces incident frequency
5. **feature_implementation** - End-to-end guidance for the most common development task
6. **generate_pr_description** - Improves code review quality and team communication
7. **review_performance** - Performance issues are expensive to fix in production
8. **deployment_automation** - Reduces deployment friction and human error
9. **incident_postmortem** - Learning from incidents prevents recurrence
10. **comprehensive_project_audit** - Provides holistic view of codebase health

## Implementation Considerations

### Naming Conventions
- Use snake_case for all file names
- Prompts: descriptive action verbs (e.g., `review_`, `generate_`, `analyze_`)
- Workflows: process-oriented names (e.g., `_workflow`, `_assistant`, `_process`)

### Content Quality Standards
- Clear, actionable descriptions
- Tested prompts that produce consistent results
- Workflows with well-defined steps and success conditions
- Comprehensive context management (read_keys/write_keys)
- Proper error handling and user guidance

### Documentation Requirements
- Each collection needs updated metadata.json with clear purpose
- README updates to reflect new organization
- Migration guide for existing users
- Examples of when to use each collection

### Migration Strategy
1. Create new collection directories with proper UUIDs
2. Copy existing content to appropriate new collections
3. Update public_collections.yaml with new collection IDs
4. Add deprecation notices to old collections
5. Provide 30-day transition period before removing old structure
6. Update all documentation and examples

## Next Steps

1. **Validate Proposal** - Review with stakeholders and community
2. **Prioritize Additions** - Decide which new prompts/workflows to implement first
3. **Create Templates** - Develop templates for consistent prompt/workflow creation
4. **Implement High-Priority Items** - Start with top 5 high-impact additions
5. **Test Thoroughly** - Ensure all new content works as expected
6. **Document Migration** - Create clear migration guide for users
7. **Gather Feedback** - Iterate based on community usage and feedback

## Metrics for Success

- Reduced time to find relevant prompts/workflows
- Increased usage of collections (track via API)
- Positive community feedback on organization
- Reduced duplicate or overlapping content
- Faster onboarding for new users
- More community contributions to well-organized collections
