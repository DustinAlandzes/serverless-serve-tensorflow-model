export AWS_DEFAULT_REGION=us-west-2
chalice package --pkg-format terraform ../../terraform

# remove the provider block
cat ../../terraform/chalice.tf.json | jq 'del(.terraform)' > /tmp/chalice.tf.json
rm ../../terraform/chalice.tf.json
mv /tmp/chalice.tf.json ../../terraform/chalice.tf.json