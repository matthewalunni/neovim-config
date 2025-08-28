# 💤 LazyVim Cheatsheet

A quick reference for working efficiently in LazyVim.  
This covers common actions including **files, buffers, git, search, commands, terminal, and more**.  
(Default `<leader>` is `space` unless you’ve changed it.)

---

---

## 📝 Vim Modes

Vim (and LazyVim) works by switching between modes. Each mode changes what your keys do.

| Mode                 | How to Enter                                                                                    | How to Exit / Switch                                        | Purpose                                                    |
| -------------------- | ----------------------------------------------------------------------------------------------- | ----------------------------------------------------------- | ---------------------------------------------------------- |
| **Normal** (default) | Press `<esc>` or start Vim                                                                      | Always return here with `<esc>`                             | Navigation, editing commands, motions                      |
| **Insert**           | `i` (insert before cursor) <br> `a` (after) <br> `o` (new line below) <br> `O` (new line above) | `<esc>` → back to Normal <br> `<C-c>` also works            | Typing and inserting text                                  |
| **Visual**           | `v` (characterwise) <br> `V` (linewise) <br> `<C-v>` (blockwise)                                | `<esc>` → back to Normal                                    | Selecting text for copying, deleting, formatting           |
| **Select**           | `gh`                                                                                            | Typing replaces the selection                               | Similar to Visual but acts like a GUI editor               |
| **Replace**          | `R`                                                                                             | `<esc>`                                                     | Overwrites text instead of inserting                       |
| **Command-line**     | `:` (Ex commands) <br> `/` (search forward) <br> `?` (search backward)                          | `<esc>`                                                     | Run commands, search, substitute                           |
| **Terminal**         | `:terminal` or `<leader>tt` (Snacks terminal)                                                   | `<C-\><C-n>` → Normal mode <br> `i` → back to Terminal mode | Interact with a shell inside Neovim                        |
| **Operator-pending** | Triggered by operators like `d`, `y`, `c`                                                       | Complete with a motion (e.g. `w`, `ap`)                     | Awaiting a motion to act on text (e.g. `dw` = delete word) |

---

### 🔑 Quick Notes

- **Normal mode** is your home base. Think _"verbs"_ (delete, yank, change) combined with _"objects"_ (word, paragraph, block).
- **Visual mode** is for selecting before acting, while **Operator-pending** lets you act then choose a motion.
- **Terminal mode** behaves like insert mode but is bound to a shell. Exit with `<C-\><C-n>`.
- **Command-line mode** gives you `:` commands and `/` searches.

---

## 🏃 Motions & Text Objects

In **Normal**, **Visual**, or **Operator-pending** mode, motions and text objects define _what_ your command acts on.  
For example:

- `dw` = delete (`d`) + motion (`w` → word)
- `yap` = yank (`y`) + text object (`ap` → a paragraph)

---

### 🔹 Common Motions

| Motion | Meaning                          | Example                                       |
| ------ | -------------------------------- | --------------------------------------------- |
| `h`    | Left (char)                      | `3h` = move left 3 chars                      |
| `l`    | Right (char)                     | `5l` = move right 5 chars                     |
| `w`    | Forward to start of next word    | `dw` = delete word                            |
| `e`    | Forward to end of word           | `de` = delete to end of word                  |
| `ge`   | Backward to end of previous word | `dge` = delete back to previous word end      |
| `b`    | Backward to beginning of word    | `db` = delete to word start                   |
| `0`    | Start of line                    | `d0` = delete to start of line                |
| `^`    | First non-whitespace on line     | `d^` = delete to line start (ignoring spaces) |
| `$`    | End of line                      | `d$` = delete to line end                     |
| `f{x}` | Find character forward           | `df,` = delete up to `,`                      |
| `t{x}` | “Till” before character forward  | `dt)` = delete until before `)`               |
| `F{x}` | Find character backward          | `dF{` = delete back to `{`                    |
| `T{x}` | “Till” before character backward | `dT:` = delete until before `:`               |
| `}`    | Next paragraph                   | `d}` = delete to next paragraph               |
| `{`    | Previous paragraph               | `d{` = delete to previous paragraph           |
| `)`    | Next sentence                    | `d)` = delete sentence forward                |
| `(`    | Previous sentence                | `d(` = delete sentence backward               |
| `G`    | End of file                      | `dG` = delete to EOF                          |
| `gg`   | Start of file                    | `dgg` = delete to BOF                         |
| `%`    | Match paired bracket/brace       | `d%` = delete inside bracket pair             |

---

### 🔹 Text Objects

Text objects always begin with `a` (around) or `i` (inside).

| Object      | Meaning                           | Examples                                                    |
| ----------- | --------------------------------- | ----------------------------------------------------------- |
| `aw`        | A word (includes space)           | `daw` = delete word + trailing space                        |
| `iw`        | Inner word (no space)             | `diw` = delete just the word                                |
| `ap`        | A paragraph                       | `yap` = yank paragraph incl. blank line                     |
| `ip`        | Inner paragraph                   | `dip` = yank paragraph content only                         |
| `a"`        | A quoted string (includes quotes) | `da"` = delete `"hello"` including quotes                   |
| `i"`        | Inner quoted string               | `di"` = delete inside `"hello"` → hello gone, quotes remain |
| `a'`        | A single-quoted string            | `da'` = delete `'abc'` incl. quotes                         |
| `i'`        | Inner single-quoted string        | `di'` = delete `abc` inside quotes                          |
| `a)` / `ab` | Around parentheses/brackets       | `dab` = delete `(content)` incl. parens                     |
| `i)` / `ib` | Inside parentheses/brackets       | `dib` = delete `content` only                               |
| `a}` / `aB` | Around braces                     | `daB` = delete `{content}` incl. braces                     |
| `i}` / `iB` | Inside braces                     | `diB` = delete `content`                                    |
| `at`        | A tag block (HTML/XML)            | `dat` = delete `<div>...</div>` incl. tags                  |
| `it`        | Inside tag block                  | `dit` = delete contents of `<div>...</div>` only            |

---

### 🧠 Pro Tips

- Think **verb + object**: `d` = delete, `y` = yank, `c` = change.
- Combine with counts: `3dw` deletes 3 words.
- Use **text objects** for structured editing (quotes, brackets, functions).
- Motions work in **Normal**, **Visual**, and **Operator-pending** modes.

## 🚀 General

| Keybinding  | Action                                 |
| ----------- | -------------------------------------- |
| `<leader>n` | Toggle **File Explorer** (Neo-tree)    |
| `<leader>q` | Close current buffer                   |
| `<leader>Q` | Quit Neovim                            |
| `<leader>w` | Save buffer                            |
| `<leader>W` | Save all buffers                       |
| `<C-s>`     | Save file                              |
| `<C-q>`     | Quit Neovim                            |
| `<esc>`     | Escape insert/visual, clear highlights |

---

## 📂 Files & Buffers

| Keybinding      | Action                    |
| --------------- | ------------------------- |
| `<leader>ff`    | Find files (Telescope)    |
| `<leader>fr`    | Recent files              |
| `<leader>fs`    | Search in current buffer  |
| `<leader>fb`    | Find buffers              |
| `<leader><tab>` | Switch to previous buffer |
| `]b` / `[b`     | Next / Previous buffer    |
| `<leader>bd`    | Delete buffer             |
| `<leader>bo`    | Close all but current     |

---

## 🔍 Search & Navigation

| Keybinding   | Action                           |
| ------------ | -------------------------------- |
| `/`          | Search within buffer             |
| `n` / `N`    | Next / Previous search match     |
| `<leader>/`  | Live grep in project (Telescope) |
| `<leader>sg` | Grep for string in workspace     |
| `<leader>sh` | Search help tags                 |
| `<leader>sk` | Search keymaps                   |
| `<leader>sr` | Resume last Telescope search     |
| `<leader>ss` | Search current word              |

---

## 🌿 Git

| Keybinding   | Action                           |
| ------------ | -------------------------------- |
| `<leader>gg` | Lazygit (inside Neovim terminal) |
| `<leader>gb` | Git blame line                   |
| `<leader>gd` | Diff against index               |
| `<leader>gs` | Git status                       |
| `<leader>gc` | Checkout branch (Telescope)      |
| `<leader>gC` | Checkout commit (Telescope)      |
| `<leader>gl` | Show git log                     |
| `<leader>gp` | Preview hunk                     |
| `<leader>gr` | Reset hunk                       |
| `<leader>gR` | Reset buffer                     |
| `<leader>gu` | Undo stage hunk                  |
| `<leader>gh` | Stage hunk                       |
| `<leader>gS` | Stage buffer                     |

---

## 🛠️ Code & LSP

| Keybinding   | Action                  |
| ------------ | ----------------------- |
| `gd`         | Go to definition        |
| `gD`         | Go to declaration       |
| `gi`         | Go to implementation    |
| `gr`         | References (Telescope)  |
| `<leader>ca` | Code actions            |
| `<leader>cr` | Rename symbol           |
| `<leader>cf` | Format file             |
| `<leader>cd` | Show diagnostics (line) |
| `<leader>cl` | LSP info                |
| `[d` / `]d`  | Prev / Next diagnostic  |

---

## ⌨️ Window Management

| Keybinding   | Action                    |
| ------------ | ------------------------- |
| `<C-h>`      | Move to left split        |
| `<C-l>`      | Move to right split       |
| `<C-j>`      | Move down split           |
| `<C-k>`      | Move up split             |
| `<leader>sv` | Split window vertically   |
| `<leader>sh` | Split window horizontally |
| `<leader>se` | Equalize splits           |
| `<leader>sx` | Close current split       |

---

## 🖥️ Snacks Terminal (LazyVim)

| Keybinding        | Action                                       |
| ----------------- | -------------------------------------------- |
| `<leader>tt`      | Toggle terminal (opens in a floating window) |
| `<leader>tT`      | Open new terminal instance                   |
| `<leader>th`      | Toggle horizontal split terminal             |
| `<leader>tv`      | Toggle vertical split terminal               |
| `<leader>tn`      | Cycle to next terminal                       |
| `<leader>tp`      | Cycle to previous terminal                   |
| `<leader>tx`      | Close current terminal                       |
| `<esc>` (in term) | Exit terminal insert mode                    |
| `i` (in term)     | Re-enter insert mode inside terminal         |

---

## 🎨 Misc & Utilities

| Keybinding   | Action                      |
| ------------ | --------------------------- |
| `<leader>th` | Toggle Git signs            |
| `<leader>tc` | Toggle color column         |
| `<leader>ts` | Toggle spell check          |
| `<leader>tw` | Toggle wrap                 |
| `<leader>u`  | Undo tree                   |
| `<leader>y`  | Yank to system clipboard    |
| `<leader>p`  | Paste from system clipboard |

---

## ⚡ Snacks (LazyVim Extras)

| Keybinding   | Action                      |
| ------------ | --------------------------- |
| `<leader>tn` | Toggle notification history |
| `<leader>tm` | Toggle markdown preview     |
| `<leader>tz` | Toggle zen mode             |

---

## 🤖 GitHub Copilot & Copilot Chat

| Keybinding   | Action                                    |
| ------------ | ----------------------------------------- |
| `<leader>cc` | Open Copilot Chat                         |
| <leader>ca   | Accept Copilot suggestion                 |
| <leader>cr   | Reject Copilot suggestion                 |
| <leader>cn   | Next Copilot suggestion                   |
| <leader>cp   | Previous Copilot suggestion               |
| <leader>ct   | Toggle Copilot suggestions                |
| <leader>ci   | Open Copilot settings                     |
| <leader>cv   | Open Copilot Chat history                 |
| `<C-e>`      | Trigger Copilot inline suggestion         |
| `<C-space>`  | Manually request Copilot suggestion       |
| `<leader>cc` | Open Copilot Chat in a sidebar            |
| `<leader>cC` | Open Copilot Chat in a new tab            |
| `<leader>cq` | Quick chat (floating window)              |
| `<leader>ce` | Explain selected code via Copilot Chat    |
| `<leader>cf` | Fix diagnostics in current file           |
| `<leader>ct` | Generate tests for current file/selection |
| `<leader>cd` | Generate docstrings for function/class    |

**Tips**:

- Copilot Chat works best with visual selections (`v`) then prompt.
- Use `:CopilotChat` command for custom prompts.
- Copilot can be toggled with `:Copilot enable/disable`.

---

## 🖥️ Terminal Windows

| Keybinding        | Action                                     |
| ----------------- | ------------------------------------------ |
| `<leader>tt`      | Toggle floating terminal (Snacks terminal) |
| `<leader>tT`      | Open new floating terminal instance        |
| `<leader>th`      | Open horizontal terminal split             |
| `<leader>tv`      | Open vertical terminal split               |
| `<leader>tn`      | Cycle to next terminal                     |
| `<leader>tp`      | Cycle to previous terminal                 |
| `<leader>tx`      | Close current terminal                     |
| `<esc>` (in term) | Exit terminal insert mode to normal mode   |
| `i` (in term)     | Re-enter insert mode inside terminal       |
| `<C-\><C-n>`      | Force normal mode inside terminal buffer   |

**Tips**:

- Each terminal buffer is persistent—you can switch back with buffer commands.
- Use multiple terminals for running servers, git, and build tools simultaneously.
- Floating terminals are great for quick commands (like `lazygit` or `npm run dev`).

# Tips

- `<leader>` = `space` (by default).
- Use `:Lazy` to open LazyVim plugin manager.
- Use `:checkhealth` to troubleshoot issues.
- Press `K` on a symbol for hover docs.
