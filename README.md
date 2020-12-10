Bunch of Helpful Scripts for daily use whether in normal usage or CTFs. Will add as I make some.

	ArchInstall - 	To automate the installation of Arch Linux. Usage (sudo) -- bash ArchInstall.sh /dev/sda1 /dev/sda2
			Also downloads Luke Smith's larbs.sh in the /root/ directory for more customizations.

	BinHexOct__To__ASCII - To convert Binary, Hexadeximal or Octal numbers to its corresponding ASCII form. eg -> Hexadecimal 0x65 converts to ASCII "a"
	
	bluetoothConnect - For running -- " bash bluetoothConnect.sh -c "To connect to bluetooth device from your Linux device. Requires bluez-utils package 				installed to enable bluetoothctl functionality.
	
	BrightnessAdjust - To vary the Screen Brightness on Intel based systems with internal Graphics. (eg. Intel HD)
	(This additional feature requires "redshift" installed) Also as a bonus I've included a night light enabling functionality.
	
	Clone_AllGitRepo - This clones all the listed repositories with the given repo username, as the first argument.
		Example usage - bash Clone_AllGitRepo.sh $username
		You can manually edit the script to add your customization to 'git clone', eg. --depth 1, etc.
	
	ProcKill - Enter a process name within the shellscript to display its PID and KILL.

	RobustRename - Appends the keyword provided, useful in backing up files, and then also revert the rename.
		       Takes the path, file names with wildcards (eg. image*), keyword with which to append renaming as input.
