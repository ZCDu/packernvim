# Normal
|Button|Function|Plugin|
|gx|browse selected url at browser||

# cmp
在float中定义的操作。以下操作定义在cmp配置中
|Button|Function|
|C-k|选择上一个item|
|C-j|选择下一个item|
|C-b|文档滑动|
|C-f|文档滑动|
|m-o|补全|
|C-c|打开或关闭float|
|Tab|游览float|
|C-c Tab|在多个luasnip填空上进行切换|
|S-Tab|
## cmp-luasnip
针对snippest的参数可以通过<TAB>跳转到下一个待修改的位置

# lsp
# whichkey
|Button|Function|
|leader+l+f|format|

## handlers
提供类似于coc.nvim的跳转等功能.
|Button|Function|
|gl|show left icon what it means|


# browse
browser quick start!
|Button|Function||
|bb|去默认查找的文档里查文档|需要在browse中添加url|
|bi|输入需要查找的对象|但是打开的google查找|

# harpoon
ues float to show buffer.
<TAB> start the function.

# nvim-tree
nvim-tree的所有命令以NvimTree开头。
|Button|Function|Path|
|C-n|打开nvim-tree目录|keymap|
|mappings|定义了一些功能，第一位表示映射，bc对应的是nvim-tree的功能|nvim-tree|
## 目录下执行
nvim-tree定义了很多默认的操作，这些操作可以在[github](https://github.com/kyazdani42/nvim-tree.lua/blob/master/doc/nvim-tree-lua.txt)上的nvim-tree-default-mappings里找到.
|Button|Function|
|a|新建一个文件|
|r|对一个文件重命名|
|d|删除指定文件|

# todo-comment
提供了多种标签方便工程跟进：
PERF : fully optimised
HACK : 
TODO : what else?
NOTE : adding a note
FIX : this needs fixing
WARNING ???

todo-comment还能与telescope进行深度集成，方便进行查找对应的标签。
## 命令
反正就是显示所有的标签，并不会对标签进行特定的筛选。
|Button|Function|说明|
||:TodoQuickFix|使用quickfix列表来显示项目中的所有标签|
||:TodoLocList|使用list的形式显示项目中的所有标签|
||:TodoTrouble|在trouble这个插件中显示|
||:TodoTelescope|在Telescope这个插件中显示|

# symbols-outline
tagbar的代替品
|Button|Function|Path|
|T|打开代码树形图|keymap|
|o|聚焦到选中的位置|symbols-outline|
|N|使用float展示选中的代码|symbols-outline|
|r|重命名变量|symbols-outline|
|q|退出tagbar|symbols-outline|
|a|code_actions需要定义功能|symbols-outline|

未定义的功能不能使用，不然会报错。

# vim-bookmarks
设置了2种启用方式。所有的命令以Bookmark作为启动前缀。
|Button|Function|Path|
|m等待whichkey启动,功能是对应的|一堆功能|whichkey|
|mi|自定义标签索引|keymap|
|ma|显示所有标签|keymap|
|mc|清理当前buffer中的标签|keymap|
|mx|清理全部的标签|keymap|
|mm|当前行打上标签|keymap|
|mn|下一个标签|keymap|
|mN|跳转到上一个标签|keymap|

# telescope
telescope需要定义两种行为，一种是在telescope内部使用的命令，定义在telescope配置中，另一种则是启动telescope的命令，定义在whichkey中。
|Button|Function|Path|
|leader+n|find files|keymaps|
|leader+f+b|切换分支|whichkey|
|leader+f+c|切换颜色主题|whichkey|
|leader+f+f|以当前文件作为根，查找文件名|whichkey|
|leader+f+t|以当前文件作为根，查找文本|whichkey|
|leader+f+s|以当前文件作为根，查找字符串，不要求相邻|whichkey|
|leader+f+h|查找的是lua的文档|whichkey|
|leader+f+H|切换高亮方式|whichkey|
|leader+f+i|\*|whichkey|
|leader+f+l|\*|whichkey|
|leader+f+M|系统的帮助文档|whichkey|
|leader+f+r|历史打开文件查找|whichkey|
|leader+f+R|寄存器历史信息|whichkey|
|leader+f+k|查找Telescope的所有keymap|whichkey|
|leader+f+C|查找telescope的所有命令|whichkey|

# possession
对应vim-session，管理会话。
在这个插件的配置过程中，出现了文件路径的需求，需要将seession保存到这个位置，通过`vim.fn.stdpath('data')`进行指定，这个位置对应的是`.local/share/nvim`.
功能：
1. PossessionSave
2. PossessionLoad
3. PossessionClose
4. PossessionDelete
5. PossessionShow
6. PossessionList
7. PossessionMigrate ：Seession迁移，将vim保存的session迁移到这个插件下管理，用的不多的
|Button|Function|Path|
|leader+f+p|Telescope只支持集成List|whichkey|
|leader+s|srhcdl|whichkey|
|F2|保存文件需要输入保存名称|keymap|
|F3|展示所有session|keymap|
|F4|删除指定名称的session|keymap|

# zenmode
专注模式
|Button|Function|where|
|<C-x>|启动专注模式|keymaps|
