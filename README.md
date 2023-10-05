# keencli

Bash script to control Keenetic routers via HTTP API.

## Requirements

- GNU/Linux or macOS with Bash 4+
- [yq](https://mikefarah.gitbook.io/yq/)
- [curl](https://curl.se)

## Supported routers

Tested with KeeneticOS 3.5+

## Install

Download bash script there and make it executable:

```sh
wget https://github.com/tolkonepiu/keencli/raw/main/keencli/
chmod +x keencli
```

## Usage

Use integrated help screens for available options and examples for each command.

```sh
keencli --help
```

## Development

keencli uses [bashly](https://github.com/DannyBen/bashly/) for generating
the one-file script from files in the [src](src) directory

1. Install bashly (requires ruby)

   ```sh
   gem install bashly
   ```

1. Edit code in [src](src) directory

1. Generate script

   ```sh
   bashly generate --upgrade
   ```
