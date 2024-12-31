# Variables
GO         := go
APP_NAME   := carleton-course-scheduler
BIN_DIR    := bin
MAIN_SRC   := cmd/main/main.go

all: build build-queryTests build-migration-tools

build:
	$(GO) build -o $(BIN_DIR)/$(APP_NAME) $(MAIN_SRC)

build-queryTests:
	$(GO) build -o $(BIN_DIR)/queryTests ./tests/queryTests/test.go

build-migration-tools:
	$(GO) build -o $(BIN_DIR)/migration-tools ./tools/migration-tools/migration.go

run:
	$(GO) run $(MAIN_SRC)

run-queryTests:
	$(BIN_DIR)/migration-tools

run-migration:
	$(BIN_DIR)/migration-tools run

make-migration: 
	$(BIN_DIR)/migration-tools make

clean:
	del /q $(BIN_DIR)
