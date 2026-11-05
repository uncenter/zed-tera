_default:
  @just --list

clean:
  rm -rf languages/

generate: clean
  #!/usr/bin/env bash
  # <identifier>:<display name>
  LANGUAGES=(
    "html:HTML"
    "css:CSS"
    "json:JSON"
    "yaml:YAML"
    "toml:TOML"
    "xml:XML"
    "md:Markdown"
    "" # plain tera
  )

  for ENTRY in "${LANGUAGES[@]}"; do
    IDENTIFIER="${ENTRY%%:*}"
    DISPLAY_NAME="${ENTRY#*:}"

    if [[ -z "$IDENTIFIER" ]]; then
      TARGET_DIR="languages/tera"
    else
      TARGET_DIR="languages/tera-$IDENTIFIER"
    fi

    mkdir -p "$TARGET_DIR"

    cp ./template/brackets.scm "$TARGET_DIR/"
    cp ./template/highlights.scm "$TARGET_DIR/"
    cp ./template/injections.scm "$TARGET_DIR/"
    if [[ -n "$IDENTIFIER" ]]; then
      sed "s/<lang>/$IDENTIFIER/g" ./template/injections/content-manual.scm >> "$TARGET_DIR/injections.scm"
      sed -e "s|name = \"Tera\"|name = \"Tera ($DISPLAY_NAME)\"|" \
          -e "s|path_suffixes = \[\]|path_suffixes = [\"$IDENTIFIER.tera\"]|" \
          ./template/config.toml > "$TARGET_DIR/config.toml"
    else
      sed 's/path_suffixes = \[\]/path_suffixes = \["tera"\]/' ./template/config.toml > "$TARGET_DIR/config.toml"
    fi
  done
