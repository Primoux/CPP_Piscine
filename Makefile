.PHONY: all clean fclean re compile_commands

MAKEFILES := $(shell find . -mindepth 2 -name "Makefile" -type f)
DIRS := $(dir $(MAKEFILES))

CC := c++
CFLAGS := -std=c++98 -Wall -Wextra -Werror

all:
	@for dir in $(DIRS); do \
		echo "Building in $$dir"; \
		$(MAKE) -C $$dir --no-print-directory; \
	done

clean:
	@for dir in $(DIRS); do \
		echo "Cleaning in $$dir"; \
		$(MAKE) -C $$dir clean --no-print-directory; \
	done

fclean:
	@for dir in $(DIRS); do \
		echo "Full cleaning in $$dir"; \
		$(MAKE) -C $$dir fclean --no-print-directory; \
	done
	rm -rf compile_commands.json

re: fclean all compile_commands.json

compile_commands: compile_commands.json

compile_commands.json:
	@echo "Generating compile_commands.json at root..."
	@rm -f $@
	@echo '[' > $@
	@first=1; \
	for src in $$(find . -name '*.cpp' -type f | grep -v '.build'); do \
		inc="-I$$(dirname $$src)/inc"; \
		for classdir in $$(find $$(dirname $$src) -path '*/class/*' -type d 2>/dev/null); do \
			inc="$$inc -I$$classdir"; \
		done; \
		if [ $$first -eq 1 ]; then \
			first=0; \
		else \
			echo ',' >> $@; \
		fi; \
		printf '  {"directory": "%s", "command": "c++ -std=c++98 -Wall -Wextra -Werror %s -c %s", "file": "%s"}\n' "$(PWD)" "$$inc" "$$src" "$$src" >> $@; \
	done
	@echo ']' >> $@
	@echo "compile_commands.json generated!"
