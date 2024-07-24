export REPO="$1"

echo "REPO: $REPO"
echo

echo "Issues:"
echo "------------------"
curl -L \
  -H "Accept: application/vnd.github+json" \
  https://api.github.com/repos/$REPO/issues?per_page=100 | jq -r '.[] | "\(.title) - \(.html_url)"'

echo
echo "Pull Requests:"
echo "------------------"
curl -L \
  -H "Accept: application/vnd.github+json" \
  https://api.github.com/repos/$REPO/pulls?per_page=100 | jq -r '.[] | "\(.title) - \(.html_url)"'
