
        //         case 0x00: noOp(); break; // NOP
        //         case 0x01: opLoad(&(state.rB), getU8(1)); opLoad(&(state.rC), getU8(2)); break; // LD BC, d16
        //         case 0x02: opLoad(fromRef(state.rBC), state.rA); break; // LD (BC), A
        //         case 0x03: opIncrement(&(state.rBC)); break; // INC BC
        //         case 0x04: opIncrement(&(state.rB)); break; // INC B
        //         case 0x05: opDecrement(&(state.rB)); break; // DEC B
        //         case 0x06: opLoad(&(state.rB), getU8(1)); break; // LD B, d8
        //         case 0x07: opShiftLeft!'7'(&(state.rA)); break; // RLCA
        //         case 0x08: opLoad(fromRef(getU8(1)), state.rS); opLoad(fromRef(getU8(2)), state.rP); break; // LD (a16), SP
        //         case 0x09: opAdd(&(state.rHL), &(state.rBC)); break; // ADD HL, BC
        //         case 0x0A: opLoad(&(state.rA), fromRef(state.rBC)); break; // LD A, (BC)
        //         case 0x0B: opDecrement(&(state.rBC)); break; // DEC BC
        //         case 0x0C: opIncrement(&(state.rC)); break; // INC C
        //         case 0x0D: opDecrement(&(state.rC)); break; // DEC C
        //         case 0x0E: opLoad(&(state.rC), getU8(1)); break; // LD C, d8
        //         case 0x0F: opShiftRight!'0'(&(state.rA)); break; // RRCA
        //         case 0x10: opStop(); break; // STOP
        //         case 0x11: opLoad(&(state.rDE), getU16()); break; // LD DE, d16
        //         case 0x12: opLoad(fromRef(state.rDE), state.rA); break; // LD (DE), A
        //         case 0x13: opIncrement(&(state.rDE)); break; // INC DE
        //         case 0x14: opIncrement(&(state.rD)); break; // INC D
        //         case 0x15: opDecrement(&(state.rD)); break; // DEC D
        //         case 0x16: opLoad(&(state.rD), getU8(1)); break; // LD D, d8
        //         case 0x17: opShiftLeft!'c'(&(state.rA), true); break; // RLA
        //         case 0x18: opJump(getOff8()); break; // JR s8
        //         case 0x19: opAdd(&(state.rHL), &(state.rDE)); break; // ADD HL, DE
        //         case 0x1A: opLoad(&(state.rA), fromRef(state.rDE)); break; // LD A, (DE)
        //         case 0x1B: opDecrement(&(state.rDE)); break; // DEC DE
        //         case 0x1C: opIncrement(&(state.rE)); break; // INC E
        //         case 0x1D: opDecrement(&(state.rE)); break; // DEC E
        //         case 0x1E: opLoad(&(state.rE), getU8(1)); break; // LD E, d8
        //         case 0x1F: opShiftRight!'c'(&(state.rA), true); break; // RRA
        //         case 0x20: !state.fZ ? opJump(getOff8()) : {}; break; // JR NZ, s8
        //         case 0x21: opLoad(&(state.rHL), getU16()); break; // LD HL, d16
        //         case 0x22: opLoad(fromRef(state.rHL), state.rA); break; // LD (HL+), A
        //         case 0x23: opIncrement(&(state.rHL)); break; // INC HL
        //         case 0x24: opIncrement(&(state.rH)); break; // INC H
        //         case 0x25: opDecrement(&(state.rH)); break; // DEC H
        //         case 0x26: opLoad(&(state.rH), getU8(1)); break; // LD H, d8
        //         case 0x27: opDecimal(); break; // DAA
        //         case 0x28: opJump(state.fZ, getOff8()); break; // JR Z, s8
        //         case 0x29: opAdd(&(state.rHL), &(state.rHL)); break; // ADD HL, HL
        //         case 0x2A: opLoad(&(state.rA), fromRef(state.rHL)); break; // LD A, (HL+)
        //         case 0x2B: opDecrement(&(state.rHL)); break; // DEC HL
        //         case 0x2C: opIncrement(&(state.rL)); break; // INC L
        //         case 0x2D: opDecrement(&(state.rL)); break; // DEC L
        //         case 0x2E: opLoad(&(state.rL), getU8(1)); break; // LD L, d8
        //         case 0x2F: opComplement(); break; // CPL
        //         case 0x30: !state.fC ? opJump(getOff8()) : {}; break; // JR NC, s8
        //         case 0x31: opLoad(&(state.rSP), getU16()); break; // LD SP, d16
        //         case 0x32: opLoad(fromRef(state.rHL), state.rA); break; // LD (HL-), A
        //         case 0x33: opIncrement(&(state.rSP)); break; // INC SP
        //         case 0x34: opIncrement(fromRef(state.rHL)); break; // INC (HL)
        //         case 0x35: opDecrement(fromRef(state.rHL)); break; // DEC (HL)
        //         case 0x36: opLoad(fromRef(state.rHL), getU8(1)); break; // LD (HL), d8
        //         case 0x37: opCarry(true); break; // SCF
        //         case 0x38: state.fC ? opJump(getOff8()) : {}; break; // JR C, s8
        //         case 0x39: opAdd(&(state.rHL), &(state.rSP)); break; // ADD HL, SP
        //         case 0x3A: opLoad(&(state.rA), fromRef(state.rHL)); break; // LD A, (HL-)
        //         case 0x3B: opDecrement(&(state.rSP)); break; // DEC SP
        //         case 0x3C: opIncrement(&(state.rA)); break; // INC A
        //         case 0x3D: opDecrement(&(state.rA)); break; // DEC A
        //         case 0x3E: opLoad(&(state.rA), getU8(1)); break; // LD A, d8
        //         case 0x3F: opCarry(!state.fC); break; // CCF
        //         case 0x40: opLoad(&(state.rB), state.rB); break; // LD B, B
        //         case 0x41: opLoad(&(state.rB), state.rC); break; // LD B, C
        //         case 0x42: opLoad(&(state.rB), state.rD); break; // LD B, D
        //         case 0x43: opLoad(&(state.rB), state.rE); break; // LD B, E
        //         case 0x44: opLoad(&(state.rB), state.rH); break; // LD B, H
        //         case 0x45: opLoad(&(state.rB), state.rL); break; // LD B, L
        //         case 0x46: opLoad(&(state.rB), fromRef(state.rHL)); break; // LD B, (HL)
        //         case 0x47: opLoad(&(state.rB), state.rA); break; // LD B, A
        //         case 0x48: opLoad(&(state.rC), state.rB); break; // LD C, B
        //         case 0x49: opLoad(&(state.rC), state.rC); break; // LD C, C
        //         case 0x4A: opLoad(&(state.rC), state.rD); break; // LD C, D
        //         case 0x4B: opLoad(&(state.rC), state.rE); break; // LD C, E
        //         case 0x4C: opLoad(&(state.rC), state.rH); break; // LD C, H
        //         case 0x4D: opLoad(&(state.rC), state.rL); break; // LD C, L
        //         case 0x4E: opLoad(&(state.rC), fromRef(state.rHL)); break; // LD C, (HL)
        //         case 0x4F: opLoad(&(state.rC), state.rA); break; // LD C, A
        //         case 0x50: opLoad(&(state.rD), state.rB); break; // LD D, B
        //         case 0x51: opLoad(&(state.rD), state.rC); break; // LD D, C
        //         case 0x52: opLoad(&(state.rD), state.rD); break; // LD D, D
        //         case 0x53: opLoad(&(state.rD), state.rE); break; // LD D, E
        //         case 0x54: opLoad(&(state.rD), state.rH); break; // LD D, H
        //         case 0x55: opLoad(&(state.rD), state.rL); break; // LD D, L
        //         case 0x56: opLoad(&(state.rD), fromRef(state.rHL)); break; // LD D, (HL)
        //         case 0x57: opLoad(&(state.rD), state.rA); break; // LD D, A
        //         case 0x58: opLoad(&(state.rE), state.rB); break; // LD E, B
        //         case 0x59: opLoad(&(state.rE), state.rC); break; // LD E, C
        //         case 0x5A: opLoad(&(state.rE), state.rD); break; // LD E, D
        //         case 0x5B: opLoad(&(state.rE), state.rE); break; // LD E, E
        //         case 0x5C: opLoad(&(state.rE), state.rH); break; // LD E, H
        //         case 0x5D: opLoad(&(state.rE), state.rL); break; // LD E, L
        //         case 0x5E: opLoad(&(state.rE), fromRef(state.rHL)); break; // LD E, (HL)
        //         case 0x5F: opLoad(&(state.rE), state.rA); break; // LD E, A
        //         case 0x60: opLoad(&(state.rH), state.rB); break; // LD H, B
        //         case 0x61: opLoad(&(state.rH), state.rC); break; // LD H, C
        //         case 0x62: opLoad(&(state.rH), state.rD); break; // LD H, D
        //         case 0x63: opLoad(&(state.rH), state.rE); break; // LD H, E
        //         case 0x64: opLoad(&(state.rH), state.rH); break; // LD H, H
        //         case 0x65: opLoad(&(state.rH), state.rL); break; // LD H, L
        //         case 0x66: opLoad(&(state.rH), fromRef(state.rHL)); break; // LD H, (HL)
        //         case 0x67: opLoad(&(state.rH), state.rA); break; // LD H, A
        //         case 0x68: opLoad(&(state.rL), state.rB); break; // LD L, B
        //         case 0x69: opLoad(&(state.rL), state.rC); break; // LD L, C
        //         case 0x6A: opLoad(&(state.rL), state.rD); break; // LD L, D
        //         case 0x6B: opLoad(&(state.rL), state.rE); break; // LD L, E
        //         case 0x6C: opLoad(&(state.rL), state.rH); break; // LD L, H
        //         case 0x6D: opLoad(&(state.rL), state.rL); break; // LD L, L
        //         case 0x6E: opLoad(&(state.rL), fromRef(state.rHL)); break; // LD L, (HL)
        //         case 0x6F: opLoad(&(state.rL), state.rA); break; // LD L, A
        //         case 0x70: opLoad(fromRef(state.rHL), state.rB); break; // LD (HL), B
        //         case 0x71: opLoad(fromRef(state.rHL), state.rC); break; // LD (HL), C
        //         case 0x72: opLoad(fromRef(state.rHL), state.rD); break; // LD (HL), D
        //         case 0x73: opLoad(fromRef(state.rHL), state.rE); break; // LD (HL), E
        //         case 0x74: opLoad(fromRef(state.rHL), state.rH); break; // LD (HL), H
        //         case 0x75: opLoad(fromRef(state.rHL), state.rL); break; // LD (HL), L
        //         case 0x76: opHalt(); break; // HALT
        //         case 0x77: opLoad(fromRef(state.rHL), state.rA); break; // LD (HL), A
        //         case 0x78: opLoad(&(state.rA), state.rB); break; // LD A, B
        //         case 0x79: opLoad(&(state.rA), state.rC); break; // LD A, C
        //         case 0x7A: opLoad(&(state.rA), state.rD); break; // LD A, D
        //         case 0x7B: opLoad(&(state.rA), state.rE); break; // LD A, E
        //         case 0x7C: opLoad(&(state.rA), state.rH); break; // LD A, H
        //         case 0x7D: opLoad(&(state.rA), state.rL); break; // LD A, L
        //         case 0x7E: opLoad(&(state.rA), fromRef(state.rHL)); break; // LD A, (HL)
        //         case 0x7F: opLoad(&(state.rA), state.rA); break; // LD A, A
        //         case 0x80: opAdd(&(state.rA), &(state.rB)); break; // ADD A, B
        //         case 0x81: opAdd(&(state.rA), &(state.rC)); break; // ADD A, C
        //         case 0x82: opAdd(&(state.rA), &(state.rD)); break; // ADD A, D
        //         case 0x83: opAdd(&(state.rA), &(state.rE)); break; // ADD A, E
        //         case 0x84: opAdd(&(state.rA), &(state.rH)); break; // ADD A, H
        //         case 0x85: opAdd(&(state.rA), &(state.rL)); break; // ADD A, L
        //         case 0x86: opAdd(&(state.rA), fromRef(state.rHL)); break; // ADD A, (HL)
        //         case 0x87: opAdd(&(state.rA), &(state.rA)); break; // ADD A, A
        //         case 0x88: opAddCarry(&(state.rA), &(state.rB)); break; // ADC A, B
        //         case 0x89: opAddCarry(&(state.rA), &(state.rC)); break; // ADC A, C
        //         case 0x8A: opAddCarry(&(state.rA), &(state.rD)); break; // ADC A, D
        //         case 0x8B: opAddCarry(&(state.rA), &(state.rE)); break; // ADC A, E
        //         case 0x8C: opAddCarry(&(state.rA), &(state.rH)); break; // ADC A, H
        //         case 0x8D: opAddCarry(&(state.rA), &(state.rL)); break; // ADC A, L
        //         case 0x8E: opAddCarry(&(state.rA), fromRef(state.rHL)); break; // ADC A, (HL)
        //         case 0x8F: opAddCarry(&(state.rA), &(state.rA)); break; // ADC A, A
        //         case 0x90: opSub(&(state.rB)); break; // SUB B
        //         case 0x91: opSub(&(state.rC)); break; // SUB C
        //         case 0x92: opSub(&(state.rD)); break; // SUB D
        //         case 0x93: opSub(&(state.rE)); break; // SUB E
        //         case 0x94: opSub(&(state.rH)); break; // SUB H
        //         case 0x95: opSub(&(state.rL)); break; // SUB L
        //         case 0x96: opSub(fromRef(state.rHL)); break; // SUB (HL)
        //         case 0x97: opSub(&(state.rA)); break; // SUB A
        //         case 0x98: opSubCarry(&(state.rA), &(state.rB)); break; // SBC A, B
        //         case 0x99: opSubCarry(&(state.rA), &(state.rC)); break; // SBC A, C
        //         case 0x9A: opSubCarry(&(state.rA), &(state.rD)); break; // SBC A, D
        //         case 0x9B: opSubCarry(&(state.rA), &(state.rE)); break; // SBC A, E
        //         case 0x9C: opSubCarry(&(state.rA), &(state.rH)); break; // SBC A, H
        //         case 0x9D: opSubCarry(&(state.rA), &(state.rL)); break; // SBC A, L
        //         case 0x9E: opSubCarry(&(state.rA), fromRef(state.rHL)); break; // SBC A, (HL)
        //         case 0x9F: opSubCarry(&(state.rA), &(state.rA)); break; // SBC A, A
        //         case 0xA0: opAnd(&(state.rB)); break; // AND B
        //         case 0xA1: opAnd(&(state.rC)); break; // AND C
        //         case 0xA2: opAnd(&(state.rD)); break; // AND D
        //         case 0xA3: opAnd(&(state.rE)); break; // AND E
        //         case 0xA4: opAnd(&(state.rH)); break; // AND H
        //         case 0xA5: opAnd(&(state.rL)); break; // AND L
        //         case 0xA6: opAnd(fromRef(state.rHL)); break; // AND (HL)
        //         case 0xA7: opAnd(&(state.rA)); break; // AND A
        //         case 0xA8: opXor(&(state.rB)); break; // XOR B
        //         case 0xA9: opXor(&(state.rC)); break; // XOR C
        //         case 0xAA: opXor(&(state.rD)); break; // XOR D
        //         case 0xAB: opXor(&(state.rE)); break; // XOR E
        //         case 0xAC: opXor(&(state.rH)); break; // XOR H
        //         case 0xAD: opXor(&(state.rL)); break; // XOR L
        //         case 0xAE: opXor(fromRef(state.rHL)); break; // XOR (HL)
        //         case 0xAF: opXor(&(state.rA)); break; // XOR A
        //         case 0xB0: opOr(&(state.rB)); break; // OR B
        //         case 0xB1: opOr(&(state.rC)); break; // OR C
        //         case 0xB2: opOr(&(state.rD)); break; // OR D
        //         case 0xB3: opOr(&(state.rE)); break; // OR E
        //         case 0xB4: opOr(&(state.rH)); break; // OR H
        //         case 0xB5: opOr(&(state.rL)); break; // OR L
        //         case 0xB6: opOr(fromRef(state.rHL)); break; // OR (HL)
        //         case 0xB7: opOr(&(state.rA)); break; // OR A
        //         case 0xB8: opBitCompare(&(state.rB)); break; // CP B
        //         case 0xB9: opBitCompare(&(state.rC)); break; // CP C
        //         case 0xBA: opBitCompare(&(state.rD)); break; // CP D
        //         case 0xBB: opBitCompare(&(state.rE)); break; // CP E
        //         case 0xBC: opBitCompare(&(state.rH)); break; // CP H
        //         case 0xBD: opBitCompare(&(state.rL)); break; // CP L
        //         case 0xBE: opBitCompare(fromRef(state.rHL)); break; // CP (HL)
        //         case 0xBF: opBitCompare(&(state.rA)); break; // CP A
        //         case 0xC0: !state.fZ ? opReturn() : {}; break; // RET NZ
        //         case 0xC1: opPop(&(state.rBC)); break; // POP BC
        //         case 0xC2: !state.fZ ? opJump(getU16()) : {}; break; // JP NZ, a16
        //         case 0xC3: opJump(getU16()); break; // JP a16
        //         case 0xC4: !state.fZ ? opCallSubroutine(getU16()) : {}; break; // CALL NZ, a16
        //         case 0xC5: opPush(&(state.rBC)); break; // PUSH BC
        //         case 0xC6: opAdd(&(state.rA), getU8(1)); break; // ADD A, d8
        //         case 0xC7: opRestart(data); break; // RST 0
        //         case 0xC8: state.fZ ? opReturn() : {}; break; // RET Z
        //         case 0xC9: opReturn(); break; // RET
        //         case 0xCA: state.fZ ? opJump(getU16()) : {}; break; // JP Z, a16
        //         case 0xCB: op0xCB(getU8(1));
        //         case 0xCC: state.fZ ? opCallSubroutine(getU16()) : {}; break; // CALL Z, a16
        //         case 0xCD: opCallSubroutine(getU16()); break; // CALL a16
        //         case 0xCE: opAddCarry(&(state.rA), getU8(1)); break; // ADC A, d8
        //         case 0xCF: opRestart(data); break; // RST 1
        //         case 0xD0: !state.fC ? opReturn() : {}; break; // RET NC
        //         case 0xD1: opPop(&(state.rDE)); break; // POP DE
        //         case 0xD2: !state.fC ? opJump(getU16()) : {}; break; // JP NC, a16
        //         case 0xD3: assert(0); break; // #VALUE!
        //         case 0xD4: !state.fC ? opCallSubroutine(getU16()) : {}; break; // CALL NC, a16
        //         case 0xD5: opPush(&(state.rDE)); break; // PUSH DE
        //         case 0xD6: opSub(getU8(1)); break; // SUB d8
        //         case 0xD7: opRestart(data); break; // RST 2
        //         case 0xD8: state.fC ? opReturn() : {}; break; // RET C
        //         case 0xD9: opEnableIntr(); opReturn(); break; // RETI
        //         case 0xDA: state.fC ? opJump(getU16()) : {}; break; // JP C, a16
        //         case 0xDB: assert(0); break; // #VALUE!
        //         case 0xDC: state.fC ? opCallSubroutine(getU16()) : {}; break; // CALL C, a16
        //         case 0xDD: assert(0); break; // #VALUE!
        //         case 0xDE: opSubCarry(&(state.rA), getU8(1)); break; // SBC A, d8
        //         case 0xDF: opRestart(data); break; // RST 3
        //         case 0xE0: opLoad(Ref, state.rA); break; // LD (a8), A
        //         case 0xE1: opPop(&(state.rHL)); break; // POP HL
        //         case 0xE2: opLoad(&(state.rC), state.rA); break; // LD (C), A
        //         case 0xE3: assert(0); break; // #VALUE!
        //         case 0xE4: assert(0); break; // #VALUE!
        //         case 0xE5: opPush(&(state.rHL)); break; // PUSH HL
        //         case 0xE6: opAnd(getU8(1)); break; // AND d8
        //         case 0xE7: opRestart(data); break; // RST 4
        //         case 0xE8: opAdd(&(state.rSP), getOff8()); break; // ADD SP, s8
        //         case 0xE9: opJump(&(state.rHL)); break; // JP HL
        //         case 0xEA: opLoad(fromRef(getU16()), state.rA); break; // LD (a16), A
        //         case 0xEB: assert(0); break; // #VALUE!
        //         case 0xEC: assert(0); break; // #VALUE!
        //         case 0xED: assert(0); break; // #VALUE!
        //         case 0xEE: opXor(getU8(1)); break; // XOR d8
        //         case 0xEF: opRestart(data); break; // RST 5
        //         case 0xF0: opLoad(&(state.rA), Ref); break; // LD A, (a8)
        //         case 0xF1: opPop(&(state.rAF)); break; // POP AF
        //         case 0xF2: opLoad(&(state.rA), state.rC); break; // LD A, (C)
        //         case 0xF3: opDisableIntr(); break; // DI
        //         case 0xF4: break; // #VALUE!
        //         case 0xF5: opPush(&(state.rAF)); break; // PUSH AF
        //         case 0xF6: opOr(getU8(1)); break; // OR d8
        //         case 0xF7: opRestart(data); break; // RST 6
        //         case 0xF8: opLoadAddOffput(&(state.rHL), &(state.rSP), getOff8(1)); break; // LD HL, SP+s8
        //         case 0xF9: opLoad(&(state.rS), state.rH); opLoad(&(state.rP), &(state.rL)); break; // LD SP, HL
        //         case 0xFA: opLoad(&(state.rA), fromRef(getU16())); break; // LD A, (a16)
        //         case 0xFB: opEnableIntr(); break; // EI
        //         case 0xFC: break; // #VALUE!
        //         case 0xFD: break; // #VALUE!
        //         case 0xFE: opBitCompare(getU8(1)); break; // CP d8
        //         case 0xFF: opRestart(data); break; // RST 7
        // }