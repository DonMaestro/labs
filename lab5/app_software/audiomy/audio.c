#include "address_map_arm.h"

/* globals */
#define BUF_SIZE 31  // about 10 seconds of buffer (@ 8K samples/sec)
#define BUF_THRESHOLD 96 // 75% of 128 word buffer

const float h[] = { 0, 0.0055, 0.0109, 0.0162, 0.0214, 0.0262, 0.0309, 0.0351, 0.0390, 0.0425, 0.0455, 0.0480, 0.0499, 0.0514, 0.0522, 0.0525, 0.0522, 0.0514, 0.0499, 0.0480, 0.0455, 0.0425, 0.0390, 0.0351, 0.0309, 0.0262, 0.0214, 0.0162, 0.0109, 0.0055, 0.0000 };

unsigned int conv(unsigned int *buf_base, const float *h,
		unsigned int size, unsigned int offset)
{
	unsigned int *addr;
	float res;
	unsigned int i;
	unsigned int *buf_end;

	buf_end = buf_base + size - 1;
	addr = buf_base + offset;

	res = 0;
	for(i = 0; i < size; i++) {
		res = res + *addr * h[i];

		addr++;
		if (addr > buf_end) addr = buf_base;
	}
	return (unsigned int)res;
}

int main(void)
{
	volatile int * red_LED_ptr = (int *)LED_BASE;
	volatile int * audio_ptr   = (int *)AUDIO_BASE;
	//volatile int * av_conf_ptr = (int *)AV_CONFIG_BASE;
	volatile int * SW_ptr      = (int *)SW_BASE;

	/* used for audio record/playback */
	unsigned int fifospace;
	unsigned int buffer_offset = 0;
	unsigned int left_buffer[BUF_SIZE];
	unsigned int right_buffer[BUF_SIZE];
        unsigned int switches;

	/*
	// WM8731 AUDIO
	*(av_conf_ptr + 2) = 0x34;

	// conf LIN left
	*(av_conf_ptr + 3) = 0x00; // 
	while(!(*(av_conf_ptr + 1) && 0x2));
	*(av_conf_ptr + 3) = 0x17; // { 0 unmute 0dB }
	while(!(*(av_conf_ptr + 1) && 0x2));
	// conf LIN right
	*(av_conf_ptr + 3) = 0x01;
	while(!(*(av_conf_ptr + 1) && 0x2));
	*(av_conf_ptr + 3) = 0x17; // { 0 unmute 0dB }
	while(!(*(av_conf_ptr + 1) && 0x2));

	// set LIN to ADC
	*(av_conf_ptr + 3) = 0x04;
	while(!(*(av_conf_ptr + 1) && 0x2));
	*(av_conf_ptr + 3) = 0x04;
	while(!(*(av_conf_ptr + 1) && 0x2));

	*(av_conf_ptr + 3) = 0x05;
	while(!(*(av_conf_ptr + 1) && 0x2));
	*(av_conf_ptr + 3) = 0x02;
	while(!(*(av_conf_ptr + 1) && 0x2));

	// Sampling control
	*(av_conf_ptr + 3) = 0x08;
	while(!(*(av_conf_ptr + 1) && 0x2));
	*(av_conf_ptr + 3) = 0x00; // 48kHz
	while(!(*(av_conf_ptr + 1) && 0x2));

	// power on
	*(av_conf_ptr + 3) = 0x06;
	while(!(*(av_conf_ptr + 1) && 0x2));
	*(av_conf_ptr + 3) = 0x02;
	while(!(*(av_conf_ptr + 1) && 0x2));
	*/

	*(red_LED_ptr) = 0x1; // turn on LEDR[0]
	while (1) {
		// read the audio port fifospace register
		//if ((fifospace & 0x000000FF) > BUF_THRESHOLD) {
		fifospace = *(audio_ptr + 1);
        	switches = *SW_ptr; // Toggle between video and edge detection
		if (switches & 0x1 && fifospace & 0xFF) {
			left_buffer[buffer_offset]  = *(audio_ptr + 2);
			*(audio_ptr + 2) = conv(left_buffer, h,
						BUF_SIZE, buffer_offset);

			right_buffer[buffer_offset] = *(audio_ptr + 3);
			*(audio_ptr + 3) = conv(right_buffer, h,
						BUF_SIZE, buffer_offset);
			buffer_offset++;
			if (buffer_offset >= BUF_SIZE) buffer_offset = 0;
		} else {
			left_buffer[buffer_offset]  = *(audio_ptr + 2);
			right_buffer[buffer_offset] = *(audio_ptr + 3);

			*(audio_ptr + 2) = left_buffer[buffer_offset];
			*(audio_ptr + 3) = right_buffer[buffer_offset];
		}
	}
}

