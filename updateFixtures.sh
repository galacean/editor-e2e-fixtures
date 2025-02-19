#!/usr/bin/env sh
version=$(node -p "require('./packages/pages/package.json').version.split('.').slice(0, 2).join('.')")

if [ -d "tests/fixtures" ]; then
  cd tests/fixtures
  git add .
  git commit -m "chore: update fixtures" || true
  current_branch=$(git rev-parse HEAD)
  git checkout $version
  git merge $current_branch
  git push --set-upstream origin $version || true
  cd ../..
fi

