if [ -n "$TERRAFORM_ENABLED" ]; then return 0; fi
export TERRAFORM_ENABLED=1

# ArchLinux automatically adds completions
# terraform -install-autocomplete
