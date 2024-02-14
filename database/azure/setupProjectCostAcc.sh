set -x

if [ $# -eq 0 ]
  then
    echo "missing the namespace";
    exit 0;
fi

namespace=$1
project=${2:-P1}
company=${3:-02000}


curl -X POST \
  -H "Content-Type: application/json" \
  -d '{"company":"'"$company"'","projectNumber":"'"$project"'"}' \
  https://jde-cimic-mockup-${namespace}.minerva-aks.minerva.nexploredevops.com/inbounds/account