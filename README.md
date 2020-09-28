# Debloat Windows 10

This repository is a collection of scripts to help you gain back your privacy
and performance back.

**THOSE SCRIPTS AREN'T FOR NEWBIES. EXPERTS ONLY.**

**There is no undo**, I recommend only using these scripts on a fresh
installation (including Windows Updates). Test everything after running them
before doing anything else. Also there is no guarantee that everything will
work after future updates since I cannot predict what Microsoft will do next.

## Download Latest Version

Just clone the repository and extract it. Or download it from the releases tab.

## Execution

Enable execution of PowerShell scripts:

    PS> Set-ExecutionPolicy Unrestricted -Scope CurrentUser

Unblock PowerShell scripts and modules within this directory:

    PS> ls -Recurse *.ps*1 | Unblock-File

## Usage

1. Install all available updates for your system.
2. Edit the scripts to fit your need.
3. Run the scripts in an Admin PowerShell except for `postRun.ps1`(Explorer
`Files > Open Windows PowerShell > Open Windows PowerShell as  administrator`)
4. `PS > Restart-Computer`
5. Run `disable-windows-defender.ps1` one more time.
6. `PS > Restart-Computer`
7. Boot your PC to a Win PE environment. eg: https://www.hirensbootcd.org/
8. Open `This PC` and note the driver letter of your Windows installation and
another disk for backups(can be same as Windows drive)
9. Open the `postRun.ps1` with a text editor and change the `systemDisk` and
`backupDisk` according to your drives.

## Liability

**All scripts are provided as is and you use them at your own risk.**

## Contribute

I would be happy to extend the collection of scripts. Just open an issue or
send me a pull request.

### Thanks To

- [WindowsAmeliorated](https://ameliorated.info/)
- [W4RH4WK](https://github.com/W4RH4WK/Debloat-Windows-10)
- [ChrisTitusTech](https://github.com/ChrisTitusTech/win10script)
