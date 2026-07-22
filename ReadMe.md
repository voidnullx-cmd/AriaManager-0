# ⚡ AriaManager (`dl`)

A lightning-fast, flicker-free terminal download manager built on top of **Aria2**, featuring a real-time multi-download monitor, visual progress bars, interactive hotkeys, and zero-mess buffer management.

---

## Future

This is a barebones aria2 based cli. hoping to improve its ui in the future and making an actual gui.

---

## 📥 Installation

Clone the repository and run the universal installer with root privileges:

```bash
git clone [https://github.com/yourusername/AriaManager.git](https://github.com/yourusername/AriaManager.git)
cd AriaManager
sudo ./install.sh
```

## Usage

Simply type dl anywhere in your terminal to launch the interactive menu, or use fast direct command shortcuts:

Command	Action
dl	Opens the main interactive menu
dl add <URL>	Adds a download and instantly launches the live monitor
dl watch (or dl list)	Opens the flicker-free live multi-download monitor grid
dl pause <#>	Pauses a download by its grid item number
dl resume <#>	Resumes a paused download
dl cancel <#>	Cancels and removes a download
dl settings	Configures default folder, connection counts, and split parts

## Live Monitor Hotkeys
 
When inside the live monitor screen (dl watch), press these keys instantly:

    P ➔ Pause a download by index number

    R ➔ Resume a download by index number

    D ➔ Delete / cancel a download

    A ➔ Add a new download link on the fly

    B (or Q) ➔ Return smoothly to the main menu

## Configuration

Settings are automatically saved locally at ~/.config/aria-mgr/config. You can adjust default save directories,
max server connections, and split multi-parts either via dl settings or directly editing the config file.
