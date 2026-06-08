#!/bin/bash

INTERNAL_ID=$(xinput list --id-only "AT Translated Set 2 keyboard")
EXTERNAL_NAME="Keychron K2"

if xinput list | grep -q "$EXTERNAL_NAME"; then
    xinput disable "$INTERNAL_ID"
else
    xinput enable "$INTERNAL_ID"
fi
