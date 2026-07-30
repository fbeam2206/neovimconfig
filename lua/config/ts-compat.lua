-- Compatibility shim: restore the `all = false` contract for treesitter query
-- predicates/directives.
--
-- Neovim <=0.11 let a caller register a handler with `all = false`, meaning
-- `match[capture_id]` was handed over as a single TSNode. Neovim 0.12 removed
-- the option, so handlers now always receive a *list* of nodes. Callers still
-- passing `all = false` (nvim-treesitter's master branch does, for `nth?`,
-- `is?`, `kind-eq?`, `set-lang-from-mimetype!` and `set-lang-from-info-string!`)
-- then treat that list as a node and blow up on the first method call:
--
--   vim/treesitter.lua: attempt to call method 'range' (a nil value)
--
-- which surfaces as a decoration-provider error whenever html injects css/js.
--
-- We wrap the handler instead of patching the plugin, so this survives plugin
-- updates. It is a strict no-op unless the caller explicitly asks for
-- `all = false`, so correctly written 0.12 handlers are untouched.

local query = require("vim.treesitter.query")

---Collapse `capture_id -> TSNode[]` down to `capture_id -> TSNode`, picking the
---last node exactly as the old `all = false` behaviour did.
local function unwrap(match)
  local single = {}
  for id, nodes in pairs(match) do
    if type(nodes) == "table" then
      single[id] = nodes[#nodes]
    else
      single[id] = nodes
    end
  end
  return single
end

local function patch(name)
  local original = query[name]
  query[name] = function(pred_name, handler, opts)
    if type(opts) == "table" and opts.all == false then
      opts = vim.tbl_extend("force", {}, opts)
      opts.all = nil
      local inner = handler
      handler = function(match, ...)
        return inner(unwrap(match), ...)
      end
    end
    return original(pred_name, handler, opts)
  end
end

patch("add_predicate")
patch("add_directive")
