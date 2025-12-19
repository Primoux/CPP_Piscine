.PHONY: all clean fclean re compile_commands

# Find all Makefiles in subdirectories
MAKEFILES := $(shell find . -mindepth 2 -name "Makefile" -type f)
DIRS := $(dir $(MAKEFILES))

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

re: fclean all

compile_commands:
	@for dir in $(DIRS); do \
		echo "Generating compile_commands.json in $$dir"; \
		$(MAKE) -C $$dir compile_commands.json --no-print-directory; \
	done
