DARK_THEME_DIR=Super\ Flat\ Solarized\ Dark
LIGHT_THEME_DIR=Super\ Flat\ Solarized\ Light

SYS_THEME_DIR=/usr/share/themes


SYS_DARK_PATH=$(SYS_THEME_DIR)/$(DARK_THEME_DIR)
SYS_LIGHT_PATH=$(SYS_THEME_DIR)/$(LIGHT_THEME_DIR)

help:
	@echo ''
	@echo 'Usage:'
	@echo '  make install           # install both dark and light themes'
	@echo '  make install-dark      # only install dark theme'
	@echo '  make install-light     # only install light theme'
	@echo ''
	@echo '  make uninstall         # uninstall both dark and light themes'
	@echo '  make uninstall-dark    # only uninstall dark theme'
	@echo '  make uninstall-light   # only uninstall light theme'
	@echo ''
	@echo '  make update            # update both themes'
	@echo '  make update-dark       # update just dark theme'
	@echo '  make update-light      # update just light theme'

	@echo '  make apply-light       # set gnome-shell theme to light'
	@echo '  make apply-dark        # set gnome-shell theme to dark'
	@echo '  make discard           # set gnome-shell theme to default'

uninstall-dark:
	[ -d $(DARK_THEME_DIR) ] && rm -rf $(SYS_DARK_PATH)

uninstall-light:
	[ -d $(LIGHT_THEME_DIR) ] && rm -rf $(SYS_LIGHT_PATH)

install-dark:
	cp -r ./$(DARK_THEME_DIR) $(SYS_DARK_PATH)

install-light:
	cp -r ./$(LIGHT_THEME_DIR) $(SYS_LIGHT_PATH)

install: install-dark install-light
	@echo 'Themes installed.'

uninstall: discard uninstall-dark uninstall-light
	@echo 'Both themes are now complately removed.'

update-dark: uninstall-dark install-dark
	@echo 'Dark theme updated.'

update-light: uninstall-light install-light
	@echo 'Light theme updated.'

update: update-dark update-light
	@echo ''

apply-light:
	gsettings set org.gnome.shell.extensions.user-theme name 'Super Flat Solarized Light'

apply-dark:
	gsettings set org.gnome.shell.extensions.user-theme name 'Super Flat Solarized Dark'

discard:
	gsettings reset org.gnome.shell.extensions.user-theme name
