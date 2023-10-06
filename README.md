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

An keencli command has the following structure:

```sh
keencli <command> <subcommand> [options and parameters]
```

To view help documentation, use one of the following:

```sh
keencli --help
keencli <command> --help
keencli <command> <subcommand> --help
```

To get the version of the keencli:

```
keencli --version
```

## Install Bash completions

Set up autocomplete in bash into the current shell, bash-completion package should be installed first:

```sh
source <(keencli completions)
```

Add autocomplete permanently to your bash shell:

```sh
echo "source <(keencli completions)" >> ~/.bashrc
```

## Development

keencli uses [bashly](https://github.com/DannyBen/bashly/) for generating
the one-file script from files in the [src](src) directory

1. Install bashly (requires ruby):

   ```sh
   gem install bashly
   ```

1. Edit code in [src](src) directory

1. Generate script:

   ```sh
   bashly generate --upgrade
   ```
