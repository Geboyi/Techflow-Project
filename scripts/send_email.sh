#!/bin/bash
STATUS=$1
TO="dlaregboyi@gmail.com"
SUBJECT="TechFlow Deployment Status: $STATUS"
BODY="Deployment finished with status: $STATUS"

echo "$BODY" | mail -s "$SUBJECT" "$TO"