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
  FILE *current_now, *voltage_now;

  char buff[MAX_LENGTH];
  long current, voltage;
  double power;

  while (1) {
    current_now = fopen("/sys/class/power_supply/BAT1/current_now", "r");
    voltage_now = fopen("/sys/class/power_supply/BAT1/voltage_now", "r");
    if ((current_now == NULL) || (voltage_now == NULL)) exit(1);

    clean_buff(buff);
    fgets(buff, MAX_LENGTH, current_now);
    current = strtol(buff, NULL, 10);

    clean_buff(buff);
    fgets(buff, MAX_LENGTH, voltage_now);
    voltage = strtol(buff, NULL, 10);

    power = ((double)current / 1000000) * ((double)voltage / 1000000);
    fflush(stdout);
    printf("%.2f\n", power);
    usleep(500000);
  }
  return EXIT_SUCCESS;
}
