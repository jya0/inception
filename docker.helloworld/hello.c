#include	<stdio.h>
#include	<unistd.h>

int	main(void)
{
	char	hostname[64];

	gethostname(hostname, 64);
	printf("Hello world! from: %s\n", hostname);
	return (0);
}
