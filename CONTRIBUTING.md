# Contributing — Cross-Device Collaboration Guide

## Two Accounts, One Person

| Account        | Device       | Typical Use                    |
|----------------|--------------|--------------------------------|
| `r4nd4lI`      | OnePlus 15   | Quick edits, reviews, deploys  |
| `j4mesbecker`  | MacBook Air  | Larger features, debugging     |

## Branch Naming

```
feature/<description>   # New features
fix/<description>       # Bug fixes
docs/<description>      # Documentation
chore/<description>     # Maintenance, deps, config
```

## Workflow

### Starting work (either device)

```bash
git checkout main
git pull origin main
git checkout -b feature/my-feature
```

### Handing off between devices

If you started work on one device and want to continue on the other:

```bash
# On the device you're leaving — push your WIP
git add -A && git commit -m "wip: saving progress"
git push -u origin feature/my-feature

# On the device you're picking up — pull it down
git fetch origin
git checkout feature/my-feature
git pull origin feature/my-feature
```

### Finishing work

```bash
# Push your branch
git push -u origin feature/my-feature

# Create a PR (via Claude Code or GitHub)
# Merge to main after CI passes
```

## Commit Message Format

```
type: short description

Optional longer explanation.
```

Types: `feat`, `fix`, `docs`, `chore`, `refactor`, `test`, `style`

## Quick Commands

Use `make` shortcuts instead of typing long commands:

```bash
make status    # git status + branch info
make sync      # pull latest main
make wip       # save work-in-progress and push
make pr        # create a pull request
```
