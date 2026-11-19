import argparse, json, sys
p = argparse.ArgumentParser()
p.add_argument("--ruid", required=True)
p.add_argument("--expected-commit", required=True)
p.add_argument("--manifest", required=True)
p.add_argument("--output", required=True)
a = p.parse_args()
with open(a.manifest) as f:
    m = json.load(f)
if m.get("sha") != a.expected_commit:
    print(f"SHA mismatch: {m.get('sha')} vs {a.expected_commit}")
    sys.exit(1)
with open(a.output, "w") as f:
    json.dump({"status": "validated", "ruid": a.ruid, "sha": m.get("sha")}, f, indent=2)
print("validated OK")