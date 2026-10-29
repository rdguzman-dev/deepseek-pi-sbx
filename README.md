# Requirements

1. `sbx` (requires a Docker account for authentication)
2. A DeepSeek API key

# Setup

1. Clone this repo:

```bash
git clone https://github.com/rdguzman-dev/deepseek-pi-sbx.git deepseek-pi-sbx
```

2. Create a custom secret:

```bash
sbx secret set-custom --host api.deepseek.com --env DEEPSEEK_API_KEY --value YOUR_DEEPSEEK_API_KEY
```

3. Run the agent sandbox:

```bash
sbx run ./path/to/deepseek-pi-sbx /path/to/example-project
```

> Note: sbx requires relative local kit references to start with `./`

4. (Optional) Create an alias:

```bash
pi-box() {
  sbx run ./path/to/deepseek-pi-sbx "${1:-.}"
}
```
