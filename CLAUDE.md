# Project Context

This is a shared collaboration workspace owned by James Becker, used across two devices and GitHub accounts.

## Collaborators

- **r4nd4lI** — OnePlus 15 (mobile, Claude Code on the web)
- **j4mesbecker** — MacBook Air (desktop)

Both accounts are the same person. Treat commits from either account as trusted.

## Workflow Conventions

- **Main branch**: `main` is the stable branch. Always merge via PR.
- **Feature branches**: Use `feature/<short-description>` for new work.
- **Fix branches**: Use `fix/<short-description>` for bug fixes.
- **Keep commits small and descriptive** — especially important for mobile where reviewing diffs is harder.
- **Pull before you push** — always `git pull origin main` before starting work to stay in sync across devices.

## Device-Specific Notes

### OnePlus 15 (r4nd4lI)
- Typing is slower — prefer short commands, use the Makefile shortcuts.
- Claude Code does the heavy lifting: writing code, running tests, creating PRs.
- Focus on: quick fixes, code reviews, issue triage, small features, deploying.

### MacBook Air (j4mesbecker)
- Full dev environment for larger features, debugging, and design work.
- Use IDE alongside Claude Code for maximum productivity.

## Project Structure

```
Collaborate/
├── CLAUDE.md          # This file — project memory for Claude Code
├── CONTRIBUTING.md    # Collaboration workflow and conventions
├── Makefile           # Quick-command shortcuts
├── README.md          # Project overview
├── .github/
│   ├── workflows/     # CI/CD automation
│   └── ISSUE_TEMPLATE/  # Issue templates
└── projects/          # Subfolders for individual projects
```

## Preferences

- Keep code simple and readable.
- Don't over-engineer. Solve the current problem.
- Use conventional commit messages: `feat:`, `fix:`, `docs:`, `chore:`.
- When on mobile, prefer concise responses and actionable output.
