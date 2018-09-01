#!/bin/sh

# Create one single manifest file
target="./manifests-all.yaml"
if [ -f "$target" ]; then
  rm "$target"
fi
for file in $(find ./manifests -type f -name "*.yaml" | sort) ; do
  echo "---" >> "$target"
  cat "$file" >> "$target"
done

# replace env variables in manifest file
source ./.env
for line in `cat .env` ; do
  var=$(echo -n $line   | awk 'BEGIN {FS="="} {print $1}')
  value=$(echo -n $line | awk 'BEGIN {FS="="} {print $2}')
  sed -i "s#\$$var#$value#g" ./manifests-all.yaml
done

kubectl create namespace $NAMESPACE
kubectl -n $NAMESPACE create secret generic consul-basic-secret --from-literal="$BASIC_USER=$BASIC_HASH"
kubectl -n $NAMESPACE apply -f ./manifests-all.yaml

rm manifests-all.yaml
