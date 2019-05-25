// не работает
#include <stdio.h>
#include <conio.h>
int main(void) 
{
  int i;
  printf("KBDLED, (c) A. Frolov, 1997\n");
 // Send keyboard CPU the LEDs command 
  outp(0x60,0xed);
  // little pause
  // before the sending 2th byte of command
  for(i=0; i<4000; i++);
  // output 2th byte of command, младшие 
  // 3 bits of command set up the 
  // condition of the LEDs
  outp(0x60,7);
  printf("Press any key to  "
         "turn on LEDs\n");
  // Pause of the programm run , while
  // a user don't press any key  
  getch();
  // Turn out all LEDs
  outp(0x60,0xed);
  for(i=0; i<4000; i++);
  outp(0x60,0);
  return 0;
}
