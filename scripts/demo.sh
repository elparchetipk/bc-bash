#!/bin/bash
# Demo script for testing the automated commit system

echo "=== Automated Commit System Demo ==="
echo ""

# Show current status
echo "📊 Current Git Status:"
./scripts/commit.sh status
echo ""

# Show configuration
echo "⚙️  System Configuration:"
./scripts/commit.sh config
echo ""

echo "🚀 Available Commands:"
echo "  ./scripts/commit.sh auto     # Automatic commits"
echo "  ./scripts/commit.sh quick    # Interactive commits"  
echo "  ./scripts/commit.sh status   # Show status"
echo "  ./scripts/commit.sh config   # Show configuration"
echo ""

echo "✅ System Ready! Minimal intervention required."
echo "   Just run: ./scripts/commit.sh auto"
