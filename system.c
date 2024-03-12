#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>

#define BUFFER_SIZE 100

int main() {
    int fd; // File descriptor
    ssize_t ret; // Return value for read/write operations
    char buffer[BUFFER_SIZE];

    // Open the file in write mode, create it if it doesn't exist, and set permissions
    fd = open("example.txt", O_CREAT | O_WRONLY | O_TRUNC, 0666);
    if (fd == -1) {
        perror("open");
        exit(EXIT_FAILURE);
    }

    // Write "Hello world" to the file
    ret = write(fd, "Hello world", 11); // 11 is the length of "Hello world"
    if (ret == -1) {
        perror("write");
        exit(EXIT_FAILURE);
    }

    // Close the file after writing
    close(fd);

    // Open the file in read mode
    fd = open("example.txt", O_RDONLY);
    if (fd == -1) {
        perror("open");
        exit(EXIT_FAILURE);
    }

    // Read from the file
    ret = read(fd, buffer, BUFFER_SIZE);
    if (ret == -1) {
        perror("read");
        exit(EXIT_FAILURE);
    }

    // Null-terminate the string read from the file
    buffer[ret] = '\0';

    // Print the content read from the file
    printf("Content read from file: %s\n", buffer);

    // Close the file after reading
    close(fd);

    return 0;
}
