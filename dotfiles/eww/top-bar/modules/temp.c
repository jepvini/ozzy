#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#define MAX_LENGTH 11

void
clean_buff(char *buff)
{
  for (int i = 0; i < MAX_LENGTH; i++)
    buff[i] = ' ';
}

int
main(int argc, char *argv[])
{
  FILE *temp_now;

  char buff[MAX_LENGTH];
  long temp;

  while (1) {
    temp_now = fopen("/sys/class/thermal/thermal_zone3/temp", "r");
    if (temp_now == NULL) {
      puts("error opening the file");
      exit(1);
    }

    clean_buff(buff);
    fgets(buff, MAX_LENGTH, temp_now);
    fclose(temp_now);
    temp = strtol(buff, NULL, 10);

    fflush(stdout);
    printf("%ld\n", (temp / 1000) + 1);
    usleep(500000);
  }
  return EXIT_SUCCESS;
}
