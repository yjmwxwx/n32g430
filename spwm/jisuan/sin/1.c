#include <stdio.h>
#include <math.h>
#include <stdlib.h>
void main() {
  float m,pi,sr,si;

  int rr,ii, n,i;
  n=3600;
  pi=3.141592;    
	for(i=0;i<n;i++){
	   si=sin(i*pi/180);
	   ii= si * 0x8000;
	   printf("0x%08X,",ii);
}
	printf("\n");
}
	
