#!/bin/bash

# Validation script for AgentFlow Collections
# Validates JSON/YAML syntax and collection structure

set -e

echo "🔍 Validating AgentFlow Collections"
echo "=================================="

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Counters
total_files=0
valid_files=0
error_files=0

# Function to validate JSON
validate_json() {
    local file="$1"
    if command -v jq >/dev/null 2>&1; then
        if jq . "$file" >/dev/null 2>&1; then
            echo -e "  ${GREEN}✅${NC} $file"
            ((valid_files++))
        else
            echo -e "  ${RED}❌${NC} $file - Invalid JSON syntax"
            ((error_files++))
        fi
    else
        echo -e "  ${YELLOW}⚠️${NC} $file - jq not installed, skipping validation"
    fi
    ((total_files++))
}

# Function to validate YAML
validate_yaml() {
    local file="$1"
    if command -v yq >/dev/null 2>&1; then
        if yq . "$file" >/dev/null 2>&1; then
            echo -e "  ${GREEN}✅${NC} $file"
            ((valid_files++))
        else
            echo -e "  ${RED}❌${NC} $file - Invalid YAML syntax"
            ((error_files++))
        fi
    else
        echo -e "  ${YELLOW}⚠️${NC} $file - yq not installed, skipping validation"
    fi
    ((total_files++))
}

# Check if collections directory exists
if [ ! -d "collections" ]; then
    echo -e "${RED}❌ Error: collections/ directory not found${NC}"
    exit 1
fi

echo "📋 Validating JSON files..."
# Find and validate all JSON files
while IFS= read -r -d '' file; do
    validate_json "$file"
done < <(find collections -name "*.json" -print0)

echo ""
echo "📋 Validating YAML files..."
# Find and validate all YAML files
while IFS= read -r -d '' file; do
    validate_yaml "$file"
done < <(find collections -name "*.yaml" -o -name "*.yml" -print0)

echo ""
echo "📋 Validating public_collections.yaml..."
if [ -f "public_collections.yaml" ]; then
    validate_yaml "public_collections.yaml"
else
    echo -e "  ${RED}❌${NC} public_collections.yaml not found"
    ((error_files++))
    ((total_files++))
fi

echo ""
echo "🏗️ Validating collection structure..."

# Check each collection directory
collection_count=0
valid_collections=0

for collection_dir in collections/*/; do
    if [ -d "$collection_dir" ]; then
        collection_name=$(basename "$collection_dir")
        ((collection_count++))
        
        echo "📁 Checking collection: $collection_name"
        
        # Check for metadata.json
        if [ -f "$collection_dir/metadata.json" ]; then
            echo -e "  ${GREEN}✅${NC} metadata.json exists"
            
            # Validate metadata structure
            if command -v jq >/dev/null 2>&1; then
                if jq -e '.name and .description' "$collection_dir/metadata.json" >/dev/null 2>&1; then
                    echo -e "  ${GREEN}✅${NC} metadata.json has required fields"
                else
                    echo -e "  ${RED}❌${NC} metadata.json missing required fields (name, description)"
                fi
            fi
        else
            echo -e "  ${RED}❌${NC} metadata.json missing"
        fi
        
        # Check for prompts directory
        if [ -d "$collection_dir/prompts" ]; then
            prompt_count=$(find "$collection_dir/prompts" -name "*.json" | wc -l)
            echo -e "  ${GREEN}✅${NC} prompts/ directory exists ($prompt_count prompts)"
        else
            echo -e "  ${YELLOW}⚠️${NC} prompts/ directory missing"
        fi
        
        # Check for workflows directory
        if [ -d "$collection_dir/workflows" ]; then
            workflow_count=$(find "$collection_dir/workflows" -name "*.yaml" -o -name "*.yml" | wc -l)
            echo -e "  ${GREEN}✅${NC} workflows/ directory exists ($workflow_count workflows)"
        else
            echo -e "  ${YELLOW}⚠️${NC} workflows/ directory missing"
        fi
        
        ((valid_collections++))
        echo ""
    fi
done

echo "📊 Validation Summary"
echo "==================="
echo "Collections: $collection_count"
echo "Total files: $total_files"
echo -e "Valid files: ${GREEN}$valid_files${NC}"
if [ $error_files -gt 0 ]; then
    echo -e "Error files: ${RED}$error_files${NC}"
else
    echo -e "Error files: ${GREEN}$error_files${NC}"
fi

echo ""
if [ $error_files -eq 0 ]; then
    echo -e "${GREEN}🎉 All validations passed!${NC}"
    exit 0
else
    echo -e "${RED}❌ Validation failed with $error_files errors${NC}"
    echo ""
    echo "💡 To fix validation errors:"
    echo "  - Install jq for JSON validation: brew install jq"
    echo "  - Install yq for YAML validation: brew install yq"
    echo "  - Check syntax errors in reported files"
    echo "  - Ensure all collections have metadata.json with name and description"
    exit 1
fi