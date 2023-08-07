![Version](https://img.shields.io/badge/version-2.2.0-orange.svg)
![Platform](https://img.shields.io/badge/platform-macOS%20%7C%20ubuntu%20%7C%20gentoo-yellow.svg)
![Shellcheck](https://github.com/vigo/dotfiles-light/actions/workflows/shellcheck.yml/badge.svg)
![Powered by Rake](https://img.shields.io/badge/powered_by-rake-blue?logo=ruby)

# Dotfiles LIGHT

![Example Terminal](https://github.com/vigo/dotfiles-light/raw/screens/vigo-terminal.png)

![Example Terminal](https://github.com/vigo/dotfiles-light/raw/screens/tarik-kavaz-terminal.png)


## Features

### Common Features

* Highly configurable **prompt shell** features
* Enhanced `history`, formatted output, continuous history across terminal tabs.
* Auto included `PATH` information. `~/bin`, `/usr/local/sbin` and more.
* Bash completions
   - `bundler`, `gem`, `rake`
   - `django-admin`, `manage.py`,
   - `hg`, `printenv`, `pip`
* Better `~/.inputrc`
* Colorful file lists!
* Colorful `man` and `less` output!
* Enable of disable color feature!

#### Special Prompts

- `bash version`, `ip list`
- `git`, `hg`
- `python`, `pyenv`, `django`, `virtualenv`
- `ruby`, `rbenv`
- `node`, `npm`, `yarn`
- `golang`
- `redis`, `mysql`, `postgresql`, `mongodb`, `pgvm`
- `docker`

### macOS Only Features

* Autoload for `brew`: bash-completion
* Linux style file listing if `coreutils` installed from `brew` (*folders on top!*)
* Bunch of useful `alias` examples.
* `whoseport` command, thanks to [Francesc Campoy](https://github.com/campoy)

#### `whoseport`

Sometimes you may need to find the process for the port in use (*already*):

```bash
$ whoseport 8000
python3.9 70077 vigo    4u  IPv6 0x1fe3a0ca93fc0c17      0t0  TCP *:irdmi (LISTEN)

$ kill 70077
```

---

### Common aliases

Try these commands:

* `rm`, `mv`, `rmdir`, `mkdir`: You need to confirm!
* `cp`: Preserve attributes and copy verbose by default!
* `l`, `ll`, `la`: Nice Linux-ish (*well 100% same!*) lists.
* `what_is_my_ip_opendns`, `what_is_my_ip`: Using `dig` or `curl` can tell your real IP address!

### macOS aliases

* `desktop_hide`, `desktop_show`: You can show/hide all icons on your desktop via single command!
* `shadow_screenshot_disable`, `shadow_screenshot_enable`: Enable/disable shadows while taking screenshots!
* `ds_store_clear`: Delete `.DS_Store` files :)
* `lock_screen`: Going for lunch? lock it asap!

### Common functions/commands

* `dataurl`: Data url for image file: `dataurl my_picture.jpg`
* `gz_analyse`: Analyses gzipped/non-gzipped versions of a file: `gz_analyse my_file.txt`
* `mkdir_cd`: Create folder and cd in to it: `mkdir_cd foo`
* `mkdir_now`: Create folder via time stamp: `2021-04-12-135850` (YEAR-MM-DD-HHMMSS)
* `mkdir_now_short`: Create folder via time stamp: `2021-04-12` (YEAR-MM-DD)
* `mkdir_now_cd`: Create folder via `mkdir_now` and `cd` to folder: `mkdir 2021-04-12-135850 && cd 2021-04-12-135850`
* `mkdir_now_cd_short`: Create folder via `mkdir_now_short` and `cd` to folder: `mkdir 2021-04-12 && cd 2021-04-12`
* `makedir`: Helper for built-in `makedir` to fix `:` char issues.
* `webserver`: That folder becomes a website! (*via python*): `cd /folder/;webserver`
* `webserver_rb`: That folder becomes a website! (*via ruby*): `cd /folder/;webserver_rb`
* `mmv`, `mcp`: Magic Move/Copy aka `mmv` or `mcp`. Edit your file target name on-the-fly!

---

### Apple M1 Silicon

For [Homebrew](https://brew.sh) integration:

```bash
# /opt/homebrew/bin/brew shellenv > /path/to/Dotfiles/options 

# example:
/opt/homebrew/bin/brew shellenv > ~/Dotfiles/options 
```

`options` is loaded first while initialization process and already added to
`.gitignore` file. This will inject homebrew related environment variables and
updates `PATH` variable and other required brew environment variables.

---

## What’s New ?

**May 9, 2022, still Corona Days!**

- Add Ubuntu - Homebrew support

**March, 29, 2022, Corona Days**

- Add `makedir` function
- Improve `mkdir_cd` function

Both functions use `DFL_MKDIRCD_REPLACEWITH` environment variable to fix
macOS related `:` char removal. By default, `DFL_MKDIRCD_REPLACEWITH` value
is set to: `-` which means, if you;

- `mkdir_cd "hello: world"`
- `makedir "hello: world"`

Your folder name will be: `hello- world`. I set `DFL_MKDIRCD_REPLACEWITH=" -"`
as default, `"hello: world"` becomes -> `"hello - world"`

**December, 10, 2021, Corona Days, Positive**

- Add `whoseport` for OSX

**November 30, 2021, Corona Days**

- Add `mkdir_now_short` and `mkdir_now_cd_short` :)

**October 4, 2021, Corona Days**

- Removed `pipx` bash-completion handler. Please use `brew install pipx`

---

## Install & Uninstall

### Requirements for macOS

All you need is `git`. If you have [Homebrew](https://brew.sh) installed, you can
add these packages (*they are not required*):

```bash
brew install git-extras coreutils
````

### Requirements for Ubuntu and Gentoo

Need `git` only!

```bash
sudo apt install -y git-core # Ubuntu
sudo emerge dev-vcs/git      # Gentoo
````

### Install:

```bash
git clone https://github.com/vigo/dotfiles-light.git $HOME/Dotfiles
bash $HOME/Dotfiles/scripts/install.bash
# Restart your Terminal
````

### Remove:

```bash
bash $HOME/Dotfiles/scripts/uninstall.bash
# Restart your Terminal
````

## Configuration

There is almost no-configuration :) There are few extras if you like to use.
Put all your custom/private stuff under `private/` folder. (*Root of the
repo*)

    .
    ├── private/               ---> your private stuff folder! will load last!
    ├── ps1/
    ├── rc/
    ├── scripts/
    ├── startup-sequence/
    ├── LICENSE.txt
    ├── README.md
    ├── options                ---> your private flags set/unset variables or functions will load first!
    └── profile

When you clone the repo, you won’t see `options` file and `private/` folder.
They are both in `.gitignore`. If `~/Dotfiles/options` file exists, `bashrc`
will load it first. Everything under `private/` folder will be loaded last.

By default, color features are enabled. If you don’t like to use it just
un-set some BASH variables in `options` file.

```bash
cd $HOME/Dotfiles
touch options

# open options and
unset DFL_LS_COLOR    # disables `ls` colors
unset DFL_LESS_COLOR  # disables `man` colors
unset DFL_PS1_COLORS  # disables `PS1` colors
````

Put all your private `aliases`, `env` and your custom `ps1` files under
`private/` folder. Here is an example:

```bash
cd $HOME/Dotfiles
mkdir private
cd private
touch ps1

# open ps1
CUSTOM_PS1="${PROMPT_HORIZONTAL_LINE}
${PROMPT_MEMORY}${PROMPT_BATTERY}
${PROMPT_USER_AND_HOSTNAME}
${PROMPT_DATABASE_STATUS}${PROMPT_VIRTUALENV}${PROMPT_RUBY_RBENV}${PROMPT_PYTHON_PYENV}${PROMPT_NODE_VERSION}${PROMPT_GO_VERSION}
${PROMPT_GIT}${PROMPT_HG}
$ "

export PS1="${CUSTOM_PS1}"
````

### `PS1` ELEMENTS

Available elements are;

    ${PROMPT_HORIZONTAL_LINE}
    ${PROMPT_BASH_VERSION_INFO}
    ${PROMPT_USER_AND_HOSTNAME}
    ${PROMPT_GIT}
    ${PROMPT_HG}
    ${PROMPT_MEMORY}                # macOS Only
    ${PROMPT_BATTERY}               # macOS Only
    ${PROMPT_IPS_LIST}
    ${PROMPT_DATABASE_STATUS}       # macOS Only
    ${PROMPT_VIRTUALENV}
    ${PROMPT_RUBY_RBENV}
    ${PROMPT_PYTHON_PYENV}
    ${PROMPT_NODE_VERSION}
    ${PROMPT_GO_VERSION}
    ${PROMPT_PGVM_VERSION}          # macOS Only
    ${PROMPT_DOCKER_STATUS}         # macOS Only

Most of the command responses are placed in brackets. Such as;

    [◎ 6.81G]      # macOS available memory prompt

You can remove or change brackets via `DFL_PROMPT_BRACKET_OPEN` and
`DFL_PROMPT_BRACKET_CLOSE` environment variables. Defaults are `[` and `]`.

### Color Configuration

You can set the color of every-bit in `PS1`. Available color and style
variables are defined under `startup-sequence/sample-ps1-colors`. General
color names (*variables*) are stored under `startup-sequence/colors`:

    ${black}
    ${red}
    ${green}
    ${yellow}
    ${blue}
    ${magenta}
    ${cyan}
    ${white}
    ${gray}

Styles are:

    ${bold}
    ${underline}
    ${reverse}
    ${blink}

Predefined formats are:

    ${white_on_black}
    ${white_on_red}
    ${white_on_green}
    ${white_on_yellow}
    ${white_on_blue}
    ${white_on_magenta}
    ${white_on_cyan}
    ${black_on_white}
    ${red_on_white}
    ${green_on_white}
    ${yellow_on_white}
    ${blue_on_white}
    ${magenta_on_white}
    ${cyan_on_white}

You can even combine them:

```bash
export DFL_RBENV_PROMPT_COLOR="${bold}${yellow}${blink}"
```

You can create a copy of sample colors for customization:

```bash
cp ${HOME}/Dotfiles/startup-sequence/sample-ps1-colors ${HOME}/Dotfiles/private/my-colors
```

Color variables are stored under `startup-sequence/colors`. You can implement
your own color combinations. Bash color information can be found [here](https://tldp.org/HOWTO/Bash-Prompt-HOWTO/x329.html)

Example color/icon and variable names:

```bash
export DFL_HORIZONTAL_LINE_PROMPT_COLOR="${gray}"   # [------]
export DFL_BASH_VERSION_INFO_PROMPT_ICON="ANY TEXT" # default: ⏍
export DFL_BASH_VERSION_INFO_PROMPT_COLOR="${gray}" # [4.4.5(1)-release]
export DFL_MEMORY_PROMPT_COLOR="${green}${bold}"    # [2.43G]

# vigo at noto.local in ~
export DFL_USER_HOSTNAME_USER_PROMPT_COLOR="${blue}"
export DFL_USER_HOSTNAME_HOSTNAME_PROMPT_COLOR="${red}"
export DFL_USER_HOSTNAME_CWD_PROMPT_COLOR="${white}"

# git/hg
export DFL_REVCONTROL_BRANCH_COLOR="${green}"                       # master
export DFL_REVCONTROL_AT_SIGN_COLOR="${white}"                      # @
export DFL_REVCONTROL_COMMIT_ID_COLOR="${underline}"                # 4a449eb1d5e5
export DFL_REVCONTROL_UNTRACKED_COLOR="${red}"                      # □
export DFL_REVCONTROL_ADDED_COLOR="${yellow}${bold}"                # ■
export DFL_REVCONTROL_MODIFIED_COLOR="${green}"                     # ◆
export DFL_REVCONTROL_RENAMED_COLOR="${yellow}"                     # ◇
export DFL_REVCONTROL_DELETED_COLOR="${blink}${magenta}"            # ◌
export DFL_REVCONTROL_TYPECHANGED_COLOR="${cyan}"                   # ❖
export DFL_REVCONTROL_OVERALL_COLOR="${white}"                      #
export DFL_REVCONTROL_VERTICAL_PIPE_COLOR="${gray}"                 # |
export DFL_REVCONTROL_GIT_BRANCH_AHEAD_COLOR="${reverse}${white}"   # →
export DFL_REVCONTROL_GIT_BRANCH_BEHIND_COLOR="${reverse}${white}"  # ←

# git
export DFL_REVCONTROL_GIT_SHOW_DIFF_SINCE_LAST_COMMIT=1                  # enables this feature
                                                                         # [development @ 52d0f236c27a ◆:1 | 1] (4 months ago)
export DFL_REVCONTROL_GIT_SHOW_DIFF_SINCE_LAST_COMMIT_COLOR="${yellow}"  # -----------------------------------------^^^

export DFL_REVCONTROL_GIT_SHOW_LATEST_TAG=1                              # enables this feature
                                                                         # [development @ d463874f9ea5 ◆:4 | 4] (79 minutes ago) [v1.3.0]
export DFL_REVCONTROL_GIT_SHOW_LATEST_TAG_COLOR="${green}"               # --------------------------------------------------------^^^

# battery
export DFL_BATTERY_PROMPT_ICON="ANY TEXT"                              # default: ⌧
export DFL_BATTERY_PROMPT_COLOR="${yellow}"                            # [⌧ 3:47]
export DFL_BATTERY_SHOW_PERCENT_REMAINING=1                            # [⌧ 7:48 100%]

# ip list
export DFL_IPLIST_PROMPT_IFACE_COLOR="${gray}${bold}"                  # [en0:192.168.2.205,vboxnet0:192.168.33.1]
export DFL_IPLIST_PROMPT_IPADDR_COLOR="${gray}"

# database status
export DFL_DB_MYSQL_PROMPT_ICON="ANY TEXT"                             # Default: MySQL
export DFL_DB_MYSQL_PROMPT_COLOR="${red}${blink}"                      # [MySQL]

export DFL_DB_POSTGRESQL_DOCKER_ICON="ANY TEXT"                        # default: 🚢
export DFL_DB_POSTGRESQL_PROMPT_ICON="ANY TEXT"                        # default: PG
export DFL_DB_POSTGRESQL_PROMPT_COLOR="${red}${blink}"                 # [PG]

export DFL_DB_REDIS_PROMPT_ICON="ANY TEXT"                             # default: REDIS
export DFL_DB_REDIS_PROMPT_COLOR="${red}${blink}"                      # [REDIS]

export DFL_DB_MONGODB_PROMPT_ICON="ANY TEXT"                           # default: MONGODB
export DFL_DB_MONGODB_PROMPT_COLOR="${red}${blink}"                    # [MONGODB]

# libs
export DFL_VIRTUALENV_PROMPT_ICON="ANY TEXT"                           # default: ⚑
export DFL_VIRTUALENV_PROMPT_COLOR="${red}${bold}"                     # [⚑ resume.bilgi.edu.tr]

export DFL_RBENV_PROMPT_ICON="ANY TEXT"                                # default: ◆
export DFL_RBENV_PROMPT_COLOR="${yellow}"                              # [◆ 2.3.3]

export DFL_PYTHON_PROMPT_ICON="ANY TEXT"                               # default: ¶
export DFL_PYTHON_PROMPT_COLOR="${blue}"                               # [¶ 2.7.12]

export DFL_PYTHON_DJANGO_PROMPT_ICON="ANY TEXT"                        # default: ❡
export DFL_DJANGO_PROMPT_COLOR="${cyan}${underline}"                   # [❡ 1.10.1]

export DFL_NODE_PROMPT_ICON="ANY TEXT"                                 # default: ⎆
export DFL_NODE_PROMPT_COLOR="${yellow}"                               # [⎆ v16.0.0]

export DFL_GO_PROMPT_ICON="ANY TEXT"                                   # default: ⍟
export DFL_GO_PROMPT_COLOR="${white}"                                  # [⍟ 1.16.3]

export DFL_MEMORY_PROMPT_ICON="ANY TEXT"                               # default: ◎
export DFL_MEMORY_PROMPT_COLOR="${gray}"                               # [◎ 4.38G]

export DFL_PGVM_PROMPT_ICON="ANY TEXT"                                 # default: ▥
export DFL_PGVM_PROMPT_COLOR="${magenta}"                              # [▥ 3.9.4]

export DFL_DOCKER_PROMPT_ICON="ANY TEXT"                               # default: Docker
export DFL_DOCKER_PROMPT_COLOR="${red}${blink}"                        # [Docker]
```

#### `${PROMPT_MEMORY}`

macOS only. Displays remaining free memory: `[2.90G]`. Color variable is
`DFL_MEMORY_PROMPT_COLOR`

#### `${PROMPT_BATTERY}`

macOS only. Displays remaining hour(s) on battery mode: `[⌧ 2:05]`. Color variable
is `DFL_BATTERY_PROMPT_COLOR`. You can set a custom icon via setting
`DFL_BATTERY_PROMPT_ICON` variable. Example:

    export DFL_BATTERY_PROMPT_ICON="🔋 " # emoji!

#### `${PROMPT_USER_AND_HOSTNAME}`

Outputs `USERNAME at HOSTNAME in CURRENT_WORKING_DIRECTORY`. Color variables
are:

* `DFL_USER_HOSTNAME_USER_PROMPT_COLOR`
* `DFL_USER_HOSTNAME_HOSTNAME_PROMPT_COLOR`
* `DFL_USER_HOSTNAME_CWD_PROMPT_COLOR`

You can change the variables. See details (**macOS/bsd**) via 
`man -P 'less -p ^PROMPTING' bash`

```bash
PROMPT_USER_AND_HOSTNAME="${DFL_USER_HOSTNAME_USER_PROMPT_COLOR}\u${COLOR_OFF} at ${DFL_USER_HOSTNAME_HOSTNAME_PROMPT_COLOR}\H${COLOR_OFF} in ${DFL_USER_HOSTNAME_CWD_PROMPT_COLOR}\w${COLOR_OFF}"

# vigo at noto.local in ~/Dotfiles
# \u at \H in \w
```


#### `${PROMPT_GIT}`

This works if you are under a **git repository**. Shows current status such
as; added, modified, deleted, renamed, type changed files amount. Example:

    [master @ 297c543ceac8 □:1 ◆:1 ◌:1 | 3] (7 minutes ago) [v1.3.0]
       |    | |            |   |   |     |        |            |
       |    | |            |   |   |     |        |            +---> enabled via DFL_REVCONTROL_GIT_SHOW_LATEST_TAG
       |    | |            |   |   |     |        |
       |    | |            |   |   |     |        +---> enabled via DFL_REVCONTROL_GIT_SHOW_DIFF_SINCE_LAST_COMMIT
       |    | |            |   |   |     |
       |    | |            |   |   |     +-> 3 files will be affected   
       |    | |            |   |   +-------> 1 file is deleted
       |    | |            |   +-----------> 1 file is modified
       |    | |            +---------------> 1 file is untracked
       |    | +----------------------------> commit id
       +----+------------------------------> current branch
            |
      DFL_PROMPT_GIT_AT_SIGN is set to " @ "
    
    [development @ b09ab92a87d5 □:1 | 1 →1] (7 minutes ago)
                                        |
                                        +--> this branch is ahead of 'origin/development'
                                             by 1 commit. you need to push it now! :)
    □ : untracked
    ■ : added
    ◆ : modified
    ◇ : renamed
    ◌ : deleted
    ❖ : type changed

git prompt also shows how many commit you are **ahead**/**behind** against your 
tracking remote. If you are in a **rebase**/**bare**/**conflict** mode, git prompt 
shows it to you :)

#### `${PROMPT_HG}`

Mercurial version of `${PROMPT_GIT}`. Example:

    [default @ b63bcee9d5ee+:1+ □:1 ■:2 ◌:2] (7 minutes ago)
        |      |             |  |   |   |
        |      |             |  |   |   +--> 1 file is removed/deleted
        |      |             |  |   +------> 1 file is added
        |      |             |  +----------> 1 file is untracked
        |      |             +-------------> local revision number
        |      +---------------------------> global revision id
        +----------------------------------> current branch
        
    □ : untracked
    ■ : added
    ◆ : modified
    ◌ : deleted        

Color variables for `${PROMPT_GIT}` and `${PROMPT_HG}` are same:

* `DFL_REVCONTROL_BRANCH_COLOR`
* `DFL_REVCONTROL_AT_SIGN_COLOR`
* `DFL_REVCONTROL_COMMIT_ID_COLOR`
* `DFL_REVCONTROL_UNTRACKED_COLOR`
* `DFL_REVCONTROL_ADDED_COLOR`
* `DFL_REVCONTROL_MODIFIED_COLOR`
* `DFL_REVCONTROL_RENAMED_COLOR`
* `DFL_REVCONTROL_DELETED_COLOR`
* `DFL_REVCONTROL_TYPECHANGED_COLOR`
* `DFL_REVCONTROL_OVERALL_COLOR`
* `DFL_REVCONTROL_VERTICAL_PIPE_COLOR`
* `DFL_REVCONTROL_GIT_BRANCH_AHEAD_COLOR`
* `DFL_REVCONTROL_GIT_BRANCH_BEHIND_COLOR`

`git` only variables:

* `DFL_REVCONTROL_GIT_SHOW_DIFF_SINCE_LAST_COMMIT` enables feature.
* `DFL_REVCONTROL_GIT_SHOW_DIFF_SINCE_LAST_COMMIT_COLOR` sets color.
* `DFL_REVCONTROL_GIT_SHOW_LATEST_TAG` enables feature.
* `DFL_REVCONTROL_GIT_SHOW_LATEST_TAG_COLOR` sets color.

#### `${PROMPT_RBENV}`

Shows current Ruby version if you are using [rbenv](https://github.com/rbenv/rbenv) or
any existing/installed ruby binary available. Color variable is `DFL_RBENV_PROMPT_COLOR`.

    [◆ 2.4.0] # Ruby version 2.3.3 is active!

#### `${PROMPT_PYENV}`

Shows current Python and [Django](https://www.djangoproject.com/) versions if 
you are using [pyenv](https://github.com/yyuu/pyenv) or any existing python
binary. Color variables are: `DFL_PYTHON_PROMPT_COLOR` and `DFL_DJANGO_PROMPT_COLOR`.

    [¶ 2.7.12][❡ 1.10.1] # Python 2.7.12 is active!
                         # Django 1.10.1 is active!

#### `${PROMPT_VIRTUALENV}`

Shows current virtualenv information if you are using virtualenv. This would be
kool if you set this: `export VIRTUAL_ENV_DISABLE_PROMPT=1` somewhere in your
`private/` area...Color variable is `DFL_VIRTUALENV_PROMPT_COLOR`.

    [⚑ my_awesome_env] # :)

#### `${PROMPT_BASH_VERSION_INFO}`

Shows current bash version. Color variable is `DFL_BASH_VERSION_INFO_PROMPT_COLOR`.

    [4.4.5(1)-release] # I need to see this sometimes!

#### `${PROMPT_NODE_VERSION}`

Shows current node version. Color variable is `DFL_NODE_PROMPT_COLOR`.

    [⎆ v16.0.0]    

#### `${PROMPT_GO_VERSION}`

Shows current go version. Color variable is `DFL_GO_PROMPT_COLOR`.

    [⍟ 1.16.3]

#### `${PROMPT_PGVM_VERSION}`

macOS only, shows current `pgvm` active version. Color variable is `DFL_PGVM_PROMPT_COLOR`.

#### `${PROMPT_IPS_LIST}`

Shows current available local ip list. Color variables are `DFL_IPLIST_PROMPT_IFACE_COLOR`
and `DFL_IPLIST_PROMPT_IPADDR_COLOR`. You can customize `:` and `,` via 
`DFL_PROMPT_IPS_LIST_SEPERATOR` and `DFL_PROMPT_IPS_LIST_COLON` variables

    [en0:192.168.2.205,vboxnet0:192.168.33.1]
    # name of interface: IP

This function sometimes takes more time. You can call it manually if you like to:

```bash
bash ~/Dotfiles/ps1/ip-list && echo
```

#### `${PROMPT_DATABASE_STATUS}`

macOS only, supported databases are:

- MySQL
- PostgreSQL
- Redis
- MongoDB

shows an indicator if any of them is/are running. Color variables are:

- `DFL_DB_MYSQL_PROMPT_COLOR`
- `DFL_DB_POSTGRESQL_PROMPT_COLOR`
- `DFL_DB_REDIS_PROMPT_COLOR`
- `DFL_DB_MONGODB_PROMPT_COLOR`

    [MySQL][PG][REDIS][MONGODB]  # Helps you to remember is server is on/off

#### `${PROMPT_HORIZONTAL_LINE}`

Draws dashed line along the terminal width. This separates commands. Color
variable is `DFL_HORIZONTAL_LINE_PROMPT_COLOR`. You can configure line char
via `DFL_PROMPT_HORIZONTAL_LINE` variable. Default is set to `-`

You can add date widgets to the left and the right of the line via
`DFL_HORIZONTAL_LINE_WIDGET_DATE_LEFT` and `DFL_HORIZONTAL_LINE_WIDGET_DATE_RIGHT`
environment variables:

```bash
# example
export DFL_HORIZONTAL_LINE_WIDGET_DATE_LEFT="+%A, %B %d"
export DFL_HORIZONTAL_LINE_WIDGET_DATE_RIGHT="+%H:%M:%S"
```

output will look like this:

    Monday, June 28 --------------------------------------------------------------- 08:15:27

for more date format params, check `man strftime`.

#### `${PROMPT_DOCKER_STATUS}`

macOS only, shows an indicator if docker is running. Color variable is
`DFL_DOCKER_PROMPT_COLOR`.

## Pre Defined PS1 Examples

### `PS1_OSX_BASIC` and `PS1_OSX_ADVANCED`

    PS1_OSX_BASIC="${PROMPT_MEMORY}${PROMPT_BATTERY}
    ${PROMPT_USER_AND_HOSTNAME}
    ${PROMPT_GIT}${PROMPT_HG}
    $ "
    
    PS1_OSX_ADVANCED="${PROMPT_HORIZONTAL_LINE}
    ${PROMPT_MEMORY}${PROMPT_BATTERY}
    ${PROMPT_USER_AND_HOSTNAME}
    ${PROMPT_DATABASE_STATUS}${PROMPT_DOCKER_STATUS}${PROMPT_VIRTUALENV}${PROMPT_RUBY_RBENV}${PROMPT_PYTHON_PYENV}${PROMPT_NODE_VERSION}${PROMPT_GO_VERSION}${PROMPT_PGVM_VERSION}${PROMPT_GIT}${PROMPT_HG}
    $ "

### `PS1_UBUNTU_BASIC` and `PS1_UBUNTU_ADVANCED`

    PS1_UBUNTU_BASIC="${PROMPT_USER_AND_HOSTNAME}
    ${PROMPT_GIT}${PROMPT_HG}
    > "
    
    PS1_UBUNTU_ADVANCED="${PROMPT_HORIZONTAL_LINE}
    ${PROMPT_USER_AND_HOSTNAME}
    ${PROMPT_VIRTUALENV}${PROMPT_RUBY_RBENV}${PROMPT_PYTHON_PYENV}${PROMPT_NODE_VERSION}${PROMPT_GO_VERSION}${PROMPT_GIT}${PROMPT_HG}
    > "

### `PS1_GENTOO_BASIC` and `PS1_GENTOO_ADVANCED`

    PS1_GENTOO_BASIC="${PROMPT_USER_AND_HOSTNAME}
    ${PROMPT_GIT}${PROMPT_HG}
    -> "
    
    PS1_GENTOO_ADVANCED="${PROMPT_HORIZONTAL_LINE}
    ${PROMPT_USER_AND_HOSTNAME}
    ${PROMPT_VIRTUALENV}${PROMPT_RUBY_RBENV}${PROMPT_PYTHON_PYENV}${PROMPT_NODE_VERSION}${PROMPT_GO_VERSION}${PROMPT_GIT}${PROMPT_HG}
    -> "

## Build your own!

Just drop a file under `~/Dotfiles/private/my-ps1` thats it! Your options:

    ${PROMPT_HORIZONTAL_LINE}
    ${PROMPT_BASH_VERSION_INFO}
    ${PROMPT_USER_AND_HOSTNAME}
    ${PROMPT_GIT}
    ${PROMPT_HG}
    ${PROMPT_MEMORY}                # macOS Only
    ${PROMPT_BATTERY}               # macOS Only
    ${PROMPT_IPS_LIST}
    ${PROMPT_DATABASE_STATUS}       # macOS Only
    ${PROMPT_VIRTUALENV}
    ${PROMPT_RUBY_RBENV}
    ${PROMPT_PYTHON_PYENV}
    ${PROMPT_NODE_VERSION}
    ${PROMPT_GO_VERSION}
    ${PROMPT_PGVM_VERSION}          # macOS Only
    ${PROMPT_DOCKER_STATUS}         # macOS Only

Make yours:

    # on ~/Dotfiles/private/my-ps1
    MY_CUSTOM_PS1="${PROMPT_USER_AND_HOSTNAME}
    ${PROMPT_GIT} $ "
    
    export PS1="${MY_CUSTOM_PS1}" # that’s it!

### `less` and `man` Colors

Check the file `~/Dotfiles/startup-sequence/less-colors`:

```bash
export LESS_TERMCAP_md="${yellow}${bold}"         # bold text
export LESS_TERMCAP_us="${green}${underline}"     # start underline
export LESS_TERMCAP_so="${white_on_blue}"         # start standout (reverse video)

export LESS_TERMCAP_me="${COLOR_OFF}"             # turn off bold, blink and underline
export LESS_TERMCAP_se="${COLOR_OFF}"             # stop standout
export LESS_TERMCAP_ue="${COLOR_OFF}"             # stop underline
```

Color values such as `${yellow}`, `${green}` they all are coming from `PS1` color
setup. You can customize it easily. All you need is to set `LESS_TERMCAP_XX`
variable. `XX` can be `md`, `us` etc... More details can be 
found [here](http://unix.stackexchange.com/questions/119/colors-in-man-pages)

Use defaults or add yours under `~/Dotfiles/private/my-less-colors`.

### `HISTTIMEFORMAT`

You can customize how your history will look :) Default is:

```bash
export HISTTIMEFORMAT="[${green}%A at ${white}${underline}%T${COLOR_OFF}]: "
# [Tuesday at 23:32:10]: cd Dotfiles/
#  |          |
#  +-> green  |
#             +-> white + underlined
```

History uses **strftime**, you can check options via `man 3 strftime`. Keep
this in mind, always use styling variables after color definition:

```bash
# example
${blue}${bold}
${green}${link}
```

This also applies **PS1 Coloring** too...

---

## Contributor(s)

* [Uğur "vigo" Özyılmazel](https://github.com/vigo) - Creator, maintainer
* [M. Fatih "mfk" Kılıç](https://github.com/mfk-smart) - Contributor
* [Tarık Kavaz](https://github.com/tarikkavaz) - Contributor


---

## Contribute

All PR’s are welcome!

1. `fork` (https://github.com/vigo/dotfiles-light/fork)
1. Create your `branch` (`git checkout -b my-features`)
1. `commit` yours (`git commit -am 'Add XXX feature'`)
1. `push` your `branch` (`git push origin my-features`)
1. Than create a new **Pull Request**!

***

## License

This project is licensed under MIT

---
