COMPILER = g++
FLAGS = -Wall -g -std=c++23

TARGET = main
SRC_DIR = src

SOURCES := $(wildcard $(SRC_DIR)/*.cpp)
OBJECTS := $(patsubst $(SRC_DIR)/%.cpp,obj/%.o,$(SOURCES))

$(TARGET): $(OBJECTS)
	$(COMPILER) -o $@ $^

obj/%.o: $(SRC_DIR)/%.cpp
	@mkdir -p $(@D) # Create the object directory if it doesn't exist
	$(COMPILER) $(FLAGS) -c -o $@ $<

clean:
	rm -f obj/*.o $(TARGET)
	rmdir obj 2>/dev/null || true # Remove the object directory if empty