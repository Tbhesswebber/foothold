# Foothold

The quickest way to get a computer set up with all the tools I want and some I don't.

## What it does

### Installed Tools

| Tool       | Package Managers | Notes                                                                                     |
| ---------- | ---------------- | ----------------------------------------------------------------------------------------- |
| GitHub CLI | `brew` `apt`     | Installed and configured as part of setup (unnecessarily? - could move setup to post-run) |
| Snap Store | `apt`            | Need to ensure snap is installed for certain tools                                        |
| Slack      | `brew` `apt`     |                                                                                           |
| Chrome     | `brew` `apt`     |                                                                                           |
| Zoom       | `brew` `apt`     |                                                                                           |

| Z Shell | `apt` | Already installed on Mac |
| Oh My Zsh | | All machines (needs curl first) |

## Running the script

### Pre-requisites

#### Operating Systems

This script is currently only built to work on macOS and Ubuntu (latest), although it might work on any systems that have certain package managers installed.

### Initial computer setup

1. Clone this repository
2. Ensure that you have the prerequisites installed
3. From your terminal, navigate to this repo
4. Run `/bin/bash ./runner.sh`
