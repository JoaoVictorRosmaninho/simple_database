CC 			:= clang++
NAME 		:= db
STD			:= -std=c++17
CFLAGS  	:= -Wall -Wextra -Werror -Weffc++ -Wconversion -Wsign-conversion
HFLAGS  	:= -I./includes

OBJECTS_DIR := dist

SOURCES  	:= $(shell find src -type f -name '*.cpp')
OBJECTS 	:= $(addprefix $(OBJECTS_DIR)/, $(notdir $(SOURCES:.cpp=.o)))

vpath %.hpp ./includes
vpath %.cpp $(dir $(SOURCES))

all: $(NAME)

$(NAME): $(OBJECTS_DIR) $(OBJECTS)
	$(CC) $(OBJECTS) -o $(NAME)

$(OBJECTS_DIR)/%.o: %.cpp
	$(CC) $(CFLAGS) $(HFLAGS) $(STD) -c $< -o $@

$(OBJECTS_DIR):
	mkdir $(OBJECTS_DIR)

clean:
	rm $(OBJECTS)

fclean: clean
	rm $(NAME)

re: fclean $(NAME)

#COLOAR O PHONY
#COLOCAR O .so
