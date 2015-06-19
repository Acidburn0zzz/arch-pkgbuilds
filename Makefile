RED?=$(shell tput setaf 1)
GREEN?=$(shell tput setaf 2)
YELLOW?=$(shell tput setaf 3)
BLUE?=$(shell tput setaf 4)
BOLD?=$(shell tput bold)
RST?=$(shell tput sgr0)


git-hook:
	@for hook in .config/git/*.hook; do \
		echo "==> Linking hook: $${hook}"; \
		ln -sf "../../$${hook}" ".git/hooks/$$(basename $${hook%.hook})"; \
	done

watch:
	@echo "$(BOLD)$(GREEN)[*] $(RST)$(BOLD)searching for upstream changes...$(RST)"
	@mkdir -p .cache/urlwatch
	@urlwatch --urls=./.urlwatch -c .cache/urlwatch
	@echo "$(BOLD)$(GREEN)[+] $(RST)$(BOLD)successfully finished upstream watches$(RST)"

clean:
	@echo "$(BOLD)$(GREEN)[+] $(RST)$(BOLD)cleaning up...$(RST)"
	@find * -type d \( -name 'src' -o -name 'pkg' \) -print0 | xargs -0 -I {} rm -v -r '{}'|sed -e 's/removed ‘\(.*\)’/$(BOLD)$(YELLOW)  -> $(BLUE)\1$(RST)/g'
	@find * -type f \( -name "*.zip" -o -name "*.tgz" -o -name "*.jar" -o -name '*.tar.gz' -o -name '*.tar.xz' -o -name '*.bz2' -o -name '*.tar.xz.sig' -o -name '*.log' -o -name '*.gem' \) -print0 | xargs -0 -I {} rm -v '{}'|sed -e 's/removed ‘\(.*\)’/$(BOLD)$(YELLOW)  -> $(BLUE)\1$(RST)/g'
	@echo "$(BOLD)$(GREEN)[+] $(RST)$(BOLD)successfully cleaned up$(RST)"