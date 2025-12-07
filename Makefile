# Launcher Makefile
# Quick build automation

PIO := $(HOME)/.platformio/penv/bin/pio
ENV := m5stack-cardputer

.PHONY: help build upload monitor clean all

help:
	@echo "Launcher Build Commands:"
	@echo "  make build    - Build firmware"
	@echo "  make upload   - Build and upload firmware"
	@echo "  make monitor  - Open serial monitor"
	@echo "  make clean    - Clean build files"
	@echo "  make all      - Build, upload, and monitor"

build:
	@echo "Building $(ENV)..."
	$(PIO) run -e $(ENV)

build-quiet:
	@echo "Building $(ENV)..."
	@$(PIO) run -e $(ENV) > /dev/null || $(PIO) run -e $(ENV)

upload:
	@echo "Building and uploading to $(ENV)..."
	$(PIO) run -e $(ENV) -t upload

monitor:
	@echo "Opening serial monitor..."
	$(PIO) device monitor --baud 115200

clean:
	@echo "Cleaning build..."
	$(PIO) run -e $(ENV) -t clean

all: upload monitor
