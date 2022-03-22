#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static char *my_strndup(const char *str, size_t len)
{
	char *r;

	r = malloc(len + 1);
	strncpy(r, str, len);
	r[len] = '\0';
	return r;
}

static char **split(const char *text, const char delimiter)
{
	const char *s, *p;
	char **vstr;
	int i;

	vstr = malloc(sizeof(*vstr) * strlen(text));
	i = 0;

	for (s = p = text; *p; p++) {
		if (*p == delimiter) {
			vstr[i++] = my_strndup(s, p - s);
			s = p + 1;
		}
	}

	vstr[i++] = strndup(s, p - s);
	vstr[i] = NULL;

	return vstr;
}

#define BUFFER_SIZE	((100 << 20) + 1)

int main(int argc, char *argv[])
{
	char *buffer;
	int count;
	char **vstr;
	int i;

	if (argc < 2) {
		count = 100;
	} else {
		sscanf(argv[1], "%d", &count);
	}

	buffer = malloc(BUFFER_SIZE);

	i = fread(buffer, BUFFER_SIZE - 1, 1, stdin);
	(void)i;
	buffer[BUFFER_SIZE - 1] = '\0';

	for (i = 0; i < count; i++) {
		int j;

		vstr = split(buffer, '0');
		for (j = 0; vstr[j]; j++) {
			fwrite(vstr[j], strlen(vstr[j]), 1, stdout);
			fwrite("\n", 1, 1, stdout);
			free(vstr[j]);
		}
		free(vstr);
	}

	return 0;
}
