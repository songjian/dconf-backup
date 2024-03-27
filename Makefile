# Makefile for backing up and restoring various configurations

# Define backup file names for each configuration
BACKUP_DESKTOP = desktop-settings-backup.txt
BACKUP_TERMINAL = terminal-settings-backup.txt

# Default target when 'make' is run without arguments
default: help

# Help target to display usage information
help:
	@echo "Usage:"
	@echo "  make backup - Backup various configurations"
	@echo "  make restore - Restore various configurations"
	@echo "  make clean - Delete backup files"

# Target to backup various configurations
backup: backup-desktop backup-terminal
	@echo "Various configurations backed up"

# Target to restore various configurations
restore: restore-desktop restore-terminal
	@echo "Various configurations restored"

# Target to backup desktop settings
backup-desktop:
	@dconf dump /org/gnome/desktop/background/ > $(BACKUP_DESKTOP)

# Target to restore desktop settings
restore-desktop:
	@dconf load /org/gnome/desktop/background/ < $(BACKUP_DESKTOP)

# Target to backup terminal settings
backup-terminal:
	@dconf dump /org/gnome/terminal/ > $(BACKUP_TERMINAL)

# Target to restore terminal settings
restore-terminal:
	@dconf load /org/gnome/terminal/ < $(BACKUP_TERMINAL)

# Clean up the backup files
clean:
	rm -f $(BACKUP_DESKTOP) $(BACKUP_TERMINAL)
	@echo "Backup files deleted"

.PHONY: default help backup restore clean backup-desktop restore-desktop backup-terminal restore-terminal
