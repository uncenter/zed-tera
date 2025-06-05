_default:
  @just --list

clean:
  rm -rf languages/

update: clean
  #!/usr/bin/env bash
  LANGUAGES=("html" "css" "json" "yaml" "toml" "")

  for LANGUAGE in "${LANGUAGES[@]}"; do
    UP_LANG=$(echo "$LANGUAGE" | tr '[:lower:]' '[:upper:]');

    if [[ -z "$LANGUAGE" ]]; then
      TARGET_DIR="languages/tera"
    else
      TARGET_DIR="languages/tera-$LANGUAGE"
    fi

    mkdir -p "$TARGET_DIR"

    cp ./template/brackets.scm "$TARGET_DIR/"
    cp ./template/highlights.scm "$TARGET_DIR/"
    cp ./template/injections.scm "$TARGET_DIR/"
    if [[ -n "$LANGUAGE" ]]; then
      sed "s/<lang>/$LANGUAGE/g" ./template/injections/content-manual.scm >> "$TARGET_DIR/injections.scm"
      cat ./template/config.toml | sed "s/name = \"Tera\"/name = \"Tera ($UP_LANG)\"/" ./template/config.toml | sed "s/path_suffixes = \[\]/path_suffixes = \[\"$LANGUAGE.tera\"\]/" > "$TARGET_DIR/config.toml"
    else
      sed 's/path_suffixes = \[\]/path_suffixes = \["tera"\]/' ./template/config.toml > "$TARGET_DIR/config.toml"
    fi
  done
