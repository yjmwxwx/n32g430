#include <stdio.h>
#include <math.h>
#include <stdlib.h>
void main() {
  float m,pi,sr,si;

  int rr,ii, n,i;
  n=6400;
  m=100;
  pi=3.141592;    
	for(i=0;i<n;i++){
	   sr=cos(2*pi*i*m/n);
	   si=-sin(2*pi*i*m/n);
	   printf("%f,%f,",sr,si);
}
	printf("\n");
}
	
