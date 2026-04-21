# PES-VCS Lab Report

**Name:** Aditya Raj  
**SRN:** PES2UG24CS033  
**Project:** Orange Version Control System (PES-VCS)  
**Date:** April 16, 2026

---

# 1. Build Output

![Build Output](outputss/build_output.png)

---

# 2. Phase 1: Object Storage

## 2A. Test Output

![Phase 1 Test](outputss/phase1_test.png)

## 2B. Object Store Structure

![Phase 1 Objects](outputss/phase1_objects.png)

---

# 3. Phase 2: Tree Objects

## 3A. Test Output

![Phase 2 Test](outputss/phase2_test.png)

## 3B. Tree Object Hex Dump

![Phase 2 Hex Dump](outputss/phase2_hex.png)

---

# 4. Phase 3: Index (Staging Area)

## 4A. Commands Output

![Phase 3 Status](outputss/phase3_status.png)

## 4B. Index File Content

![Phase 3 Index](outputss/phase3_index.png)

---

# 5. Phase 4: Commits

## 5A. Commit Log

![Phase 4 Log](outputss/phase4_log.png)

## 5B. .pes Directory Structure

![Phase 4 Files](outputss/phase4_files.png)

## 5C. HEAD and References

![Phase 4 Refs](outputss/phase4_refs.png)

---

# 6. Final Integration Test

![Integration Test](outputss/integration.png)

---

# 7. Analysis Questions

## Q5.1 Branch Checkout

A branch is stored as a reference file pointing to a commit hash. Implementing checkout would involve:

- Updating `HEAD` to point to the new branch
- Reconstructing the working directory from the target commit tree
- Overwriting files carefully

The complexity arises in handling uncommitted changes.

## Q5.2 Dirty Working Directory

Compare:

- Working directory files
- Index entries
- Target commit tree

If differences exist in tracked files, block checkout to avoid data loss.

## Q5.3 Detached HEAD

`HEAD` points directly to a commit instead of a branch.  
New commits are created but not referenced by any branch.  
Recovery is possible by creating a new branch pointing to that commit.

## Q6.1 Garbage Collection

- Traverse all reachable commits from refs
- Mark reachable objects using DFS/BFS
- Delete unmarked objects

A hash set can be used to track visited objects.

## Q6.2 GC Race Condition

If GC runs during commit:

- It may delete objects that are not yet referenced

Git avoids this using locking and reference safety.
