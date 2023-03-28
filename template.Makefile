# The build directory
D_MK = .build

# Source file, FILE variable should be taken as input
CF_SRC = $(FILE)
EF_BIN = $(D_MK)/$(CF_SRC:.c=)

CC = gcc
CXX = clang++
C_FLAGS = -Wall -Wextra -Wpedantic -g $(OPT)

all: $(EF_BIN)

$(EF_BIN): $(CF_SRC)
	@mkdir -p $(D_MK)
	$(CC) $(C_FLAGS) -o $@ $<

# To run the executable
run: $(EF_BIN)
	$<

clean:
	rm $(EF_BIN)
