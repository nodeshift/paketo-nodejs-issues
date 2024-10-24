bash get-repos.sh >repos.txt
echo paketo-buildpacks/nodejs >>repos.txt
echo paketo-community/ubi-nodejs-extension >>repos.txt

date=$(date '+%Y-%m-%d')

echo "Report date - $date)" >report

while read repo; do
  bash get-issues.sh "$repo" >> report 
  echo "" >>report
done <repos.txt

cat report |grep -v Bump |grep -v Failure | grep -v bump | \
    grep -v "Cut buildpack releases" | grep -v "Updates github-config" >report-stripped
