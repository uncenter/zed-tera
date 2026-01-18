# zed-tera

[Zed](https://github.com/zed-industries/zed) extension for the [Tera](https://keats.github.io/tera/) templating language.

> [!TIP]
> See also Tera extensions for other editors:
> - Helix and Neovim: [uncenter/tree-sitter-tera](https://github.com/uncenter/tree-sitter-tera)
> - Visual Studio Code: [uncenter/vscode-tera](https://github.com/uncenter/vscode-tera)
> - Sublime Text: [MuntasirSZN/sublime-tera](https://github.com/MuntasirSZN/sublime-tera)

![Screenshot of highlighted sample Tera code in Zed with the zed-tera extension installed](./assets/preview.png)

_Zed with zed-tera. Screenshot taken with the [catppuccin/zed](https://github.com/catppuccin/zed) theme._

## Installation

1. Open `zed: extensions` in the [command palette](https://zed.dev/docs/getting-started#command-palette) (<kbd>Cmd</kbd>+<kbd>Shift</kbd>+<kbd>X</kbd>).
2. Search for the "Tera" extension.
3. Click install.

## Usage

### Embedded/injected language support

This extension automatically injects highlighting for "content" within Tera files based on the file extension. To highlight a Tera template for JSON, use the `*.json.tera` extension. Similarly, you can use `*.css.tera`, `*.html.tera`, `*.toml.tera`, `*.yaml.tera`, and `*.xml.tera` for CSS, HTML, TOML, YAML, and XML respectively (please open an issue if you need support for another language).

#### Default to HTML highlighting of content

If you want all `.tera` files to highlight surrounding content as HTML (without having to use the `.html.tera` extension), you can add the following to your project or user config:

```json
{
  "file_types": {
    "Tera (HTML)": ["tera"]
  }
}
```

#### Use a different file extension with Tera syntax highlighting

If you work in a project with Tera templates that don't use the `.tera` file extension (such as `.html` files using Tera syntax), consider adding the following to the `.zed/settings.json` file in your project.

```json
{
  "file_types": {
    "Tera (HTML)": ["html"]
  }
}
```

This sets the file type for `.html` files to `Tera (HTML)`, which will highlight the content as HTML.

## License

[MIT](LICENSE)
