"""Didaktische Sollwerte des MCT1-Kursvertrags.

Lehrbeispiele, keine Messwerte. Aufruf: python beispiele/sollwerte.py
"""

def sext(value: int, bits: int) -> int:
    value &= (1 << bits) - 1
    if value & (1 << (bits - 1)):
        value -= 1 << bits
    return value


def srai32(value: int, shamt: int) -> int:
    value &= 0xFFFFFFFF
    if value & 0x80000000:
        value -= 0x100000000
    return value >> shamt


def encode_r(funct7: int, rs2: int, rs1: int, funct3: int, rd: int, opcode: int) -> int:
    return (
        (funct7 << 25)
        | (rs2 << 20)
        | (rs1 << 15)
        | (funct3 << 12)
        | (rd << 7)
        | opcode
    )


def main() -> None:
    add_x9 = encode_r(0b0000000, 21, 20, 0b000, 9, 0b0110011)
    assert add_x9 == 0x015A04B3, hex(add_x9)

    # t0=5, t1=6, t2=7
    add_t = encode_r(0b0000000, 7, 6, 0b000, 5, 0b0110011)
    assert add_t == 0x007302B3, hex(add_t)

    assert sext(0x80, 8) & 0xFFFFFFFF == 0xFFFFFF80
    assert 0x80 == 0x00000080

    assert srai32(-3, 1) == -2
    # C-Integerdivision rundet gegen 0 (ILP32-Lehrannahme zu N1570 6.5.5)
    assert int(-3 / 2) == -1

    assert sum([10, 20, 30, 40, 50]) == 150

    data = [99, 88]
    assert data[1] == 88

    assert 50 + 100 == 150
    assert 150 - 50 == 100
    assert 42 + 42 == 84

    if_d, id_d, ex_d, mem_d, wb_d = 200, 100, 150, 250, 100
    reg_overhead = 20
    single = if_d + id_d + ex_d + mem_d + wb_d + reg_overhead
    # fünf Registerübergänge im Pipeline-Pfad einer Instruktion: 5 * 20 ps
    # plus die längste reine Stufe (MEM = 250 ps) ergibt den Pipeline-Takt 270 ps
    # laut Kursvertrag: „je Registerübergang zusammen 20 ps“ und Pipeline-Takt 270 ps.
    # 250 + 20 = 270. Der Single-Cycle-Takt ist die Summe der Stufen plus ein
    # Registerübergang am Ende: 800 + 20 = 820.
    assert single == 820
    pipe_cycle = mem_d + reg_overhead
    assert pipe_cycle == 270
    n = 20
    single_total = n * single
    pipe_total = (n + 5 - 1) * pipe_cycle
    speedup = single_total / pipe_total
    assert abs(speedup - 2.53) < 0.02, speedup

    # Code-Schloss: je ein Druckereignis, Halten zählt nicht erneut.
    state = 0
    sequence = ["UP", "hold", "release", "DOWN", "hold", "release", "RIGHT", "release"]
    expect = {
        ("S0", "UP"): "S1",
        ("S1", "DOWN"): "S2",
        ("S2", "RIGHT"): "S3",
    }
    names = ["S0", "S1", "S2", "S3"]
    for event in sequence:
        if event in ("hold", "release"):
            continue
        key = (names[state], event)
        assert key in expect, key
        state = names.index(expect[key])
    assert names[state] == "S3"

    print("Sollwerte ok")
    print(f"add x9,x20,x21 = {add_x9:#010x}")
    print(f"add t0,t1,t2   = {add_t:#010x}")
    print(f"N=20 Speedup   = {speedup:.3f} ({single_total} ps / {pipe_total} ps)")


if __name__ == "__main__":
    main()
