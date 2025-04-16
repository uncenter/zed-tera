# zed-tera

[Zed](https://github.com/zed-industries/zed) extension for the [Tera](https://keats.github.io/tera/) templating language.

> [!TIP]
> For Visual Studio Code support, see [uncenter/vscode-tera](https://github.com/uncenter/vscode-tera). For Helix and Neovim support, see [uncenter/tree-sitter-tera](https://github.com/uncenter/tree-sitter-tera). For Sublime Text support, see [MuntasirSZN/sublime-tera](https://github.com/MuntasirSZN/sublime-tera).

![Screenshot of highlighted sample Tera code in Zed with the zed-tera extension installed](./assets/preview.png)

_Zed with zed-tera. Screenshot taken with the [catppuccin/zed](https://github.com/catppuccin/zed) theme._

## Usage

Open `zed: extensions` in the [command palette](https://zed.dev/docs/getting-started#command-palette), and search for the "Tera" extension.

### Embedded/injected Language Support

I suggest adding the following to either your user or project `settings.json` to automatically apply injected language highlighting for Tera files with different extensions. Zed unfortunately does not allow extensions like this one set the language for files with multiple extensions[^1], so this is the best workaround for now.

```json
{
	"file_types": {
		"Tera (CSS)": ["*.css.tera"],
		"Tera (HTML)": ["*.html.tera"],
		"Tera (JSON)": ["*.json.tera"],
		"Tera (TOML)": ["*.toml.tera"],
		"Tera (YAML)": ["*.yaml.tera"]
	}
}
```

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

If you work in a project with multiple Tera templates with non-`.tera` file extensions (such as `.html`/`.css` templates using Tera syntax), you can add something like the following to the `.zed/settings.json` file in your project.

```json
{
	"file_types": {
		"Tera (HTML)": ["html"]
	}
}
```

## License

[MIT](LICENSE)

[^1]: See [zed-industries/zed#10997](https://github.com/zed-industries/zed/issues/10997).
