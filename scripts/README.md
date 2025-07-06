# Auto-Commit Scripts

Automated commit generation with conventional commit standards and best practices.

## Scripts

### `auto-commit.sh`
Main auto-commit script that analyzes changes and generates conventional commits automatically.

**Features:**
- Automatic commit type detection based on file patterns
- Conventional commit format (type(scope): description)
- Smart batching for large commits
- Configurable via JSON configuration

**Usage:**
```bash
./scripts/auto-commit.sh
```

### `quick-commit.sh`
Interactive commit script for manual commit type selection.

**Usage:**
```bash
./scripts/quick-commit.sh          # Interactive mode
./scripts/quick-commit.sh auto     # Use auto-commit
```

### `smart-commit.sh`
Future AI-enhanced commit script (placeholder).

### `setup-auto-commit.sh`
Setup script for configuration and git hooks.

**Usage:**
```bash
./scripts/setup-auto-commit.sh
```

## Configuration

Configuration is stored in `scripts/commit-config.json`:

```json
{
  "max_files_per_commit": 10,
  "auto_push": false,
  "commit_patterns": { ... },
  "scope_mapping": { ... },
  "file_type_mapping": { ... }
}
```

### Configuration Options

- `max_files_per_commit`: Maximum files per commit (default: 10)
- `auto_push`: Automatically push after commit (default: false)
- `commit_patterns`: Templates for commit messages
- `scope_mapping`: Directory to scope mapping
- `file_type_mapping`: File patterns to commit type mapping

## Commit Types

Following conventional commit standards:

- `feat`: New features
- `fix`: Bug fixes
- `docs`: Documentation changes
- `style`: Code style changes
- `refactor`: Code refactoring
- `test`: Adding or updating tests
- `chore`: Maintenance tasks
- `ci`: CI/CD changes
- `config`: Configuration changes
- `script`: Shell script changes
- `deps`: Dependency updates

## Examples

### Automatic Detection
```bash
# Changes to modulo1/README.md -> docs(module1): update README.md
# Changes to scripts/deploy.sh -> script(scripts): update deploy.sh
# Multiple files -> feat: add new features and components
```

### Manual Override
```bash
git add specific-files
git commit -m "feat(module2): add new exercise solution"
```

## Best Practices

1. **Keep commits small and focused**
2. **Use descriptive commit messages**
3. **Stage related changes together**
4. **Review changes before committing**
5. **Follow conventional commit format**

## Dependencies

Optional dependencies for enhanced functionality:
- `jq`: JSON parsing for configuration
- `shfmt`: Shell script formatting
- `git`: Version control (required)

## Installation

1. Make scripts executable:
```bash
chmod +x scripts/*.sh
```

2. Run setup:
```bash
./scripts/setup-auto-commit.sh
```

3. Start using:
```bash
./scripts/auto-commit.sh
```
