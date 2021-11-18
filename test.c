#include <fts.h>
#include <stdio.h>
#include <sys/stat.h>
#include <sys/types.h>

int main(void) {
  FTS *fts = NULL;
  FTSENT *ftsent = NULL;
  char *path[2] = {"/tmp/", NULL};

  if (!(fts = fts_open(path, FTS_PHYSICAL | FTS_XDEV, NULL))) {
    perror("fts_open");
    return -1;
  }

  while ((ftsent = fts_read(fts))) {
    printf("%s\n", ftsent->fts_path);
  }

  fts_close(fts);
  return 0;
}
