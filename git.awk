# Functions related to git.


# Increment version tag.
# Version tag must be in Semantic Versioning form. A single letter (e.g. "v")
# may be prepended (e.g., "v1.1.2").
#
# `previousTag` parameter is the tag to be incremented.
#
# `step` parameter controls which part of the version is incremented.
# If `step` is equal to 0, MAJOR part is incremented.
# If `step` is equal to 1, MINOR part is incremented.
# If `step` is equal to 2, PATH part is incremented.

function incrementTag(previousTag, step) {
   sub(/[a-zA-Z]/, "", previousTag);
   split(previousTag, numbers, /\./)

   if (step == 0) {
       numbers[1] += 1;
   } else if (step == 1) {
       numbers[2] += 1;
   } else if (step == 2) {
       numbers[3] += 1;
   }

   incrementedVersion = numbers[1] "." numbers[2] "." numbers[3];
   incrementedTag = "v" incrementedVersion;
   return incrementedTag;
}

{iv = incrementTag($0, part); print iv}
