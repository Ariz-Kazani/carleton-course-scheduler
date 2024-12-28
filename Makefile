# Variables
GO         := go
APP_NAME   := carleton-course-scheduler
BIN_DIR    := bin
MAIN_SRC   := cmd/main/main.go

all: build

build:
	$(GO) build -o $(BIN_DIR)/$(APP_NAME) $(MAIN_SRC)

run:
	$(GO) run $(MAIN_SRC)

clean:
	del /q $(BIN_DIR)
