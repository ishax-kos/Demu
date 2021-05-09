// {
//             case 0x00: opNOP(); break; /// NOP
// 			case 0x01: opLD_reg16_u16(Reg16.BC); break; /// LD BC, d16
// 			case 0x02: opLD_refReg_reg8(Reg16.BC, Reg8.A); break; /// LD (BC), A
// 			case 0x03: opINC_reg16(Reg16.BC); break; /// INC BC
// 			case 0x04: opINC_reg8(Reg8.B); break; /// INC B
// 			case 0x05: opDEC_reg8(Reg8.B); break; /// DEC B
// 			case 0x06: opLD_reg8_u8(Reg8.B); break; /// LD B, d8
// 			case 0x07: opRLCA(); break; /// RLCA
// 			case 0x08: opLD_ref16_SP(); break; /// LD (a16), SP
// 			case 0x09: opADD_reg16_reg16(Reg16.HL, Reg16.BC); break; /// ADD HL, BC
// 			case 0x0A: opLD_reg8_refReg(Reg8.A, Reg16.BC); break; /// LD A, (BC)
// 			case 0x0B: opDEC_reg16(Reg16.BC); break; /// DEC BC
// 			case 0x0C: opINC_reg8(Reg8.C); break; /// INC C
// 			case 0x0D: opDEC_reg8(Reg8.C); break; /// DEC C
// 			case 0x0E: opLD_reg8_u8(Reg8.C); break; /// LD C, d8
// 			case 0x0F: opRRCA(); break; /// RRCA
// 			case 0x10: opSTOP(); break; /// STOP
// 			case 0x11: opLD_reg16_u16(Reg16.DE); break; /// LD DE, d16
// 			case 0x12: opLD_refReg_reg8(Reg16.DE, Reg8.A); break; /// LD (DE), A
// 			case 0x13: opINC_reg16(Reg16.DE); break; /// INC DE
// 			case 0x14: opINC_reg8(Reg8.D); break; /// INC D
// 			case 0x15: opDEC_reg8(Reg8.D); break; /// DEC D
// 			case 0x16: opLD_reg8_u8(Reg8.D); break; /// LD D, d8
// 			case 0x17: opRLA(); break; /// RLA
// 			case 0x18: opJR_off8(); break; /// JR s8
// 			case 0x19: opADD_reg16_reg16(Reg16.HL, Reg16.DE); break; /// ADD HL, DE
// 			case 0x1A: opLD_reg8_refReg(Reg8.A, Reg16.DE); break; /// LD A, (DE)
// 			case 0x1B: opDEC_reg16(Reg16.DE); break; /// DEC DE
// 			case 0x1C: opINC_reg8(Reg8.E); break; /// INC E
// 			case 0x1D: opDEC_reg8(Reg8.E); break; /// DEC E
// 			case 0x1E: opLD_reg8_u8(Reg8.E); break; /// LD E, d8
// 			case 0x1F: opRRA(); break; /// RRA
// 			case 0x20: opJR_if_off8(Flag.NZ); break; /// JR NZ, s8
// 			case 0x21: opLD_reg16_u16(Reg16.HL); break; /// LD HL, d16
// 			case 0x22: opLD_refHL_inc_reg8(Reg16.HL, Reg8.A); break; /// LD (HL+), A
// 			case 0x23: opINC_reg16(Reg16.HL); break; /// INC HL
// 			case 0x24: opINC_reg8(Reg8.H); break; /// INC H
// 			case 0x25: opDEC_reg8(Reg8.H); break; /// DEC H
// 			case 0x26: opLD_reg8_u8(Reg8.H); break; /// LD H, d8
// 			case 0x27: opDAA(); break; /// DAA
// 			case 0x28: opJR_if_off8(Flag.Z); break; /// JR Z, s8
// 			case 0x29: opADD_reg16_reg16(Reg16.HL, Reg16.HL); break; /// ADD HL, HL
// 			case 0x2A: opLD_reg8_refHL_inc(Reg8.A, Reg16.HL); break; /// LD A, (HL+)
// 			case 0x2B: opDEC_reg16(Reg16.HL); break; /// DEC HL
// 			case 0x2C: opINC_reg8(Reg8.L); break; /// INC L
// 			case 0x2D: opDEC_reg8(Reg8.L); break; /// DEC L
// 			case 0x2E: opLD_reg8_u8(Reg8.L); break; /// LD L, d8
// 			case 0x2F: opCPL(); break; /// CPL
// 			case 0x30: opJR_if_off8(Flag.NC); break; /// JR NC, s8
// 			case 0x31: opLD_SP_u16(); break; /// LD SP, d16
// 			case 0x32: opLD_refHL_dec_reg8(Reg16.HL, Reg8.A); break; /// LD (HL-), A
// 			case 0x33: opINC_SP(); break; /// INC SP
// 			case 0x34: opINC_refReg(Reg16.HL); break; /// INC (HL)
// 			case 0x35: opDEC_refReg(Reg16.HL); break; /// DEC (HL)
// 			case 0x36: opLD_refReg_u8(Reg16.HL); break; /// LD (HL), d8
// 			case 0x37: opSCF(); break; /// SCF
// 			case 0x38: opJR_if_off8(Flag.Cy); break; /// JR Cy, s8
// 			case 0x39: opADD_reg16_SP(Reg16.HL); break; /// ADD HL, SP
// 			case 0x3A: opLD_reg8_refHL_dec(Reg8.A, Reg16.HL); break; /// LD A, (HL-)
// 			case 0x3B: opDEC_SP(); break; /// DEC SP
// 			case 0x3C: opINC_reg8(Reg8.A); break; /// INC A
// 			case 0x3D: opDEC_reg8(Reg8.A); break; /// DEC A
// 			case 0x3E: opLD_reg8_u8(Reg8.A); break; /// LD A, d8
// 			case 0x3F: opCCF(); break; /// CCF
// 			case 0x40: opLD_reg8_reg8(Reg8.B, Reg8.B); break; /// LD B, B
// 			case 0x41: opLD_reg8_reg8(Reg8.B, Reg8.C); break; /// LD B, C
// 			case 0x42: opLD_reg8_reg8(Reg8.B, Reg8.D); break; /// LD B, D
// 			case 0x43: opLD_reg8_reg8(Reg8.B, Reg8.E); break; /// LD B, E
// 			case 0x44: opLD_reg8_reg8(Reg8.B, Reg8.H); break; /// LD B, H
// 			case 0x45: opLD_reg8_reg8(Reg8.B, Reg8.L); break; /// LD B, L
// 			case 0x46: opLD_reg8_refReg(Reg8.B, Reg16.HL); break; /// LD B, (HL)
// 			case 0x47: opLD_reg8_reg8(Reg8.B, Reg8.A); break; /// LD B, A
// 			case 0x48: opLD_reg8_reg8(Reg8.C, Reg8.B); break; /// LD C, B
// 			case 0x49: opLD_reg8_reg8(Reg8.C, Reg8.C); break; /// LD C, C
// 			case 0x4A: opLD_reg8_reg8(Reg8.C, Reg8.D); break; /// LD C, D
// 			case 0x4B: opLD_reg8_reg8(Reg8.C, Reg8.E); break; /// LD C, E
// 			case 0x4C: opLD_reg8_reg8(Reg8.C, Reg8.H); break; /// LD C, H
// 			case 0x4D: opLD_reg8_reg8(Reg8.C, Reg8.L); break; /// LD C, L
// 			case 0x4E: opLD_reg8_refReg(Reg8.C, Reg16.HL); break; /// LD C, (HL)
// 			case 0x4F: opLD_reg8_reg8(Reg8.C, Reg8.A); break; /// LD C, A
// 			case 0x50: opLD_reg8_reg8(Reg8.D, Reg8.B); break; /// LD D, B
// 			case 0x51: opLD_reg8_reg8(Reg8.D, Reg8.C); break; /// LD D, C
// 			case 0x52: opLD_reg8_reg8(Reg8.D, Reg8.D); break; /// LD D, D
// 			case 0x53: opLD_reg8_reg8(Reg8.D, Reg8.E); break; /// LD D, E
// 			case 0x54: opLD_reg8_reg8(Reg8.D, Reg8.H); break; /// LD D, H
// 			case 0x55: opLD_reg8_reg8(Reg8.D, Reg8.L); break; /// LD D, L
// 			case 0x56: opLD_reg8_refReg(Reg8.D, Reg16.HL); break; /// LD D, (HL)
// 			case 0x57: opLD_reg8_reg8(Reg8.D, Reg8.A); break; /// LD D, A
// 			case 0x58: opLD_reg8_reg8(Reg8.E, Reg8.B); break; /// LD E, B
// 			case 0x59: opLD_reg8_reg8(Reg8.E, Reg8.C); break; /// LD E, C
// 			case 0x5A: opLD_reg8_reg8(Reg8.E, Reg8.D); break; /// LD E, D
// 			case 0x5B: opLD_reg8_reg8(Reg8.E, Reg8.E); break; /// LD E, E
// 			case 0x5C: opLD_reg8_reg8(Reg8.E, Reg8.H); break; /// LD E, H
// 			case 0x5D: opLD_reg8_reg8(Reg8.E, Reg8.L); break; /// LD E, L
// 			case 0x5E: opLD_reg8_refReg(Reg8.E, Reg16.HL); break; /// LD E, (HL)
// 			case 0x5F: opLD_reg8_reg8(Reg8.E, Reg8.A); break; /// LD E, A
// 			case 0x60: opLD_reg8_reg8(Reg8.H, Reg8.B); break; /// LD H, B
// 			case 0x61: opLD_reg8_reg8(Reg8.H, Reg8.C); break; /// LD H, C
// 			case 0x62: opLD_reg8_reg8(Reg8.H, Reg8.D); break; /// LD H, D
// 			case 0x63: opLD_reg8_reg8(Reg8.H, Reg8.E); break; /// LD H, E
// 			case 0x64: opLD_reg8_reg8(Reg8.H, Reg8.H); break; /// LD H, H
// 			case 0x65: opLD_reg8_reg8(Reg8.H, Reg8.L); break; /// LD H, L
// 			case 0x66: opLD_reg8_refReg(Reg8.H, Reg16.HL); break; /// LD H, (HL)
// 			case 0x67: opLD_reg8_reg8(Reg8.H, Reg8.A); break; /// LD H, A
// 			case 0x68: opLD_reg8_reg8(Reg8.L, Reg8.B); break; /// LD L, B
// 			case 0x69: opLD_reg8_reg8(Reg8.L, Reg8.C); break; /// LD L, C
// 			case 0x6A: opLD_reg8_reg8(Reg8.L, Reg8.D); break; /// LD L, D
// 			case 0x6B: opLD_reg8_reg8(Reg8.L, Reg8.E); break; /// LD L, E
// 			case 0x6C: opLD_reg8_reg8(Reg8.L, Reg8.H); break; /// LD L, H
// 			case 0x6D: opLD_reg8_reg8(Reg8.L, Reg8.L); break; /// LD L, L
// 			case 0x6E: opLD_reg8_refReg(Reg8.L, Reg16.HL); break; /// LD L, (HL)
// 			case 0x6F: opLD_reg8_reg8(Reg8.L, Reg8.A); break; /// LD L, A
// 			case 0x70: opLD_refReg_reg8(Reg16.HL, Reg8.B); break; /// LD (HL), B
// 			case 0x71: opLD_refReg_reg8(Reg16.HL, Reg8.C); break; /// LD (HL), C
// 			case 0x72: opLD_refReg_reg8(Reg16.HL, Reg8.D); break; /// LD (HL), D
// 			case 0x73: opLD_refReg_reg8(Reg16.HL, Reg8.E); break; /// LD (HL), E
// 			case 0x74: opLD_refReg_reg8(Reg16.HL, Reg8.H); break; /// LD (HL), H
// 			case 0x75: opLD_refReg_reg8(Reg16.HL, Reg8.L); break; /// LD (HL), L
// 			case 0x76: opHALT(); break; /// HALT
// 			case 0x77: opLD_refReg_reg8(Reg16.HL, Reg8.A); break; /// LD (HL), A
// 			case 0x78: opLD_reg8_reg8(Reg8.A, Reg8.B); break; /// LD A, B
// 			case 0x79: opLD_reg8_reg8(Reg8.A, Reg8.C); break; /// LD A, C
// 			case 0x7A: opLD_reg8_reg8(Reg8.A, Reg8.D); break; /// LD A, D
// 			case 0x7B: opLD_reg8_reg8(Reg8.A, Reg8.E); break; /// LD A, E
// 			case 0x7C: opLD_reg8_reg8(Reg8.A, Reg8.H); break; /// LD A, H
// 			case 0x7D: opLD_reg8_reg8(Reg8.A, Reg8.L); break; /// LD A, L
// 			case 0x7E: opLD_reg8_refReg(Reg8.A, Reg16.HL); break; /// LD A, (HL)
// 			case 0x7F: opLD_reg8_reg8(Reg8.A, Reg8.A); break; /// LD A, A
// 			case 0x80: opADD_reg8_reg8(Reg8.A, Reg8.B); break; /// ADD A, B
// 			case 0x81: opADD_reg8_reg8(Reg8.A, Reg8.C); break; /// ADD A, C
// 			case 0x82: opADD_reg8_reg8(Reg8.A, Reg8.D); break; /// ADD A, D
// 			case 0x83: opADD_reg8_reg8(Reg8.A, Reg8.E); break; /// ADD A, E
// 			case 0x84: opADD_reg8_reg8(Reg8.A, Reg8.H); break; /// ADD A, H
// 			case 0x85: opADD_reg8_reg8(Reg8.A, Reg8.L); break; /// ADD A, L
// 			case 0x86: opADD_reg8_refReg(Reg8.A, Reg16.HL); break; /// ADD A, (HL)
// 			case 0x87: opADD_reg8_reg8(Reg8.A, Reg8.A); break; /// ADD A, A
// 			case 0x88: opADC_reg8_reg8(Reg8.A, Reg8.B); break; /// ADC A, B
// 			case 0x89: opADC_reg8_reg8(Reg8.A, Reg8.C); break; /// ADC A, C
// 			case 0x8A: opADC_reg8_reg8(Reg8.A, Reg8.D); break; /// ADC A, D
// 			case 0x8B: opADC_reg8_reg8(Reg8.A, Reg8.E); break; /// ADC A, E
// 			case 0x8C: opADC_reg8_reg8(Reg8.A, Reg8.H); break; /// ADC A, H
// 			case 0x8D: opADC_reg8_reg8(Reg8.A, Reg8.L); break; /// ADC A, L
// 			case 0x8E: opADC_reg8_refReg(Reg8.A, Reg16.HL); break; /// ADC A, (HL)
// 			case 0x8F: opADC_reg8_reg8(Reg8.A, Reg8.A); break; /// ADC A, A
// 			case 0x90: opSUB_reg8(Reg8.B); break; /// SUB B
// 			case 0x91: opSUB_reg8(Reg8.C); break; /// SUB C
// 			case 0x92: opSUB_reg8(Reg8.D); break; /// SUB D
// 			case 0x93: opSUB_reg8(Reg8.E); break; /// SUB E
// 			case 0x94: opSUB_reg8(Reg8.H); break; /// SUB H
// 			case 0x95: opSUB_reg8(Reg8.L); break; /// SUB L
// 			case 0x96: opSUB_refReg(Reg16.HL); break; /// SUB (HL)
// 			case 0x97: opSUB_reg8(Reg8.A); break; /// SUB A
// 			case 0x98: opSBC_reg8_reg8(Reg8.A, Reg8.B); break; /// SBC A, B
// 			case 0x99: opSBC_reg8_reg8(Reg8.A, Reg8.C); break; /// SBC A, C
// 			case 0x9A: opSBC_reg8_reg8(Reg8.A, Reg8.D); break; /// SBC A, D
// 			case 0x9B: opSBC_reg8_reg8(Reg8.A, Reg8.E); break; /// SBC A, E
// 			case 0x9C: opSBC_reg8_reg8(Reg8.A, Reg8.H); break; /// SBC A, H
// 			case 0x9D: opSBC_reg8_reg8(Reg8.A, Reg8.L); break; /// SBC A, L
// 			case 0x9E: opSBC_reg8_refReg(Reg8.A, Reg16.HL); break; /// SBC A, (HL)
// 			case 0x9F: opSBC_reg8_reg8(Reg8.A, Reg8.A); break; /// SBC A, A
// 			case 0xA0: opAND_reg8(Reg8.B); break; /// AND B
// 			case 0xA1: opAND_reg8(Reg8.C); break; /// AND C
// 			case 0xA2: opAND_reg8(Reg8.D); break; /// AND D
// 			case 0xA3: opAND_reg8(Reg8.E); break; /// AND E
// 			case 0xA4: opAND_reg8(Reg8.H); break; /// AND H
// 			case 0xA5: opAND_reg8(Reg8.L); break; /// AND L
// 			case 0xA6: opAND_refReg(Reg16.HL); break; /// AND (HL)
// 			case 0xA7: opAND_reg8(Reg8.A); break; /// AND A
// 			case 0xA8: opXOR_reg8(Reg8.B); break; /// XOR B
// 			case 0xA9: opXOR_reg8(Reg8.C); break; /// XOR C
// 			case 0xAA: opXOR_reg8(Reg8.D); break; /// XOR D
// 			case 0xAB: opXOR_reg8(Reg8.E); break; /// XOR E
// 			case 0xAC: opXOR_reg8(Reg8.H); break; /// XOR H
// 			case 0xAD: opXOR_reg8(Reg8.L); break; /// XOR L
// 			case 0xAE: opXOR_refReg(Reg16.HL); break; /// XOR (HL)
// 			case 0xAF: opXOR_reg8(Reg8.A); break; /// XOR A
// 			case 0xB0: opOR_reg8(Reg8.B); break; /// OR B
// 			case 0xB1: opOR_reg8(Reg8.C); break; /// OR C
// 			case 0xB2: opOR_reg8(Reg8.D); break; /// OR D
// 			case 0xB3: opOR_reg8(Reg8.E); break; /// OR E
// 			case 0xB4: opOR_reg8(Reg8.H); break; /// OR H
// 			case 0xB5: opOR_reg8(Reg8.L); break; /// OR L
// 			case 0xB6: opOR_refReg(Reg16.HL); break; /// OR (HL)
// 			case 0xB7: opOR_reg8(Reg8.A); break; /// OR A
// 			case 0xB8: opCP_reg8(Reg8.B); break; /// CP B
// 			case 0xB9: opCP_reg8(Reg8.C); break; /// CP C
// 			case 0xBA: opCP_reg8(Reg8.D); break; /// CP D
// 			case 0xBB: opCP_reg8(Reg8.E); break; /// CP E
// 			case 0xBC: opCP_reg8(Reg8.H); break; /// CP H
// 			case 0xBD: opCP_reg8(Reg8.L); break; /// CP L
// 			case 0xBE: opCP_refReg(Reg16.HL); break; /// CP (HL)
// 			case 0xBF: opCP_reg8(Reg8.A); break; /// CP A
// 			case 0xC0: opRET_if(Flag.NZ); break; /// RET NZ
// 			case 0xC1: opPOP_reg16(Reg16.BC); break; /// POP BC
// 			case 0xC2: opJP_if_u16(Flag.NZ); break; /// JP NZ, a16
// 			case 0xC3: opJP_u16(); break; /// JP a16
// 			case 0xC4: opCALL_if_u16(Flag.NZ); break; /// CALL NZ, a16
// 			case 0xC5: opPUSH_reg16(Reg16.BC); break; /// PUSH BC
// 			case 0xC6: opADD_reg8_u8(Reg8.A); break; /// ADD A, d8
// 			case 0xC7: opRST(); break; /// RST 0
// 			case 0xC8: opRET_if(Flag.Z); break; /// RET Z
// 			case 0xC9: opRET(); break; /// RET
// 			case 0xCA: opJP_if_u16(Flag.Z); break; /// JP Z, a16
// 			case 0xCB: assert(0); break; /// invalid
// 			case 0xCC: opCALL_if_u16(Flag.Z); break; /// CALL Z, a16
// 			case 0xCD: opCALL_u16(); break; /// CALL a16
// 			case 0xCE: opADC_reg8_u8(Reg8.A); break; /// ADC A, d8
// 			case 0xCF: opRST(); break; /// RST 1
// 			case 0xD0: opRET_if(Flag.NC); break; /// RET NC
// 			case 0xD1: opPOP_reg16(Reg16.DE); break; /// POP DE
// 			case 0xD2: opJP_if_u16(Flag.NC); break; /// JP NC, a16
// 			case 0xD3: assert(0); break; /// invalid
// 			case 0xD4: opCALL_if_u16(Flag.NC); break; /// CALL NC, a16
// 			case 0xD5: opPUSH_reg16(Reg16.DE); break; /// PUSH DE
// 			case 0xD6: opSUB_u8(); break; /// SUB d8
// 			case 0xD7: opRST(); break; /// RST 2
// 			case 0xD8: opRET_reg8(Reg8.C); break; /// RET C
// 			case 0xD9: opRETI(); break; /// RETI
// 			case 0xDA: opJP_if_u16(Flag.Cy); break; /// JP Cy, a16
// 			case 0xDB: assert(0); break; /// invalid
// 			case 0xDC: opCALL_if_u16(Flag.Cy); break; /// CALL Cy, a16
// 			case 0xDD: assert(0); break; /// invalid
// 			case 0xDE: opSBC_reg8_u8(Reg8.A); break; /// SBC A, d8
// 			case 0xDF: opRST(); break; /// RST 3
// 			case 0xE0: opLDH_ioRef8_reg8(, Reg8.A); break; /// LDH (a8), A
// 			case 0xE1: opPOP_reg16(Reg16.HL); break; /// POP HL
// 			case 0xE2: opLDH_ioRefReg_reg8(Reg8.C, Reg8.A); break; /// LDH (offC), A
// 			case 0xE3: assert(0); break; /// invalid
// 			case 0xE4: assert(0); break; /// invalid
// 			case 0xE5: opPUSH_reg16(Reg16.HL); break; /// PUSH HL
// 			case 0xE6: opAND_u8(); break; /// AND d8
// 			case 0xE7: opRST(); break; /// RST 4
// 			case 0xE8: opADD_SP_off8(); break; /// ADD SP, s8
// 			case 0xE9: opJP_reg16(Reg16.HL); break; /// JP HL
// 			case 0xEA: opLD_ref16_reg8(, Reg8.A); break; /// LD (a16), A
// 			case 0xEB: assert(0); break; /// invalid
// 			case 0xEC: assert(0); break; /// invalid
// 			case 0xED: assert(0); break; /// invalid
// 			case 0xEE: opXOR_u8(); break; /// XOR d8
// 			case 0xEF: opRST(); break; /// RST 5
// 			case 0xF0: opLDH_reg8_ioRef8(Reg8.A); break; /// LDH A, (a8)
// 			case 0xF1: opPOP_reg16(Reg16.AF); break; /// POP AF
// 			case 0xF2: opLDH_reg8_ioRefReg(Reg8.A, Reg8.C); break; /// LDH A, (offC)
// 			case 0xF3: opDI(); break; /// DI
// 			case 0xF4: assert(0); break; /// invalid
// 			case 0xF5: opPUSH_reg16(Reg16.AF); break; /// PUSH AF
// 			case 0xF6: opOR_u8(); break; /// OR d8
// 			case 0xF7: opRST(); break; /// RST 6
// 			case 0xF8: opLD_reg16_off8SP(Reg16.HL); break; /// LD HL, SP+s8
// 			case 0xF9: opLD_SP_reg16(, Reg16.HL); break; /// LD SP, HL
// 			case 0xFA: opLD_reg8_ref16(Reg8.A); break; /// LD A, (a16)
// 			case 0xFB: opEI(); break; /// EI
// 			case 0xFC: assert(0); break; /// invalid
// 			case 0xFD: assert(0); break; /// invalid
// 			case 0xFE: opCP_u8(); break; /// CP d8
// 			case 0xFF: opRST(); break; /// RST 7
//         }