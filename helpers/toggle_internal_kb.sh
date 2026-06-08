#!/bin/bash

INTERNAL_ID=$(xinput list --id-only "AT Translated Set 2 keyboard")
MASTER_ID=$(xinput list --id-only "Virtual core keyboard")   
echo $INTERNAL_ID 
echo $MASTER_ID

if xinput list "$INTERNAL_ID" | grep -q "floating slave"; then
    echo "Keyboard is currently disabled. Enabling..."
    xinput reattach "$INTERNAL_ID" "$MASTER_ID"
    echo "Keyboard (ID: $INTERNAL_ID) has been successfully enabled."
else
    echo "Keyboard is currently enabled. Disabling..."
    xinput float "$INTERNAL_ID"
    echo "Keyboard (ID: $INTERNAL_ID) has been successfully disabled."
fi
