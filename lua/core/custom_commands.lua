local function get_git_branch()
  local branch = vim.fn.systemlist("git rev-parse --abbrev-ref HEAD")[1]
  if branch == "HEAD" then
    branch = vim.fn.systemlist("git rev-parse HEAD")[1]
  end
  return branch
end

local function get_user_and_repo()
  local github_url = vim.fn.systemlist("git config --get remote.origin.url")[1]

  if github_url == "" then
    -- Project is not hosted on github.
    return nil
  end

  -- TODO: Add support for other git hosting services.
  local gh_user, gh_repo = string.match(github_url, "github.com[:/](.+)/(.+).git")
  return gh_user, gh_repo
end

local function get_highlighted_link(file_path, ln_start, ln_end)
  local user, repo = get_user_and_repo()
  local branch = get_git_branch()
  local rel_path = vim.fn.systemlist("git ls-files --full-name -- " .. file_path)[1]

  local url = string.format("https://github.com/%s/%s/blob/%s/%s#L%d",
                            user, repo, branch, rel_path, ln_start)

  if ln_end ~= nil then
    url = url .. "-L" .. ln_end
  end

  return url
end


local function selected_link()
    local bufnr = vim.api.nvim_get_current_buf()
    local file_path = vim.fn.expand("%:p")
    local ln_start = vim.api.nvim_buf_get_mark(bufnr, "<")[1]
    local ln_end = vim.api.nvim_buf_get_mark(bufnr, ">")[1]
    local url = get_highlighted_link(file_path, ln_start, ln_end)
    vim.fn.setreg("+", url)
end

vim.keymap.set("x", "<leader>gl", selected_link, { noremap = false, silent = false })
