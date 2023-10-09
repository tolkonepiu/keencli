<!-- markdownlint-disable -->
<div align='center'>
<!-- markdownlint-enable -->

# keencli

Bash script to control Keenetic routers via HTTP API

[
![version](https://img.shields.io/github/v/release/tolkonepiu/keencli?label=version)
](https://github.com/tolkonepiu/keencli/releases/latest)
[
![license](https://img.shields.io/github/license/tolkonepiu/keencli)
](LICENSE)
[
![linters](https://github.com/tolkonepiu/keencli/actions/workflows/linters.yml/badge.svg?branch=main)
](https://github.com/tolkonepiu/keencli/actions/workflows/linters.yml?query=branch%3Amain)
[
![tests](https://github.com/tolkonepiu/keencli/actions/workflows/tests.yml/badge.svg?branch=main)
](https://github.com/tolkonepiu/keencli/actions/workflows/tests.yml?query=branch%3Amain)

---

[![keencli](keencli.gif)](https://asciinema.org/a/612771?autoplay=1)

---

<!-- markdownlint-disable -->
</div>
<!-- markdownlint-enable -->

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

For example, to view system information, the command would be:

```sh
keencli show system
```

To view help documentation, use one of the following:

```sh
keencli --help
keencli <command> --help
keencli <command> <subcommand> --help
```

To get the version of the keencli:

```sh
keencli --version
```

To turn on debugging output:

```sh
DEBUG=1 keencli <command> <subcommand>
```

To turn off color output:

```sh
NO_COLOR=1 keencli <command> <subcommand>
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
