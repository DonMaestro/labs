#define switches (volatile char *) 0x0010
#define hexs (unsigned int *) 0x0000

void _start(void)
{
	unsigned char tswit;

	*hexs = 0;

	while(1) {
		tswit = *switches;
		*hexs = tswit & (tswit << 8) & (tswit << 16);
	}
}
