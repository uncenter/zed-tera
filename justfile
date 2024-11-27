_default:
  @just --list

clean:
  rm -rf languages/

update: clean
  #!/usr/bin/env bash
  HIGHLIGHTS_URL="https://raw.githubusercontent.com/uncenter/tree-sitter-tera/main/queries/highlights.scm"
  HIGHLIGHTS_CONTENT=$(curl -s "$HIGHLIGHTS_URL")

  if [[ -z "$HIGHLIGHTS_CONTENT" ]]; then
    echo "Failed to fetch tree-sitter-tera highlights.scm from GitHub."
    exit 1
  fi

  LANGUAGES=("html" "css" "json" "yaml" "toml" "")

  EXAMPLE_ALL_LANGUAGES="{\n  \"file_types\": {"

  for LANGUAGE in "${LANGUAGES[@]}"; do
    UP_LANG=$(echo "$LANGUAGE" | tr '[:lower:]' '[:upper:]');

    if [[ -z "$LANGUAGE" ]]; then
      TARGET_DIR="languages/tera"
    else
      TARGET_DIR="languages/tera-$LANGUAGE"
      EXAMPLE_ALL_LANGUAGES+="\n    \"Tera ($UP_LANG)\": [\"*.$LANGUAGE.tera\"],"
    fi

    mkdir -p "$TARGET_DIR"

    cp ./template/brackets.scm "$TARGET_DIR/"
    echo "$HIGHLIGHTS_CONTENT" > "$TARGET_DIR/highlights.scm"
    if [[ -n "$LANGUAGE" ]]; then
      sed "s/<lang>/$LANGUAGE/g" ./template/injections.scm > "$TARGET_DIR/injections.scm"
      sed "s/name = \"Tera\"/name = \"Tera ($UP_LANG)\"/" ./template/config.toml > "$TARGET_DIR/config.toml"
    else
      sed 's/path_suffixes = \[\]/path_suffixes = \["tera"\]/' ./template/config.toml > "$TARGET_DIR/config.toml"
    fi
  done
  echo -e "${EXAMPLE_ALL_LANGUAGES%$','}\n  }\n}" > ./examples/all-languages.json
