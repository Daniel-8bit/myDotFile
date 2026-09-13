# Neovim 配置说明

这是一个基于 Lua 和 [lazy.nvim](https://github.com/folke/lazy.nvim) 的 Neovim 配置。

## 快速开始

### 必需工具

- Neovim 0.11 或更高版本（配置使用 `vim.lsp.config` 和 `vim.lsp.enable`）
- Git（安装 lazy.nvim 和插件）
- C 编译环境（`gcc`、`make`，用于构建 `telescope-fzf-native.nvim`）

### 按功能使用的工具

- `clangd`：C/C++ LSP 服务器，由 Mason 自动安装
- `rg`：Telescope 的实时文本搜索命令，使用 `<leader>fg`
- `fd`：可选，用于提升 Telescope 文件搜索速度
- `wl-copy` 和 `wl-paste`：WSL 环境下提供系统剪贴板支持

首次启动时，lazy.nvim 会自动安装插件；Mason 会根据配置安装 `clangd`。

## 插件列表

### 插件管理与基础界面

| 插件 | 功能 | 依赖或外部工具 |
| --- | --- | --- |
| [folke/lazy.nvim](https://github.com/folke/lazy.nvim) | 插件管理、按需加载和插件更新 | Git |
| [nvim-tree/nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) | 文件树浏览和文件操作 | `nvim-tree/nvim-web-devicons` |
| [akinsho/bufferline.nvim](https://github.com/akinsho/bufferline.nvim) | 顶部 Buffer 标签栏 | `nvim-tree/nvim-web-devicons` |
| [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | 状态栏，显示模式、分支、诊断和文件信息 | `nvim-tree/nvim-web-devicons` |
| [folke/tokyonight.nvim](https://github.com/folke/tokyonight.nvim) | TokyoNight 配色方案 | 无 |
| [Mr-LLLLL/interestingwords.nvim](https://github.com/Mr-LLLLL/interestingwords.nvim) | 高亮和取消高亮相同文本 | 无 |

### 搜索、编辑与终端

| 插件 | 功能 | 依赖或外部工具 |
| --- | --- | --- |
| [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | 文件、文本、Buffer 和帮助文档搜索 | `nvim-lua/plenary.nvim`、`telescope-fzf-native.nvim`、C 编译器；实时搜索需要 `rg` |
| [nvim-telescope/telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim) | 为 Telescope 提供原生 FZF 排序 | `make`、C 编译器 |
| [akinsho/toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) | 浮动终端和编译运行命令 | `gcc`；使用系统 Shell |
| [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs) | 自动补全括号 | 无 |
| [kylechui/nvim-surround](https://github.com/kylechui/nvim-surround) | 快速添加、修改和删除包围符号 | 无 |
| [lukas-reineke/indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) | 显示缩进参考线和当前作用域 | 无 |

### 语法高亮与 Markdown

| 插件 | 功能 | 依赖或外部工具 |
| --- | --- | --- |
| [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Tree-sitter 语法高亮和缩进 | 各语言解析器；配置中启用 C、Lua、Vim、Python、Rust、Bash、CMake、YAML、JSON、Markdown 等 |
| [HiPhish/rainbow-delimiters.nvim](https://github.com/HiPhish/rainbow-delimiters.nvim) | 为括号和嵌套结构显示彩色层级 | nvim-treesitter |
| [tadmccorkle/markdown.nvim](https://github.com/tadmccorkle/markdown.nvim) | Markdown 列表和任务列表操作 | 无 |
| [MeanderingProgrammer/render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim) | 在编辑器中渲染 Markdown 标题、代码块、列表和表格 | 无 |

### LSP 与补全

| 插件 | 功能 | 依赖或外部工具 |
| --- | --- | --- |
| [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim) | 安装和管理 LSP、格式化器等工具 | Git；具体工具由 Mason 下载 |
| [williamboman/mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) | 将 Mason 与 lspconfig 连接，自动安装 `clangd` | Mason、nvim-lspconfig |
| [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | 配置并启用 `clangd` LSP | `clangd` |
| [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | 插入模式代码补全框架 | cmp-nvim-lsp、cmp-buffer、cmp-path、LuaSnip |
| [hrsh7th/cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp) | 将 LSP 补全能力接入 nvim-cmp | nvim-cmp、LSP 服务器 |
| [hrsh7th/cmp-buffer](https://github.com/hrsh7th/cmp-buffer) | 从当前 Buffer 内容提供补全 | nvim-cmp |
| [hrsh7th/cmp-path](https://github.com/hrsh7th/cmp-path) | 提供文件路径补全 | nvim-cmp |
| [L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip) | 代码片段引擎 | nvim-cmp |
| [saadparwaiz1/cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip) | 将 LuaSnip 接入 nvim-cmp | LuaSnip、nvim-cmp |
| [nvim-tree/nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) | 为文件类型和界面提供图标 | Nerd Font 字体可获得完整图标显示 |
| [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim) | Telescope 使用的 Lua 工具库 | 无 |

## 自定义快捷键

`<leader>` 设置为空格，`<M-...>` 表示 Alt/Meta 键。

### 通用操作

| 快捷键 | 模式 | 功能 |
| --- | --- | --- |
| `<leader>nh` | 普通 | 清除搜索高亮 |
| `<leader>tn` | 普通 | 新建标签页 |
| `<leader>tc` | 普通 | 关闭当前标签页 |
| `<leader>to` | 普通 | 仅保留当前标签页 |
| `<leader>t]` | 普通 | 下一个标签页 |
| `<leader>t[` | 普通 | 上一个标签页 |
| `<leader>e` | 普通 | 聚焦文件树；文件树未打开时打开 |
| `<M-e>` | 普通 | 切换文件树显示状态 |

### Telescope 搜索

| 快捷键 | 模式 | 功能 |
| --- | --- | --- |
| `<leader>ff` | 普通 | 查找文件 |
| `<leader>fg` | 普通 | 全文实时搜索 |
| `<leader>fb` | 普通 | 搜索已打开的 Buffer |
| `<leader>fh` | 普通 | 搜索帮助文档 |
| `<CR>` | Telescope | 打开选中文件；已在其他标签页打开时切换到对应位置 |

### Buffer 和终端

| 快捷键 | 模式 | 功能 |
| --- | --- | --- |
| `<leader>bn` | 普通 | 切换到下一个 Buffer |
| `<leader>bp` | 普通 | 切换到上一个 Buffer |
| `<leader>1` 至 `<leader>9` | 普通 | 跳转到对应编号的 Buffer |
| `<C-\>` | 全局 | 打开或隐藏浮动终端 |
| `<leader>rc` | 普通 | 使用 gcc 编译当前文件 |
| `<leader>rr` | 普通 | 运行当前文件对应的可执行文件 |

编译和运行命令默认面向 C 文件：编译结果使用当前文件名（不含扩展名），并带有 `-g` 调试信息。

### LSP 快捷键

以下快捷键只在当前 Buffer 附加了 LSP 后生效：

| 快捷键 | 模式 | 功能 |
| --- | --- | --- |
| `gd` | 普通 | 跳转到定义 |
| `gr` | 普通 | 查找引用 |
| `K` | 普通 | 显示悬浮文档 |
| `<leader>rn` | 普通 | 重命名符号 |
| `<leader>ca` | 普通 | 执行代码操作 |
| `<leader>ci` | 普通 | 查找调用当前符号的代码 |
| `<leader>co` | 普通 | 查找当前符号调用的代码 |

### Markdown 快捷键

| 快捷键 | 模式 | 功能 |
| --- | --- | --- |
| `<M-l><M-o>` | 普通、插入 | 在当前列表项下方新增列表项 |
| `<M-L><M-O>` | 普通、插入 | 在当前列表项上方新增列表项 |
| `<M-c>` | 普通 | 切换任务列表状态 |
| `<M-c>` | 可视 | 切换选中任务列表状态 |
| `<leader>h` | 普通 | 高亮文本 |
| `<leader>H` | 普通 | 取消文本高亮 |

文件树中的 `<CR>` 用于打开选中文件；该映射由 nvim-tree 在文件树 Buffer 内提供。

## 插件默认快捷键

以下快捷键由插件提供，未在本项目中重新定义。不同插件版本可能存在少量差异；进入对应插件界面后，可使用插件自身的帮助查看完整映射。

### nvim-tree 文件树

这些快捷键只在 nvim-tree 窗口中生效：

| 快捷键 | 功能 |
| --- | --- |
| `<CR>` / `o` | 打开文件或展开目录 |
| `<Tab>` | 预览文件 |
| `a` | 新建文件或目录 |
| `d` | 删除文件或目录 |
| `r` | 重命名 |
| `c` / `x` | 复制 / 剪切 |
| `p` | 粘贴 |
| `R` | 刷新文件树 |
| `H` | 显示或隐藏点文件 |
| `q` | 关闭文件树 |
| `?` | 显示帮助 |

### Telescope 搜索窗口

这些快捷键主要在 Telescope 的插入模式搜索窗口中生效：

| 快捷键 | 功能 |
| --- | --- |
| `<C-n>` / `<C-p>` | 选择下一个 / 上一个结果 |
| `<Down>` / `<Up>` | 选择下一个 / 上一个结果 |
| `<C-j>` / `<C-k>` | 选择下一个 / 上一个结果 |
| `<C-x>` | 在水平分屏中打开 |
| `<C-v>` | 在垂直分屏中打开 |
| `<C-t>` | 在新标签页中打开 |
| `<C-q>` | 将选中结果发送到 quickfix 列表 |
| `<C-u>` / `<C-d>` | 预览窗口向上 / 向下滚动 |
| `<C-c>` / `<Esc>` | 关闭搜索窗口 |

本项目将 Telescope 中的 `<CR>` 自定义为“打开选中文件，并在文件已打开时切换到对应标签页”。

### nvim-cmp 补全

| 快捷键 | 模式 | 功能 |
| --- | --- | --- |
| `<C-n>` / `<C-p>` | 插入 | 选择下一个 / 上一个补全项 |
| `<C-b>` / `<C-f>` | 插入 | 向上 / 向下滚动补全文档 |
| `<C-Space>` | 插入 | 手动触发补全 |
| `<C-e>` | 插入 | 取消补全菜单 |
| `<CR>` | 插入 | 确认当前补全项 |

其中 `<C-b>`、`<C-f>`、`<C-Space>`、`<C-e>` 和 `<CR>` 已在本项目配置中显式设置。

### nvim-surround

| 快捷键 | 模式 | 功能 |
| --- | --- | --- |
| `ys{motion}{char}` | 普通 | 使用指定字符包围移动范围 |
| `yss{char}` | 普通 | 包围当前行 |
| `S{char}` | 可视 | 包围选中内容 |
| `ds{char}` | 普通 | 删除指定包围符号 |
| `cs{old}{new}` | 普通 | 修改包围符号 |

### nvim-autopairs

该插件没有需要主动记忆的主要默认快捷键：在插入模式输入括号、引号等成对字符时，会自动插入对应的右侧字符；输入右括号时会复用已有字符，避免重复输入。

## Neovim 基础编辑快捷键

### 模式切换

| 快捷键 | 功能 |
| --- | --- |
| `i` | 在光标前进入插入模式 |
| `a` | 在光标后进入插入模式 |
| `I` | 在行首进入插入模式 |
| `A` | 在行尾进入插入模式 |
| `o` | 在下方新建一行并进入插入模式 |
| `O` | 在上方新建一行并进入插入模式 |
| `Esc` | 返回普通模式 |
| `v` | 进入字符可视模式 |
| `V` | 进入行可视模式 |
| `<C-v>` | 进入块可视模式 |
| `:` | 进入命令行模式 |

### 移动与窗口

| 快捷键 | 功能 |
| --- | --- |
| `h` / `j` / `k` / `l` | 左 / 下 / 上 / 右移动 |
| `w` / `b` | 移动到下一个 / 上一个单词 |
| `f{char}` / `F{char}` | 向右 / 向左跳到本行中下一个匹配字符 |
| `t{char}` / `T{char}` | 向右 / 向左跳到匹配字符的前一个位置 |
| `;` / `,` | 重复上一次 `f`、`F`、`t` 或 `T` 查找 / 反向重复 |
| `0` / `^` / `$` | 行首 / 首个非空字符 / 行尾 |
| `gg` / `G` | 文件开头 / 文件结尾 |
| `Ctrl-d` / `Ctrl-u` | 向下 / 向上滚动半页 |
| `%` | 在匹配的括号之间跳转 |
| `Ctrl-w h/j/k/l` | 在分屏窗口之间移动 |
| `Ctrl-w c` | 关闭当前窗口 |

### 编辑与撤销

| 快捷键 | 功能 |
| --- | --- |
| `yy` | 复制当前行 |
| `dd` | 删除当前行 |
| `D` | 删除到行尾 |
| `p` / `P` | 在光标后 / 前粘贴 |
| `u` | 撤销 |
| `Ctrl-r` | 重做 |
| `.` | 重复上一次修改 |
| `ciw` | 修改当前单词 |
| `diw` | 删除当前单词 |
| `>>` / `<<` | 增加 / 减少缩进 |
| `=` | 自动缩进选中内容或动作范围 |

### 搜索与文件操作

| 快捷键 | 功能 |
| --- | --- |
| `/pattern` | 向下搜索 |
| `?pattern` | 向上搜索 |
| `n` / `N` | 下一个 / 上一个搜索结果 |
| `*` / `#` | 向下 / 向上搜索光标下的单词 |
| `:w` | 保存文件 |
| `:q` | 退出当前窗口 |
| `:wq` | 保存并退出 |
| `:qa` | 退出 Neovim |
| `:e <文件>` | 打开文件 |

## 当前编辑选项

- Leader 键为空格，LocalLeader 使用默认值。
- 启用绝对行号和相对行号。
- Tab 使用 4 个空格，且插入空格而不是 Tab 字符。
- 禁用自动换行，启用增量搜索、智能大小写和搜索高亮。
- 启用系统剪贴板同步。
- WSL 中检测到 `wl-copy` 时，自动配置 `wl-clipboard`。
