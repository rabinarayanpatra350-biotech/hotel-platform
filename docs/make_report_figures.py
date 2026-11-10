import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
import numpy as np

INK="#17202a"; GREY="#6b7a88"; GREEN="#14532d"; RED="#b91c1c"; BLUE="#0b6e99"; PURPLE="#7a4c93"
plt.rcParams.update({"font.family":"DejaVu Sans","font.size":9})

# ---- fig 3: data quality issues by code (real numbers from the ETL run)
fig, ax = plt.subplots(figsize=(9.2, 4.2))
codes = ["MISSING_EMAIL","CHECKOUT_NOT_AFTER_CHECKIN","NEGATIVE_RATE","UNMATCHED_ROOM"]
counts = [33, 27, 14, 12]
sev    = ["warning","error","error","warning"]
cols = [RED if s=="error" else BLUE for s in sev]
y = np.arange(len(codes))[::-1]
bars = ax.barh(y, counts, color=cols, alpha=0.9, height=0.6, edgecolor="white")
for b, c in zip(bars, counts):
    ax.text(c+0.7, b.get_y()+b.get_height()/2, str(c), va="center", fontsize=10, fontweight="bold", color=INK)
ax.set_yticks(y); ax.set_yticklabels(codes, fontsize=8.6)
ax.set_xlabel("rows affected (of 640 bookings and 275 guest records)", fontsize=9)
ax.set_xlim(0, 40)
ax.set_title("What the pipeline found, and what it did about it\n"
             "red = row quarantined, blue = row kept but flagged", fontsize=11, color=INK)
ax.spines["top"].set_visible(False); ax.spines["right"].set_visible(False)
ax.grid(axis="x", alpha=0.25, lw=0.6)
ax.set_axisbelow(True)
fig.tight_layout(); fig.savefig("docs/figures/fig3_issues.png", dpi=200, bbox_inches="tight"); plt.close(fig)

# ---- fig 4: test suite breakdown (real counts)
fig, ax = plt.subplots(figsize=(11.0, 4.4))
areas = ["normalise\n(unit)","roomTypeMap\n(unit)","email\ntemplates","auth +\ntokens","RBAC",
         "properties","bookings","metrics","jobs +\nqueue"]
tests = [35, 8, 6, 15, 7, 12, 13, 10, 19]
cols2 = [PURPLE, PURPLE, PURPLE, GREEN, GREEN, GREEN, GREEN, GREEN, BLUE]
bars = ax.bar(range(len(areas)), tests, color=cols2, alpha=0.9, edgecolor="white", width=0.62)
for b, v in zip(bars, tests):
    ax.text(b.get_x()+b.get_width()/2, v+0.8, str(v), ha="center", fontsize=10, fontweight="bold", color=INK)
ax.set_xticks(range(len(areas))); ax.set_xticklabels(areas, fontsize=7.8)
ax.set_ylabel("tests", fontsize=9)
ax.set_ylim(0, 42)
ax.set_title("125 tests, all passing — purple: pure unit, green: API against real PostgreSQL, blue: queue and email",
             fontsize=11, color=INK)
ax.spines["top"].set_visible(False); ax.spines["right"].set_visible(False)
ax.grid(axis="y", alpha=0.25, lw=0.6); ax.set_axisbelow(True)
fig.tight_layout(); fig.savefig("docs/figures/fig4_tests.png", dpi=200, bbox_inches="tight"); plt.close(fig)
print("report figures written")
