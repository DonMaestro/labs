#define switches (volatile char *) 0x0002010
#define leds (unsigned char *) 0x0002000

void main(void)
{
	unsigned int i;
	unsigned char temp;

	temp = 1;
	*leds = temp;

	while(1) {
		//for (i = 0; i < 50000000; i++) {};
		temp = temp == 128 ? 1 : temp << 1;
		if (*switches & temp)
			*leds = temp;	
	}
}
