.PHONY: status sync wip pr log branches clean

# Show current status and branch
status:
	@echo "=== Branch ==="
	@git branch --show-current
	@echo ""
	@echo "=== Status ==="
	@git status -s
	@echo ""
	@echo "=== Recent Commits ==="
	@git log --oneline -5 2>/dev/null || echo "No commits yet"

# Pull latest main and rebase current branch
sync:
	@git fetch origin
	@git checkout main
	@git pull origin main
	@echo "Main is up to date."

# Save work-in-progress and push to remote
wip:
	@BRANCH=$$(git branch --show-current); \
	git add -A && \
	git commit -m "wip: saving progress on $$BRANCH" && \
	git push -u origin $$BRANCH && \
	echo "WIP pushed to $$BRANCH"

# Create a pull request for the current branch
pr:
	@BRANCH=$$(git branch --show-current); \
	echo "Creating PR for $$BRANCH -> main"; \
	git push -u origin $$BRANCH; \
	echo "Branch pushed. Create PR at:"; \
	echo "https://github.com/r4nd4lI/Collaborate/compare/main...$$BRANCH"

# Show recent log across all contributors
log:
	@git log --oneline --graph --all -20

# List all branches
branches:
	@echo "=== Local ==="
	@git branch
	@echo ""
	@echo "=== Remote ==="
	@git branch -r

# Clean up merged branches
clean:
	@git branch --merged main | grep -v "main" | xargs -r git branch -d
	@echo "Cleaned up merged branches."
