# =========================
# diagrams_genotype_encoding.py
# =========================
import math
import matplotlib.pyplot as plt
from matplotlib.patches import Rectangle, FancyArrow, FancyArrowPatch, ConnectionPatch
from matplotlib.lines import Line2D

# --------- Shared helpers ---------
def add_box(ax, xy, w, h, label=None, lw=1.2):
    x, y = xy
    rect = Rectangle((x, y), w, h, fill=False, linewidth=lw)
    ax.add_patch(rect)
    if label is not None:
        ax.text(x + w/2, y + h/2, label, ha='center', va='center')
    return rect

def add_label(ax, xy, text, ha='left', va='center', fontsize=10):
    ax.text(xy[0], xy[1], text, ha=ha, va=va, fontsize=fontsize)

# --------- Figure 1: Genotype Layout ---------
def draw_genotype_layout():
    fig, ax = plt.subplots(figsize=(9, 6))
    ax.set_xlim(0, 18)
    ax.set_ylim(0, 12)
    ax.axis('off')

    # Left column: 16-bit mask (bit0 at top, bit15 at bottom)
    x0, y0 = 1, 1
    cell_w, cell_h = 1.0, 0.5
    add_label(ax, (x0, y0 + 16*cell_h + 0.6), "16-bit Truth Table Mask\n(row 0 = bit 0 (LSB), row 15 = bit 15 (MSB))", ha='center', va='bottom', fontsize=11)
    for i in range(16):
        # bit i row; row 0 at top
        y = y0 + (16-1 - i) * cell_h  # draw visually top->bottom with labels left->right
        rect = Rectangle((x0 - cell_w/2, y), cell_w, cell_h, fill=False, linewidth=1.1)
        ax.add_patch(rect)
        ax.text(x0 - cell_w, y + cell_h/2, f"row {i:>2}", ha='right', va='center', fontsize=9)
        ax.text(x0 + cell_w/2, y + cell_h/2, f"bit {i}", ha='center', va='center', fontsize=9)

    # Right side: four input blocks, each with N S E W R
    block_x = 4
    block_y = 8.6
    block_w = 12
    block_h = 2.0
    gap = 0.6
    labels = ["Input 3", "Input 2", "Input 1", "Input 0"]
    fields = ["N", "S", "E", "W", "R"]

    for k, name in enumerate(labels):
        y = block_y - k * (block_h + gap)
        add_label(ax, (block_x, y + block_h + 0.35), name, fontsize=11)
        # outer box
        add_box(ax, (block_x, y), block_w, block_h)
        # 5 equal fields
        fw = block_w / 5.0
        for j, fld in enumerate(fields):
            add_box(ax, (block_x + j*fw, y), fw, block_h, label=fld)
        # Direction note
        ax.text(block_x + block_w + 0.4, y + block_h/2,
                "argmax(N,S,E,W)\nR rounded", ha='left', va='center', fontsize=9)

    # Caption
    ax.text(0.5, 0.04,
            "Figure 1: Genotype layout — one 16-bit mask plus 4×[N,S,E,W,R] float groups.",
            transform=ax.transAxes, ha='left', va='center', fontsize=10)

    fig.tight_layout()
    fig.savefig("genotype_layout.png", dpi=200)

# --------- Figure 2: Node Schematic ---------
def draw_node_schematic():
    fig, ax = plt.subplots(figsize=(9, 6))
    ax.set_xlim(-1, 18)
    ax.set_ylim(-2, 12)
    ax.set_aspect('equal')
    ax.axis('off')

    # Grid depiction (thin)
    W, H = 12, 8
    grid_x0, grid_y0 = 2, 2
    for gx in range(W+1):
        ax.add_line(Line2D([grid_x0+gx, grid_x0+gx], [grid_y0, grid_y0+H], linewidth=0.4))
    for gy in range(H+1):
        ax.add_line(Line2D([grid_x0, grid_x0+W], [grid_y0+gy, grid_y0+gy], linewidth=0.4))

    # Node location
    nx, ny = grid_x0 + 6, grid_y0 + 4
    node = Rectangle((nx-0.4, ny-0.4), 0.8, 0.8, fill=False, linewidth=1.5)
    ax.add_patch(node)
    ax.text(nx, ny, "Node\n(x,y)", ha='center', va='center', fontsize=9)

    # Arrows for N,S,E,W (conceptual input resolution)
    arrows = {
        'N': (0, 1.8),
        'S': (0, -1.8),
        'E': (1.8, 0),
        'W': (-1.8, 0),
    }
    for name, (dx, dy) in arrows.items():
        ax.add_patch(FancyArrow(nx, ny, dx, dy, width=0.03, length_includes_head=True))
        ax.text(nx + dx*1.15, ny + dy*1.15, name, ha='center', va='center', fontsize=9)

    # Rounding note
    ax.text(nx + 2.6, ny + 2.6, "R → round(R)", fontsize=9)
    ax.add_patch(FancyArrow(nx+1.9, ny+2.2, 0.5, 0.3, width=0.02, length_includes_head=True))

    # Boundary rule annotations
    # Left side (x < 1) => GLOBAL input
    ax.text(grid_x0-0.8, grid_y0+H/2, "x < 1 ⇒ GLOBAL input\n(index = y mod H)", ha='right', va='center', fontsize=9)
    ax.add_line(Line2D([grid_x0, grid_x0], [grid_y0-0.3, grid_y0+H+0.3], linewidth=1.0))
    ax.text(grid_x0-0.2, grid_y0+H+0.6, "Left boundary", ha='center', va='center', fontsize=9)

    # Right side (x ≥ W) => tie low
    ax.text(grid_x0+W+0.8, grid_y0+H/2, "x ≥ W ⇒ tie to 0", ha='left', va='center', fontsize=9)
    ax.add_line(Line2D([grid_x0+W, grid_x0+W], [grid_y0-0.3, grid_y0+H+0.3], linewidth=1.0))
    ax.text(grid_x0+W, grid_y0+H+0.6, "Right boundary", ha='center', va='center', fontsize=9)

    # Y wrapping note
    ax.text(grid_x0+W/2, grid_y0-0.9, "Y wraps: y ← y mod H", ha='center', va='center', fontsize=9)

    # LUT inset (OR-of-active-rows)
    inset_x, inset_y = 15.0, 7.8
    add_box(ax, (inset_x-1.2, inset_y-3.8), 3.0, 4.6)
    ax.text(inset_x+0.3, inset_y, "4-input LUT\nmask[15:0]\nOR of matching\nactive rows",
            ha='center', va='center', fontsize=9)

    # Caption
    ax.text(0.02, 0.04,
            "Figure 2: Node schematic — argmax selects direction, R is rounded, "
            "Y wraps, left ⇒ GLOBAL input, right ⇒ 0, otherwise internal node.",
            transform=ax.transAxes, ha='left', va='center', fontsize=10)

    fig.tight_layout()
    fig.savefig("node_schematic.png", dpi=200)

if __name__ == "__main__":
    draw_genotype_layout()
    draw_node_schematic()
    print("Wrote: genotype_layout.png, node_schematic.png")
