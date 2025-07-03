# Puzzle ITC Ansible Training

In the guided hands-on training, participants are able to learn the basics of [Ansible](https://www.ansible.com/).

For more see [Puzzle Ansible Training online](https://ansible.puzzle.ch/).

:rocket: Changing IT for the better with Ansible!

## Content Sections

The training content resides within the [content](content) directory.

The main part are the labs, which can be found at [content/en/docs](content/en/docs).

## Hugo

This site is built using the static page generator [Hugo](https://gohugo.io/).

The page uses the [docsy theme](https://github.com/google/docsy).
Docsy is being enhanced using [docsy-plus](https://github.com/acend/docsy-plus/) as well as [docsy-puzzle](https://github.com/puzzle/docsy-puzzle/).

### Docsy Theme Usage

* [Official docsy documentation](https://www.docsy.dev/docs/)
* [Docsy Plus](https://github.com/acend/docsy-plus/)

## Build using Docker

Build the image:

```bash
docker build . -t puzzle/ansible-techlab:latest
```

Run it locally:

```bash
docker run -i -p 8080:8080 puzzle/ansible-techlab
```
## Development Environment with Nix Flakes

This project provides **reproducible development environments** using [Nix flakes](https://nixos.org/download). Two separate dev shells are defined in the `flake.nix` file:

- **hugo**: A shell with all dependencies for the Hugo-based website development
- **slide**: A shell with all dependencies for building and surfe the slides

Both environments ensure all required tools and libraries are available, regardless of your host system.

### Prerequisites: Install Nix

To use these development shells, you must have **Nix** installed on your system.  
Follow the official installation guide: [Nix Installation Guide](https://nixos.org/download/).

After installation, make sure to enable flakes by adding the following to your `~/.config/nix/nix.conf`:

```
experimental-features = nix-command flakes
```

### Usage

To enter a development shell, run the following commands from the project root:

#### Hugo Environment

```sh
nix develop .#hugo
```

#### Slide Environment

```sh
nix develop .#slide
```

This will drop you into a shell with all dependencies set up for the respective environment. When you exit the shell, all dependencies are cleaned up automatically.

## Contributions

If you find errors, bugs or missing information, please help us improve our training and have a look at the [Contribution Guide](CONTRIBUTING.md).
