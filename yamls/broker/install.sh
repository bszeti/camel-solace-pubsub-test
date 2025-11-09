oc apply -f secret-admin-passwords.yaml
oc apply -f configmap-env.yaml

oc apply -f pubsub-ha.yaml

oc create route edge semp --service=ha-pubsubplus --port=tls-semp

