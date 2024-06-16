---@class cmp.LazySourceConfig: cmp.SourceConfig
---@field public [1] string?
---@field public name string?

---@alias cmp.LazySourceConfigs
---| (cmp.LazySourceConfig | string)[]

---@class neo-tree.GitStatusAsyncOptions
---@field batch_size number?
---@field batch_delay number?
---@field max_lines number?

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

---@class neo-tree.SourceSelector
---@field winbar boolean?
---@field statusline boolean?
---@field show_scrolled_off_parent_node boolean
---@field sources { source: string }[]?

---@class NeotreeConfig
---@field sources string[]?
---@field add_blank_line_at_top boolean?
---@field auto_clean_after_session_restore boolean?
---@field close_if_last_window boolean?
---@field default_source string|"last"?
---@field enable_diagnostics boolean?
---@field enable_git_status boolean?
---@field enable_modified_markers boolean?
---@field enable_opened_markers boolean?
---@field enable_refresh_on_write boolean?
---@field enable_cursor_hijack boolean?
---@field git_status_async boolean?
---@field git_status_async_options neo-tree.GitStatusAsyncOptions|nil
---@field hide_root_node boolean?
---@field retain_hidden_root_indent boolean?
---@field open_files_in_last_window boolean?
---@field open_files_do_not_replace_types string[]?
---@field log_to_file boolean|string?
---@field log_level LogLevel?
---@field popup_border_style BorderStyle|string?
---@field resize_timer_interval number?
---@field sort_case_insensitive boolean?
---@field sort_function function?
---@field use_popups_for_input boolean?
---@field use_default_mappings boolean?
---@field source_selector neo-tree.SourceSelector|nil
---@field
---@field
---@field
---@field
