bash get-repos.sh >repos.txt

date=$(date '+%Y-%m-%d')

echo "Report date - $date)" >report

while read repo; do
  bash get-issues.sh "$repo" >> report 
  echo "" >>report
done <repos.txt

cat report |grep -v Bump |grep -v Failure >report-stripped
