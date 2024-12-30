# Variables
GO         := go
APP_NAME   := carleton-course-scheduler
BIN_DIR    := bin
MAIN_SRC   := cmd/main/main.go

all: build build-queryTests

build:
	$(GO) build -o $(BIN_DIR)/$(APP_NAME) $(MAIN_SRC)

build-queryTests:
	$(GO) build -o $(BIN_DIR)/queryTests ./tests/queryTests/test.go

run:
	$(GO) run $(MAIN_SRC)

run-queryTests:
	$(BIN_DIR)/queryTests

clean:
	del /q $(BIN_DIR)
