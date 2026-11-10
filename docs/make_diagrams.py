#!/usr/bin/env python3
"""diagrams.py — architecture and data-pipeline diagrams for the documentation."""
from __future__ import annotations

import os

import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt

os.makedirs("docs/diagrams", exist_ok=True)
plt.rcParams.update({"font.family": "DejaVu Sans", "font.size": 9})

INK = "#17202a"
GREY = "#6b7a88"
LINE = "#c8d2de"
BRAND = "#14532d"
REACT = "#0b6e99"
EXPRESS = "#14532d"
PG = "#336791"
OPS = "#b45309"
ETL = "#7a4c93"


def box(ax, x, y, w, h, title, body, color, fc="#ffffff", fs=7.4, tfs=9.0):
    ax.add_patch(plt.Rectangle((x, y), w, h, facecolor=fc, edgecolor=color, lw=1.6, zorder=3))
    ax.add_patch(plt.Rectangle((x, y + h - 0.42), w, 0.42, facecolor=color, edgecolor=color, lw=1.6, zorder=4))
    ax.text(x + w / 2, y + h - 0.21, title, ha="center", va="center", fontsize=tfs,
            fontweight="bold", color="white", zorder=5)
    if body:
        ax.text(x + 0.16, y + h - 0.56, body, ha="left", va="top", fontsize=fs, color=INK, zorder=5)


def arrow(ax, x1, y1, x2, y2, color=GREY, lw=1.8, label=None, lx=0, ly=0, ls="-"):
    ax.annotate("", xy=(x2, y2), xytext=(x1, y1), zorder=2,
                arrowprops=dict(arrowstyle="-|>", color=color, lw=lw, shrinkA=2, shrinkB=2, linestyle=ls))
    if label:
        ax.text((x1 + x2) / 2 + lx, (y1 + y2) / 2 + ly, label, ha="center", va="center",
                fontsize=6.8, color=color, zorder=6,
                bbox=dict(boxstyle="round,pad=0.18", fc="white", ec="none", alpha=0.9))


# ============================================================ fig 1: system
fig, ax = plt.subplots(figsize=(13.6, 7.6))
ax.set_xlim(0, 28); ax.set_ylim(0, 15.6); ax.axis("off")
ax.text(14, 15.2, "System architecture — Mumbai Boutique Hotels platform",
        ha="center", fontsize=14.5, fontweight="bold", color=INK)
ax.text(14, 14.78, "a React single-page app on Vercel, an Express API on Render, and one managed PostgreSQL instance",
        ha="center", fontsize=9.2, color=GREY, style="italic")

# --- tier 1: browser
ax.add_patch(plt.Rectangle((0.4, 10.2), 27.2, 4.1, facecolor="#f2f7fb", edgecolor=LINE, lw=1.2, zorder=1))
ax.text(0.7, 13.98, "BROWSER  ·  React 18 + Vite SPA  ·  Vercel", fontsize=8.6, fontweight="bold", color=REACT)
box(ax, 0.9, 10.5, 7.6, 3.3, "Guest pages",
    "Home and search\nProperty detail\nAvailability and booking\nEnquiry form\nSign up / sign in\nMy bookings", REACT, fs=7.6)
box(ax, 9.0, 10.5, 7.6, 3.3, "Staff and admin pages",
    "Portfolio dashboard\n  occupancy · ADR · RevPAR\nProperties CRUD\nImage upload\nEnquiries inbox", REACT, fs=7.6)
box(ax, 17.1, 10.5, 10.1, 3.3, "Shared client layer",
    "api.js — fetch wrapper that unwraps { data }, attaches the\naccess token and retries once after a silent refresh.\n"
    "Single-flight refresh, so ten parallel 401s trigger one rotation.\n"
    "auth.jsx — session context; resumes from the refresh cookie.\n"
    "ProtectedRoute — hides staff UI (the API enforces it again).", REACT, fs=7.6)

# --- tier 2: API
ax.add_patch(plt.Rectangle((0.4, 4.3), 27.2, 5.0, facecolor="#f1f7f3", edgecolor=LINE, lw=1.2, zorder=1))
ax.text(0.7, 9.06, "API  ·  Node 20 + Express  ·  Render", fontsize=8.6, fontweight="bold", color=EXPRESS)
box(ax, 0.9, 4.6, 5.5, 4.2, "Middleware",
    "helmet\ncors (allowlist)\ncompression\nrate limit\npino logging\nrequest id\nzod validation\nerror handler", EXPRESS, fs=7.2)
box(ax, 6.7, 4.6, 9.4, 4.2, "Routes",
    "/api/auth          JWT + rotating refresh\n/api/properties    CRUD, search, filters\n"
    "/api/room-types    canonical taxonomy\n/api/rooms         inventory + availability\n"
    "/api/bookings      CRUD, overlap check\n/api/reviews       CRUD\n"
    "/api/enquiries     public form + inbox\n/api/metrics       occupancy, ADR, RevPAR\n"
    "/api/media         image upload\n/api/users         admin only", EXPRESS, fs=7.1)
box(ax, 16.4, 4.6, 5.4, 4.2, "Services",
    "authService\n  bcrypt, token rotation,\n  reuse detection\n\nbookingService\n  availability maths,\n  transaction + refs\n\n"
    "metricsService\n  the single definition\n  of the three KPIs", EXPRESS, fs=7.2)
box(ax, 22.1, 4.6, 5.1, 4.2, "ETL",
    "normalise.js\n  currency, dates,\n  text, validation\n\nroomTypeMap.js\n  alias table +\n  per-property\n  overrides\n\nrun.js\n  load, quarantine,\n  report", ETL, fs=7.2)

# --- tier 3: data
ax.add_patch(plt.Rectangle((0.4, 0.3), 27.2, 3.4, facecolor="#f7f9fb", edgecolor=LINE, lw=1.2, zorder=1))
ax.text(0.7, 3.46, "DATA  ·  PostgreSQL 16  ·  Render managed", fontsize=8.6, fontweight="bold", color=PG)
box(ax, 0.9, 0.6, 8.4, 2.6, "Canonical tables",
    "users · refresh_tokens\nproperties · room_types · rooms\nguests · bookings · reviews\nenquiries · media", PG, fs=7.4)
box(ax, 9.7, 0.6, 8.4, 2.6, "Quality and audit",
    "etl_batches · etl_issues\n  every rejected row, with\na reason and the raw row\nevent_log\nv_booking_nights (view)", PG, fs=7.4)
box(ax, 18.5, 0.6, 8.7, 2.6, "Integrity enforced in the database",
    "CHECK (check_out > check_in)\nUNIQUE (property_id, room_number)\n"
    "CHECK (rating BETWEEN 1 AND 5)\nUNIQUE lower(email) WHERE email IS NOT NULL\n"
    "FK constraints on every relationship", PG, fs=7.4)

# --- flows
arrow(ax, 14, 10.15, 14, 9.35, color=REACT, lw=2.4, label="HTTPS  JSON + JWT", ly=0.32)
arrow(ax, 14, 4.25, 14, 3.75, color=PG, lw=2.4, label="pg  parameterised SQL", ly=0.3)
arrow(ax, 24.6, 4.55, 22.0, 3.75, color=ETL, lw=1.8, ls="--")

# --- ops strip
ax.text(0.9, 9.72, "GitHub Actions CI: on every push — parse check, migrate against a Postgres service container, "
        "seed via ETL, 100 tests, web build, secret scan.",
        fontsize=7.4, color=OPS, style="italic")
fig.tight_layout()
fig.savefig("docs/diagrams/architecture.png", dpi=200, bbox_inches="tight")
plt.close(fig)

# ============================================================ fig 2: data pipeline
fig, ax = plt.subplots(figsize=(13.6, 4.2))
ax.set_xlim(0, 28); ax.set_ylim(0, 7.6); ax.axis("off")
ax.text(14, 10.0, "The data pipeline — from 14 messy exports to trustworthy numbers",
        ha="center", fontsize=13.5, fontweight="bold", color=INK)

stages = [
    (0.4, "RAW EXPORTS", OPS,
     "properties.csv\nroom_inventory.csv\nbookings_2026.csv\nguests.csv\nreviews.csv"),
    (5.8, "NORMALISE", ETL,
     "currency  INR / Rs / ₹ /\n          USD / usd / $\ndates     ISO and DD/MM/YYYY\ntext      trim, case, whitespace"),
    (11.2, "VALIDATE", ETL,
     "check_out > check_in\namount >= 0\ncurrency known\nproperty and guest known\nroom type resolvable"),
    (16.6, "QUARANTINE", "#b91c1c",
     "41 of 640 bookings\nrejected, each with a\ncode and the raw row\nkept in etl_issues"),
    (22.0, "LOAD + MEASURE", PG,
     "600 clean bookings\n→ occupancy\n→ ADR\n→ RevPAR"),
]
for x, title, color, body in stages:
    ax.add_patch(plt.Rectangle((x, 6.2), 4.9, 2.7, facecolor="#ffffff", edgecolor=color, lw=1.6, zorder=3))
    ax.add_patch(plt.Rectangle((x, 8.48), 4.9, 0.42, facecolor=color, edgecolor=color, lw=1.6, zorder=4))
    ax.text(x + 2.45, 8.69, title, ha="center", va="center", fontsize=8.4, fontweight="bold",
            color="white", zorder=5)
    ax.text(x + 0.2, 8.32, body, ha="left", va="top", fontsize=7.2, color=INK, zorder=5)
    if x < 22:
        arrow(ax, x + 4.95, 7.55, x + 5.35, 7.55, color=GREY, lw=2.0)

# the three named messes
ax.text(14, 5.55, "THE THREE MESSES THE BRIEF NAMED, AND WHAT EACH ONE COSTS IF HANDLED NAIVELY",
        ha="center", fontsize=9.0, fontweight="bold", color=INK)

messes = [
    (0.4, "Room types renamed across 14 properties",
     "Aliases: \"Deluxe\", \"DELUXE KING\", \"Superior\", \"Executive Room\", \"Premium\"…\n"
     "A fuzzy match merges \"Superior\" with \"Superior Deluxe\" and splits \"Deluxe Twin\"\n"
     "from \"Deluxe\". Worse, \"Superior\" is the PREMIER category at Malabar Hill.\n"
     "→ an explicit alias table with property-scoped overrides; unknowns quarantined"),
    (9.7, "Rates in INR and USD, sometimes mixed",
     "Currency appears as INR, Rs, ₹, USD, usd and $. One property alternates per row.\n"
     "Every booking is stored in INR with the original amount, original currency and\n"
     "the exact FX rate kept alongside, so any figure can be re-derived and audited.\n"
     "→ a conversion without its rate is unauditable, so the rate is stored too"),
    (18.9, "Check-out dates before check-in dates",
     "27 of 640 rows in the export have the dates reversed, and a handful are equal.\n"
     "Loading them would create negative-length stays that corrupt every occupancy\n"
     "figure downstream — silently, because the sum still looks plausible.\n"
     "→ rejected with CHECKOUT_NOT_AFTER_CHECKIN and a database CHECK as backstop"),
]
for x, title, body in messes:
    ax.add_patch(plt.Rectangle((x, 0.3), 8.9, 1.85, facecolor="#fbfcfd", edgecolor=LINE, lw=1.2, zorder=1))
    ax.text(x + 0.3, 1.92, title, fontsize=8.0, fontweight="bold", color="#b91c1c", va="top", zorder=3)
    ax.text(x + 0.3, 1.56, body, fontsize=7.0, color=INK, va="top", zorder=3)
fig.tight_layout()
fig.savefig("docs/diagrams/data-pipeline.png", dpi=200, bbox_inches="tight")
plt.close(fig)

print("diagrams written:", sorted(os.listdir("docs/diagrams")))
