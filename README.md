# zed-tera

[Zed](https://github.com/zed-industries/zed) extension for the [Tera](https://keats.github.io/tera/) templating language.

> [!TIP]
> For Visual Studio Code support, see [uncenter/vscode-tera](https://github.com/uncenter/vscode-tera). For Helix and Neovim support, see [uncenter/tree-sitter-tera](https://github.com/uncenter/tree-sitter-tera).

![Screenshot of highlighted sample Tera code in Zed with the zed-tera extension installed](./assets/preview.png)

_Zed with zed-tera. Screenshot taken with the [catppuccin/zed](https://github.com/catppuccin/zed) theme._

## Usage

Open `zed: extensions` in the [command palette](https://zed.dev/docs/getting-started#command-palette), and search for the "Tera" extension.

### Embedded/injected Language Support

#### Set content highlighting for current file

If you would like syntax highlighting for the content around the Tera templating logic, open the language selector for the current Tera file with `language selector: toggle` (or <kbd>Command</kbd>+<kbd>K</kbd>+<kbd>M</kbd>), and type in "Tera". Along with the default "Tera" language, you'll see a few other options for each supported language[^1] in the format of `Tera (<language>)`. Select your desired language combination to enable it for the current file.

#### Default to HTML highlighting of content

If you want all `.tera` files to highlight surrounding content as HTML, you can add the following to your project or user config:

```json
{
	"file_types": {
		"Tera (HTML)": ["tera"]
	}
}
```

#### Use a different file extension with Tera syntax highlighting

If you work in a project with multiple Tera templates with non-`.tera` file extensions (such as `.html`/`.css` website templates with Tera syntax), you can add something like the following to the `.zed/settings.json` file in your project.

```json
{
	"file_types": {
		"Tera (HTML)": ["html"]
	}
}
```

## License

[MIT](LICENSE)

[^1]: Supported languages: HTML, CSS, JSON, YAML, and TOML. Open an issue to request additional language support. Dynamic language injection (auto-detection or similar) is currently not supported.
