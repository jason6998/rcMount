# rcMount
rcMount 是一支可以將 [Rclone](https://rclone.org) 掛載成本地磁碟或虛擬目錄夾的管理程式，Rclone是一個命令行程式，用於對遠端空間的文件和目錄夾，進行同步、上傳、下載、拷貝搬移等等工作，Rclone支援的遠端空間相當廣泛包含Amazon Drive、Box、Dropbox、FTP、Google Drive...等數十項，但由於Rclone是採用命令列指令的方式同步遠端文件，對於一般使用者較不習慣使用，幸運的是Rclone堤供了可以將遠端空間掛載([Mount](https://rclone.org/commands/rclone_mount/))成為本地磁碟代號或成為虛擬目錄夾，不過較可惜的是Rclone所提供的掛載指令對於Windows使用者並不友善，rcMount即是針對此項功能缺失補強管理。

## 安裝
* 請先下載安裝 [Rclone](https://rclone.org)
* 再下載安裝 [WinFsp](http://www.secfs.net/winfsp/)
* 最後再下載 [rcMount](https://github.com/jason6998/rcMount/releases) 最新釋出版本，然後解壓縮至您要放置的目錄夾內即可。

License
-------

此軟體是完全免費的，依照 MIT 相關授權條款釋出。
