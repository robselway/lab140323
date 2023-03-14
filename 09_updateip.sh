#!/bin/bash

# Public IP address
IP="20.85.73.42"

# Resource Group that contains AKS Node Pool
KUBERNETES_NODE_RG="contoso-traders-aks-nodes-rg-886858"

# Name to associate with public IP address
DNSNAME="contoso-886858-ingress"

# Get the resource-id of the public ip
PUBLICIPID=$(az network public-ip list --resource-group $KUBERNETES_NODE_RG --query "[?ipAddress!=null]|[?contains(ipAddress, '$IP')].[id]" --output tsv)

# Update public ip address with dns name
az network public-ip update --ids $PUBLICIPID --dns-name $DNSNAME