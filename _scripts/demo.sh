#!/bin/bash
# Demo script for testing the automated commit system

echo "=== Automated Commit System Demo ==="
echo ""

# Show current status
echo "📊 Current Git Status:"
./_scripts/commit.sh status
echo ""

# Show configuration
echo "⚙️  System Configuration:"
./_scripts/commit.sh config
echo ""

echo "🚀 Available Commands:"
echo "  ./_scripts/commit.sh auto     # Automatic commits"
echo "  ./_scripts/commit.sh quick    # Interactive commits"  
echo "  ./_scripts/commit.sh status   # Show status"
echo "  ./_scripts/commit.sh config   # Show configuration"
echo ""

echo "✅ System Ready! Minimal intervention required."
echo "   Just run: ./_scripts/commit.sh auto"
