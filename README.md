# zed-tera

[Zed](https://github.com/zed-industries/zed) extension for the [Tera](https://keats.github.io/tera/) templating language.

> [!TIP]
> *For Visual Studio Code support, see [uncenter/vscode-tera](https://github.com/uncenter/vscode-tera). For Helix and Neovim support, see [uncenter/tree-sitter-tera](https://github.com/uncenter/tree-sitter-tera).*

![Screenshot of highlighted sample Tera code in Zed with the zed-tera extension installed](./assets/preview.png)

_Zed with zed-tera. Screenshot taken with the [catppuccin/zed](https://github.com/catppuccin/zed) theme._

## Usage

Open `zed: extensions` in the [command palette](https://zed.dev/docs/getting-started#command-palette), and search for the "Tera" extension.

### Embedded/injected Language Support

If you would like syntax highlighting for the content around the Tera templating logic, you'll need to add the following (for each desired language, assuming it is supported[^1]) to your [Zed settings file](https://zed.dev/docs/configuring-zed#settings-files):

```json
  "file_types": {
    "Tera (<language>)": [
      "*.<extension>.tera"
    ]
  },
```

...where `<language>` is the proper name of the language, and `<extension>` is the respective file extension. For example, for HTML:

```json
  "file_types": {
    "Tera (HTML)": [
      "*.html.tera"
    ]
  },
```

> [!TIP]
> See [`examples/all-languages.json`](./examples/all-languages.json) for a complete settings file containing the `file_types` setting for all supported languages.

## License

[MIT](LICENSE)

[^1]: Supported languages: HTML, CSS, JSON, YAML, and TOML. Open an issue to request additional language support - dynamic language injection is currently not supported.
