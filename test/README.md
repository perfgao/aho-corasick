test aho-corasick
=================

I found in the test using aho-corasick string search, there will be some
patterns of string loss situation.

The specific situation is this:

* In the acism_mmap_x.c file I added a print message

```
diff --git a/acism_mmap_x.c b/acism_mmap_x.c
index b94a75f..e2b5e3e 100644
--- a/acism_mmap_x.c
+++ b/acism_mmap_x.c
@@ -56,5 +56,6 @@ on_match(int s, int t, void *c)
 {
     (void)s, (void)t, (void)c;
     ++nmatches;
+    printf("pattern-line: %d\n", s + 1);
     return 0;
 }
```

* I compiled acism_x.c and acism_mmap_x.c. And generate the corresponding
executable file.

```
 $gcc -g acism.c acism_create.c acism_dump.c acism_file.c msutil.c tap.c acism_x.c -o acism_x
 $gcc -g acism.c acism_create.c acism_dump.c acism_file.c msutil.c tap.c acism_mmap_x.c -o acism_mmap_x
```
* Create a new file named pattern.txt, write the following, used as pattern.

```
$cat ./pattern.txt
/bin/bash
bin/bash
bin
/bin
/bash
bash
in
in/ba
```

* Create a new file named test.txt, write the following, used as test.

```
$cat test.txt
test/bin/bash/test
```
* Use acism_x to generate the acism.tmp file

```
$./acism_x pattern.txt
```

* test match

```
$./acism_mmap_x acism.tmp test.txt
1..2
ok 1 - acism_mmap returned
pattern-line: 4
pattern-line: 3
pattern-line: 7
pattern-line: 8
pattern-line: 1
pattern-line: 2
ok 2 - mmap-ed acism object works
# nmatches: 6 0.0000 secs
strs:8 syms:8 chars:40 trans:45 empty:4 mod:4 hash:5 size:788
```

* Based on the result information, it can be seen that pattern / bash and bash
are not matched.

you can also:

```
$ sh test.sh
$ sh test2.sh
```
