#!/bin/bash

INGRESS_DOMAIN=$(oc get IngressController default -n openshift-ingress-operator -o jsonpath='{.status.domain}')
NAMESPACE=${NAMESPACE:-"preprod"}

( echo "cat <<EOF" ; cat cloud-pak-dashboard.yaml_template ;) | \
INGRESS_DOMAIN=${INGRESS_DOMAIN} \
NAMESPACE=${NAMESPACE} \
sh > cloud-pak-dashboard.yaml

( echo "cat <<EOF" ; cat decision-server-console.yaml_template ;) | \
INGRESS_DOMAIN=${INGRESS_DOMAIN} \
NAMESPACE=${NAMESPACE} \
sh > decision-server-console.yaml


( echo "cat <<EOF" ; cat decision-server-runtime.yaml_template ;) | \
INGRESS_DOMAIN=${INGRESS_DOMAIN} \
NAMESPACE=${NAMESPACE} \
sh > decision-server-runtime.yaml
