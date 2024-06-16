---@class cmp.LazySourceConfig: cmp.SourceConfig
---@field public [1] string?
---@field public name string?

---@alias cmp.LazySourceConfigs
---| (cmp.LazySourceConfig | string)[]

---@alias LogLevel
---| "trace"
---| "debug"
---| "info"
---| "warn"
---| "error"
---| "fatal"

---@alias BorderStyle
---| "none"
---| "rounded"
---| "solid"
---| "double"
---| "shadow"
---| "single"

_ = {
  { event = "before_render", handler = function(state) end },
  { event = "file_opened", handler = function(file_path) end },
  { event = "file_opened", handler = function(file_path) end },
  { event = "file_renamed", handler = function(args) end },
  { event = "file_moved", handler = function(args) end },
  { event = "neo_tree_buffer_enter", handler = function() end },
  { event = "neo_tree_buffer_leave", handler = function() end },
  { event = "neo_tree_window_before_open", handler = function(args) end },
  { event = "neo_tree_window_after_open", handler = function(args) end },
  { event = "neo_tree_window_before_close", handler = function(args) end },
  { event = "neo_tree_window_after_close", handler = function(args) end },
}

---@alias neo-tree.EventHandler
---| { event: "before_render", handler: function | fun(state: any): nil }
---| { event: "file_opened" }
---| { event: "file_renamed" }
---| { event: "file_moved" }
---| { event: "neo_tree_buffer_enter" }
---| event: "neo_tree_buffer_leave"
---| event: "neo_tree_window_before_open"
---| event: "neo_tree_window_after_open"
---| event: "neo_tree_window_before_close"
---| event: "neo_tree_window_after_close"

-- Anything before this will be used. The last items to be processed are the untracked files.
---@class neo-tree.GitStatusAsyncOptions
-- how many lines of git status results to process at a time
---@field batch_size number?
-- delay in ms between batches. Spreads out the workload to let other processes run.
---@field batch_delay number?
-- How many lines of git status results to process. Anything after this will be dropped.
---@field max_lines number?

---@class neo-tree.SourceSelector.separator
---@field left string?
---@field right string?
---@field override "right" | "left" | "active"?

---@class neo-tree.SourceSelector
-- toggle to show selector on winbar
---@field winbar boolean?
-- toggle to show selector on statusline
---@field statusline boolean?
-- this will replace the tabs with the parent path
-- of the top visible node when scrolled down.
---@field show_scrolled_off_parent_node boolean?
---@field sources { source: string }[]?
-- only with `tabs_layout` = "equal", "focus"
-- start  : |/ 󰓩 bufname     \/...
-- end    : |/     󰓩 bufname \/...
-- center : |/   󰓩 bufname   \/...
---@field content_layout "start" | "center" | "end"?
-- start  : |/  a  \/  b  \/  c  \            |
-- end    : |            /  a  \/  b  \/  c  \|
-- center : |      /  a  \/  b  \/  c  \      |
-- equal  : |/    a    \/    b    \/    c    \|
-- active : |/  focused tab    \/  b  \/  c  \|
---@field tabs_layout "start" | "center" | "end" | "equal" | "active"?
-- character to use when truncating the tab label
---@field truncation_character string?
-- nil | int: if int padding is added based on `content_layout`
---@field tabs_min_width number?
-- this will truncate text even if `text_trunc_to_fit = false`
---@field tabs_max_width ( number | false )?
---@field padding number | { left: number?, right: number? }?
-- separator = { left = "/", right = "\\", override = nil },     -- |/  a  \/  b  \/  c  \...
-- separator = { left = "/", right = "\\", override = "right" }, -- |/  a  \  b  \  c  \...
-- separator = { left = "/", right = "\\", override = "left" },  -- |/  a  /  b  /  c  /...
-- separator = { left = "/", right = "\\", override = "active" },-- |/  a  / b:active \  c  \...
-- separator = "|",                                              -- ||  a  |  b  |  c  |...
---@field separator ( neo-tree.SourceSelector.separator | string )?
-- set separators around the active tab. nil falls back to `source_selector.separator`
---@field separator_active ( neo-tree.SourceSelector.separator | string)?
-- true  : |/    a    \/    b    \/    c    \|
-- false : |     a    \/    b    \/    c     |
---@field show_separator_on_edge boolean?
---@field highlight_tab string?
---@field highlight_tab_active string?
---@field highlight_background string?
---@field highlight_separator string?
---@field highlight_separator_active string?

---@class NeotreeConfig
-- If a user has a sources list it will replace this one.
-- Only sources listed here will be loaded.
-- You can also add an external source by adding it's name to this list.
-- The name used here must be the same name you would use in a require() call.
--
-- ## Exemple
--
-- ```lua
-- local config = {
--   sources = {
--     "filesystem",
--     "buffers",
--     "git_status",
--     "document_symbols",
--   },
-- }
-- ```
---@field sources string[]?
-- Add a blank line at the top of the tree.
---@field add_blank_line_at_top boolean?
-- Automatically clean up broken neo-tree buffers saved in sessions
---@field auto_clean_after_session_restore boolean?
-- Close Neo-tree if it is the last window left in the tab
---@field close_if_last_window boolean?
-- you can choose a specific source `last` here which indicates the last used source
---@field default_source string | "last"?
---@field enable_diagnostics boolean?
---@field enable_git_status boolean?
-- Show markers for files with unsaved changes.
---@field enable_modified_markers boolean?
-- Enable tracking of opened files. Required for `components.name.highlight_opened_files`
---@field enable_opened_markers boolean?
-- Refresh the tree when a file is written. Only used if `use_libuv_file_watcher` is false.
---@field enable_refresh_on_write boolean?
---@field enable_cursor_hijack boolean?
-- These options are for people with VERY large git repos
---@field git_status_async boolean?
---@field git_status_async_options ( neo-tree.GitStatusAsyncOptions )?
-- Hide the root node.
---@field hide_root_node boolean?
-- IF the root node is hidden, keep the indentation anyhow.
-- This is needed if you use expanders because they render in the indent.
---@field retain_hidden_root_indent boolean?
---@field log_level LogLevel?
-- true, false, "/path/to/file.log", use :NeoTreeLogs to show the file
---@field log_to_file boolean | string?
-- false = open files in top left window
---@field open_files_in_last_window boolean?
-- when opening files, do not use windows containing these filetypes or buftypes
---@field open_files_do_not_replace_types string[]?
-- popup_border_style is for input and confirmation dialogs.
-- Configurtaion of floating window is done in the individual source sections.
-- "NC" is a special style that works well with NormalNC set
---@field popup_border_style BorderStyle | string?
-- in ms, needed for containers to redraw right aligned and faded content
-- set to -1 to disable the resize timer entirely
-- NOTE: this will speed up to 50 ms for 1 second following a resize.
--
---@field resize_timer_interval number?
-- used when sorting files and directories in the tree
---@field sort_case_insensitive boolean?
-- uses a custom function for sorting files and directories in the tree
---@field sort_function function?
-- If false, inputs will use vim.ui.input() instead of custom floats.
---@field use_popups_for_input boolean?
---@field use_default_mappings boolean?
-- source_selector provides clickable tabs to switch between sources.
---@field source_selector ( neo-tree.SourceSelector )?
---@field event_handlers { event: string | , handler: function }[]?
---@field
---@field
---@field
