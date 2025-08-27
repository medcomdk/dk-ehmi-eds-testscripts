#!/usr/bin/env python3
from __future__ import annotations
import argparse
from pathlib import Path

REPLACEMENTS = {
    "D-CS-C1-CE": "${C1}",
    "D-CS-C2-CE": "${C2}",
    "D-CS-C3-CE": "${C3}",
    "D-CS-C4-CE": "${C4}",
    "D-CS-C5-CE": "${C5}",
    "D-CS-C6-CE": "${C6}",
    "D-CS-C7-CE": "${C7}",
    "D-CS-C8-CE": "${C8}",
    "D-CS-C9-CE": "${C9}",
    "D-CS-C10-CE": "${C10}",
    "1970-01-01T00:00:00.000+02:00": "${CURRENTDATETIME}",
}

def process_file(fp: Path, dry_run: bool, backup: bool) -> dict[str, int] | None:
    try:
        text = fp.read_text(encoding="utf-8")
    except Exception as e:
        print(f"⚠️  Skipping {fp} (read error: {e})")
        return None

    counts: dict[str, int] = {}
    updated = text
    for old, new in REPLACEMENTS.items():
        c = updated.count(old)
        if c:
            counts[old] = c
            updated = updated.replace(old, new)

    if not counts:
        return {}

    if not dry_run:
        try:
            if backup:
                bak = fp.with_suffix(fp.suffix + ".bak")
                bak.write_text(text, encoding="utf-8")
            fp.write_text(updated, encoding="utf-8")
        except Exception as e:
            print(f"❌ Failed to write {fp}: {e}")
            return None

    return counts

def main():
    p = argparse.ArgumentParser(description="Bulk replace strings in JSON files.")
    p.add_argument("--dir", default="fsh-generated", help="Root folder to scan (default: fsh-generated)")
    p.add_argument("--no-recursive", action="store_true", help="Only this directory, not subfolders")
    p.add_argument("--dry-run", action="store_true", help="Show what would change, but don't write")
    p.add_argument("--backup", action="store_true", help="Save a .bak copy before writing")
    args = p.parse_args()

    root = Path(args.dir)
    if not root.exists():
        print(f"❌ Directory not found: {root.resolve()}")
        raise SystemExit(1)

    pattern = "*.json"
    files = (root.glob(pattern) if args.no_recursive else root.rglob(pattern))

    total_files_changed = 0
    total_counts = {k: 0 for k in REPLACEMENTS.keys()}

    for fp in files:
        result = process_file(fp, dry_run=args.dry_run, backup=args.backup)
        if result is None:
            continue  # error already reported
        if result:
            total_files_changed += 1
            pretty = ", ".join([f"{k}×{v}" for k, v in result.items()])
            print(f"✅ {fp}: {pretty}")
            for k, v in result.items():
                total_counts[k] += v

    if total_files_changed == 0:
        print("ℹ️  No changes needed.")
    else:
        print("\n— Summary —")
        for k, v in total_counts.items():
            print(f"{k} → {REPLACEMENTS[k]} : {v} replacement(s)")
        print(f"Files changed: {total_files_changed}")
        if args.dry_run:
            print("Dry run only — no files were written.")
        elif args.backup:
            print("Backups saved with .bak suffix.")

if __name__ == "__main__":
    main()
