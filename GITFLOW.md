# GITFLOW

## Update loca repository

```bash
git fetch origin
```

## Commands to create a new branch
```bash
git checkout -b dev origin/dev
git checkout -b feature/database_script origin/dev

Examples
git checkout -b staging origin/dev
```

## Update a local branch

```bash
git checkout dev
git fetch origin
git rebase origin/dev
```

## Push branch to github

```bash
git push origin BRANCH_NAME
```