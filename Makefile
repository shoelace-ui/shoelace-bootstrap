# Shortcuts ===================================================================
NODE_MODULES = node_modules
NODE_MODULES_BIN = $(NODE_MODULES)/.bin

# Node executables ============================================================
STYLUS = $(NODE_MODULES_BIN)/stylus

# Source files ================================================================
SRC_STYLUS_FILES = $(shell find src -name "*.styl" -type f | sort)

# Targets =====================================================================
setup: \
	node_modules \
	components

node_modules:
	@npm install

components:
	@component install

dist/index.css: $(SRC_STYLUS_FILES)
	@mkdir -p dist
	@$(STYLUS) src/index.styl > $@

.PHONY: \
	clean \
	setup
