# Change Log

## 2021

**April 24, 2021, Corona Days**

- Add `DFL_BASH_VERSION_INFO_PROMPT_COLOR`
- Add `DFL_MEMORY_PROMPT_ICON`
- Rename `DFL_BATTERY_ICON` to `DFL_BATTERY_PROMPT_ICON`
- Remove space char from the right side of the icon (*requested by*
  [Tarık](https://github.com/tarikkavaz)). Now you can manage spacing by your
  selves :)
- Add `PROMPT_PGVM_VERSION`, `DFL_PGVM_PROMPT_COLOR`, `DFL_PGVM_PROMPT_ICON` via [PR#8](https://github.com/vigo/dotfiles-light/pull/8)

**April 23, 2021, Corona Days**

- Add `node` version indicator
- Add `go` version indicator
- Add `DFL_REVCONTROL_GIT_SHOW_LATEST_TAG` and `DFL_REVCONTROL_GIT_SHOW_LATEST_TAG_COLOR`
- Update missing information (README)
- Add custom icon indicators for PS1 elements!

**April 12, 2021, Corona Days**

- Add `mkdir_now`
- Add `mkdir_now_cd`

**April 10, 2021 Corona Days**

I was watching one of the old peepcode screencasts. **Play by play** with Gary
Bernhardt. He was using `zsh` and his git-prompt was displaying relative
date diff between the last commit and now. It was `prompt_wunjo_setup` file
but I couldn’t find it. Well, here it is!

- Add `DFL_SHOW_DIFF_SINCE_LAST_COMMIT` variable check to display relative date diff between now and last commit for git prompt.
- Add `DFL_SHOW_DIFF_SINCE_LAST_COMMIT_COLOR` for color setup variable for display relative date diff between now and last commit feature.

---

## 2020

**November 28, 2020 Corona Days**

- `DFL_BATTERY_SHOW_PERCENT_REMAINING` show remaning battery percent
- `shellcheck -x path/to/file` validated through shellcheck, improved bash scripts
- DROP **app_lightmode**... Doesn’t work on Catalina + Big Sur...

**April 27, 2020 Corona Days**

Try `cp` files with `mcp`

```bash
$ mcp /path/to/file # hit enter end give a new name!
```


**April 22, 2020 Corona Days**

Just grabbed and fixed the little function from;

- https://gist.github.com/premek/6e70446cfc913d3c929d7cdbfe896fef
- [@premek](https://github.com/premek)

Try to `mv` files with `mmv`:

```bash
$ mmv /source/file # hit enter end give a new name!
```

Also, `app_lightmode` doesn’t work as expected on freshly installed macOS
Catalina. Some applications are compatible but some are not...

**January 9, 2020**

`git` prompt now checks number of changed files. If the number of files are
more than **100**, nothing will be calculated. You can change this value
via setting `DFL_MAX_FILECHANGES` environment variable.

---

## 2019

**December 1, 2019**

PostgreSQL database indicator now shows current database name if
`$DATABASE_URL` is set!

**October 16, 2019**

PostgreSQL database indicator now supports Docker based PostgreSQL usage. Name
of the container is stored under `DFL_DOCKER_PG_CONTAINER_NAME` environment
variable. Default container name is set to: `docker-pg`
(`startup-sequence/env`) Example docker setup:

```bash
$ docker pull postgres:latest
$ docker run --rm --name $DFL_DOCKER_PG_CONTAINER_NAME -e POSTGRES_PASSWORD=docker -d -p 5432:5432 -v /path/to/volumes/postgres:/var/lib/postgresql/data postgres
$ PGPASSWORD=docker psql -h localhost -U postgres -d postgres # connect
$ docker stop ${DFL_DOCKER_PG_CONTAINER_NAME} # stop
```

---

## 2018

**November 13, 2018**

`HISTFILESIZE` and `HISTSIZE` are unset for unlimited history storage. You can
override this via your `private/env` and re-assign desired values. Defaults
were:

```bash
export HISTFILESIZE=1000000
export HISTSIZE=1000000
```

---