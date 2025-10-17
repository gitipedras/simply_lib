## Simply Library
`simply_lib`

A minetest mod required to run `simply_mods`

### Features:
**Configuration Features**
-Load and save configs for and simply mod (custom mods work but not supported)

Configs are stored in `<world loc>/simply_mods/<modname>.txt`
The configs are text files but have lua code in them, meaning you can pass booleans, strings, functions, tables and arrays to the configs. (Support for function will be removed in the future)

**Titles/Subtitles**
Show titles and subtitles to players.

`/title <player> <color> <time (seconds)> "<text>"`

**NOTE**: Put text between quotes
**NOTE**: Time in seconds
