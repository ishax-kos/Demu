module gb.instructions;

import gb.memory;


typeof(x00_NOP_noOperation)*[256] instruction = [
    &x00_NOP_noOperation,
    &x01_LD_assignValue,
    &x02_LD_assignValue,
    &x03_INC_increment,
    &x04_INC_increment,
    &x05_DEC_decrement,
    &x06_LD_assignValue,
    &x07_RLCA_rotateALeft,
    &x08_LD_assignValue,
    &x09_ADD_add,
    &x0A_LD_assignValue,
    &x0B_DEC_decrement,
    &x0C_INC_increment,
    &x0D_DEC_decrement,
    &x0E_LD_assignValue,
    &x0F_RRCA_rotateARight,
    &x10_STOP_,
    &x11_LD_assignValue,
    &x12_LD_assignValue,
    &x13_INC_increment,
    &x14_INC_increment,
    &x15_DEC_decrement,
    &x16_LD_assignValue,
    &x17_RLA_rotateACarryLeft,
    &x18_JR_jumpByAmount,
    &x19_ADD_add,
    &x1A_LD_assignValue,
    &x1B_DEC_decrement,
    &x1C_INC_increment,
    &x1D_DEC_decrement,
    &x1E_LD_assignValue,
    &x1F_RRA_rotateACarryRight,
    &x20_JR_jumpByAmount,
    &x21_LD_assignValue,
    &x22_LD_assignValue,
    &x23_INC_increment,
    &x24_INC_increment,
    &x25_DEC_decrement,
    &x26_LD_assignValue,
    &x27_DAA_,
    &x28_JR_jumpByAmount,
    &x29_ADD_add,
    &x2A_LD_assignValue,
    &x2B_DEC_decrement,
    &x2C_INC_increment,
    &x2D_DEC_decrement,
    &x2E_LD_assignValue,
    &x2F_CPL_invertAccumulator,
    &x30_JR_jumpByAmount,
    &x31_LD_assignValue,
    &x32_LD_assignValue,
    &x33_INC_increment,
    &x34_INC_increment,
    &x35_DEC_decrement,
    &x36_LD_assignValue,
    &x37_SCF_setCarry,
    &x38_JR_jumpByAmount,
    &x39_ADD_add,
    &x3A_LD_assignValue,
    &x3B_DEC_decrement,
    &x3C_INC_increment,
    &x3D_DEC_decrement,
    &x3E_LD_assignValue,
    &x3F_CCF_invertCarryFlag,
    &x40_LD_assignValue,
    &x41_LD_assignValue,
    &x42_LD_assignValue,
    &x43_LD_assignValue,
    &x44_LD_assignValue,
    &x45_LD_assignValue,
    &x46_LD_assignValue,
    &x47_LD_assignValue,
    &x48_LD_assignValue,
    &x49_LD_assignValue,
    &x4A_LD_assignValue,
    &x4B_LD_assignValue,
    &x4C_LD_assignValue,
    &x4D_LD_assignValue,
    &x4E_LD_assignValue,
    &x4F_LD_assignValue,
    &x50_LD_assignValue,
    &x51_LD_assignValue,
    &x52_LD_assignValue,
    &x53_LD_assignValue,
    &x54_LD_assignValue,
    &x55_LD_assignValue,
    &x56_LD_assignValue,
    &x57_LD_assignValue,
    &x58_LD_assignValue,
    &x59_LD_assignValue,
    &x5A_LD_assignValue,
    &x5B_LD_assignValue,
    &x5C_LD_assignValue,
    &x5D_LD_assignValue,
    &x5E_LD_assignValue,
    &x5F_LD_assignValue,
    &x60_LD_assignValue,
    &x61_LD_assignValue,
    &x62_LD_assignValue,
    &x63_LD_assignValue,
    &x64_LD_assignValue,
    &x65_LD_assignValue,
    &x66_LD_assignValue,
    &x67_LD_assignValue,
    &x68_LD_assignValue,
    &x69_LD_assignValue,
    &x6A_LD_assignValue,
    &x6B_LD_assignValue,
    &x6C_LD_assignValue,
    &x6D_LD_assignValue,
    &x6E_LD_assignValue,
    &x6F_LD_assignValue,
    &x70_LD_assignValue,
    &x71_LD_assignValue,
    &x72_LD_assignValue,
    &x73_LD_assignValue,
    &x74_LD_assignValue,
    &x75_LD_assignValue,
    &x76_HALT_haltUntilInterrupt,
    &x77_LD_assignValue,
    &x78_LD_assignValue,
    &x79_LD_assignValue,
    &x7A_LD_assignValue,
    &x7B_LD_assignValue,
    &x7C_LD_assignValue,
    &x7D_LD_assignValue,
    &x7E_LD_assignValue,
    &x7F_LD_assignValue,
    &x80_ADD_add,
    &x81_ADD_add,
    &x82_ADD_add,
    &x83_ADD_add,
    &x84_ADD_add,
    &x85_ADD_add,
    &x86_ADD_add,
    &x87_ADD_add,
    &x88_ADC_addCarry,
    &x89_ADC_addCarry,
    &x8A_ADC_addCarry,
    &x8B_ADC_addCarry,
    &x8C_ADC_addCarry,
    &x8D_ADC_addCarry,
    &x8E_ADC_addCarry,
    &x8F_ADC_addCarry,
    &x90_SUB_subtract,
    &x91_SUB_subtract,
    &x92_SUB_subtract,
    &x93_SUB_subtract,
    &x94_SUB_subtract,
    &x95_SUB_subtract,
    &x96_SUB_subtract,
    &x97_SUB_subtract,
    &x98_SBC_subtractCarry,
    &x99_SBC_subtractCarry,
    &x9A_SBC_subtractCarry,
    &x9B_SBC_subtractCarry,
    &x9C_SBC_subtractCarry,
    &x9D_SBC_subtractCarry,
    &x9E_SBC_subtractCarry,
    &x9F_SBC_subtractCarry,
    &xA0_AND_bitAnd,
    &xA1_AND_bitAnd,
    &xA2_AND_bitAnd,
    &xA3_AND_bitAnd,
    &xA4_AND_bitAnd,
    &xA5_AND_bitAnd,
    &xA6_AND_bitAnd,
    &xA7_AND_bitAnd,
    &xA8_XOR_bitXor,
    &xA9_XOR_bitXor,
    &xAA_XOR_bitXor,
    &xAB_XOR_bitXor,
    &xAC_XOR_bitXor,
    &xAD_XOR_bitXor,
    &xAE_XOR_bitXor,
    &xAF_XOR_bitXor,
    &xB0_OR_bitOr,
    &xB1_OR_bitOr,
    &xB2_OR_bitOr,
    &xB3_OR_bitOr,
    &xB4_OR_bitOr,
    &xB5_OR_bitOr,
    &xB6_OR_bitOr,
    &xB7_OR_bitOr,
    &xB8_CP_compare,
    &xB9_CP_compare,
    &xBA_CP_compare,
    &xBB_CP_compare,
    &xBC_CP_compare,
    &xBD_CP_compare,
    &xBE_CP_compare,
    &xBF_CP_compare,
    &xC0_RET_returnFromSubroutine,
    &xC1_POP_,
    &xC2_JP_jumpToAddress,
    &xC3_JP_jumpToAddress,
    &xC4_CALL_callSubroutine,
    &xC5_PUSH_,
    &xC6_ADD_add,
    &xC7_RST_callStartupSubroutine,
    &xC8_RET_returnFromSubroutine,
    &xC9_RET_returnFromSubroutine,
    &xCA_JP_jumpToAddress,
    &xCB_prefix,
    &xCC_CALL_callSubroutine,
    &xCD_CALL_callSubroutine,
    &xCE_ADC_addCarry,
    &xCF_RST_callStartupSubroutine,
    &xD0_RET_returnFromSubroutine,
    &xD1_POP_,
    &xD2_JP_jumpToAddress,
    &xD3_INVALID,
    &xD4_CALL_callSubroutine,
    &xD5_PUSH_,
    &xD6_SUB_subtract,
    &xD7_RST_callStartupSubroutine,
    &xD8_RET_returnFromSubroutine,
    &xD9_RETI_returnAndEnableInterrupts,
    &xDA_JP_jumpToAddress,
    &xDB_INVALID,
    &xDC_CALL_callSubroutine,
    &xDD_INVALID,
    &xDE_SBC_subtractCarry,
    &xDF_RST_callStartupSubroutine,
    &xE0_LD_assignValue,
    &xE1_POP_,
    &xE2_LD_assignValue,
    &xE3_INVALID,
    &xE4_INVALID,
    &xE5_PUSH_,
    &xE6_AND_bitAnd,
    &xE7_RST_callStartupSubroutine,
    &xE8_ADD_add,
    &xE9_JP_jumpToAddress,
    &xEA_LD_assignValue,
    &xEB_INVALID,
    &xEC_INVALID,
    &xED_INVALID,
    &xEE_XOR_bitXor,
    &xEF_RST_callStartupSubroutine,
    &xF0_LD_assignValue,
    &xF1_POP_,
    &xF2_LD_assignValue,
    &xF3_DI_disableInterrupts_clearIME,
    &xF4_INVALID,
    &xF5_PUSH_,
    &xF6_OR_bitOr,
    &xF7_RST_callStartupSubroutine,
    &xF8_LD_assignValue,
    &xF9_LD_assignValue,
    &xFA_LD_assignValue,
    &xFB_EI_enableInterrupts_setIME,
    &xFC_INVALID,
    &xFD_INVALID,
    &xFE_CP_compare,
    &xFF_RST_callStartupSubroutine
];

private {

void x00_NOP_noOperation(ref GameBoyCPUState state) {/// NOP
    
};


void x01_LD_assignValue(ref GameBoyCPUState state) {/// LD BC, d16
    state.rBC = *state.args16;
};


void x02_LD_assignValue(ref GameBoyCPUState state) {/// LD (BC), A
    
};


void x03_INC_increment(ref GameBoyCPUState state) {/// INC BC
    
};


void x04_INC_increment(ref GameBoyCPUState state) {/// INC B
    
};


void x05_DEC_decrement(ref GameBoyCPUState state) {/// DEC B
    
};


void x06_LD_assignValue(ref GameBoyCPUState state) {/// LD B, d8
    
};


void x07_RLCA_rotateALeft(ref GameBoyCPUState state) {/// RLCA
    
};


void x08_LD_assignValue(ref GameBoyCPUState state) {/// LD (a16), SP
    
};


void x09_ADD_add(ref GameBoyCPUState state) {/// ADD HL, BC
    
};


void x0A_LD_assignValue(ref GameBoyCPUState state) {/// LD A, (BC)
    
};


void x0B_DEC_decrement(ref GameBoyCPUState state) {/// DEC BC
    
};


void x0C_INC_increment(ref GameBoyCPUState state) {/// INC C
    
};


void x0D_DEC_decrement(ref GameBoyCPUState state) {/// DEC C
    
};


void x0E_LD_assignValue(ref GameBoyCPUState state) {/// LD C, d8
    
};


void x0F_RRCA_rotateARight(ref GameBoyCPUState state) {/// RRCA
    
};


void x10_STOP_(ref GameBoyCPUState state) {/// STOP
    
};


void x11_LD_assignValue(ref GameBoyCPUState state) {/// LD DE, d16
    
};


void x12_LD_assignValue(ref GameBoyCPUState state) {/// LD (DE), A
    
};


void x13_INC_increment(ref GameBoyCPUState state) {/// INC DE
    
};


void x14_INC_increment(ref GameBoyCPUState state) {/// INC D
    
};


void x15_DEC_decrement(ref GameBoyCPUState state) {/// DEC D
    
};


void x16_LD_assignValue(ref GameBoyCPUState state) {/// LD D, d8
    
};


void x17_RLA_rotateACarryLeft(ref GameBoyCPUState state) {/// RLA
    
};


void x18_JR_jumpByAmount(ref GameBoyCPUState state) {/// JR s8
    
};


void x19_ADD_add(ref GameBoyCPUState state) {/// ADD HL, DE
    
};


void x1A_LD_assignValue(ref GameBoyCPUState state) {/// LD A, (DE)
    
};


void x1B_DEC_decrement(ref GameBoyCPUState state) {/// DEC DE
    
};


void x1C_INC_increment(ref GameBoyCPUState state) {/// INC E
    
};


void x1D_DEC_decrement(ref GameBoyCPUState state) {/// DEC E
    
};


void x1E_LD_assignValue(ref GameBoyCPUState state) {/// LD E, d8
    
};


void x1F_RRA_rotateACarryRight(ref GameBoyCPUState state) {/// RRA
    
};


void x20_JR_jumpByAmount(ref GameBoyCPUState state) {/// JR NZ, s8
    
};


void x21_LD_assignValue(ref GameBoyCPUState state) {/// LD HL, d16
    
};


void x22_LD_assignValue(ref GameBoyCPUState state) {/// LD (HL+), A
    
};


void x23_INC_increment(ref GameBoyCPUState state) {/// INC HL
    
};


void x24_INC_increment(ref GameBoyCPUState state) {/// INC H
    
};


void x25_DEC_decrement(ref GameBoyCPUState state) {/// DEC H
    
};


void x26_LD_assignValue(ref GameBoyCPUState state) {/// LD H, d8
    
};


void x27_DAA_(ref GameBoyCPUState state) {/// DAA
    
};


void x28_JR_jumpByAmount(ref GameBoyCPUState state) {/// JR Z, s8
    
};


void x29_ADD_add(ref GameBoyCPUState state) {/// ADD HL, HL
    
};


void x2A_LD_assignValue(ref GameBoyCPUState state) {/// LD A, (HL+)
    
};


void x2B_DEC_decrement(ref GameBoyCPUState state) {/// DEC HL
    
};


void x2C_INC_increment(ref GameBoyCPUState state) {/// INC L
    
};


void x2D_DEC_decrement(ref GameBoyCPUState state) {/// DEC L
    
};


void x2E_LD_assignValue(ref GameBoyCPUState state) {/// LD L, d8
    
};


void x2F_CPL_invertAccumulator(ref GameBoyCPUState state) {/// CPL
    
};


void x30_JR_jumpByAmount(ref GameBoyCPUState state) {/// JR NC, s8
    
};


void x31_LD_assignValue(ref GameBoyCPUState state) {/// LD SP, d16
    
};


void x32_LD_assignValue(ref GameBoyCPUState state) {/// LD (HL-), A
    
};


void x33_INC_increment(ref GameBoyCPUState state) {/// INC SP
    
};


void x34_INC_increment(ref GameBoyCPUState state) {/// INC (HL)
    
};


void x35_DEC_decrement(ref GameBoyCPUState state) {/// DEC (HL)
    
};


void x36_LD_assignValue(ref GameBoyCPUState state) {/// LD (HL), d8
    
};


void x37_SCF_setCarry(ref GameBoyCPUState state) {/// SCF
    
};


void x38_JR_jumpByAmount(ref GameBoyCPUState state) {/// JR C, s8
    
};


void x39_ADD_add(ref GameBoyCPUState state) {/// ADD HL, SP
    
};


void x3A_LD_assignValue(ref GameBoyCPUState state) {/// LD A, (HL-)
    
};


void x3B_DEC_decrement(ref GameBoyCPUState state) {/// DEC SP
    
};


void x3C_INC_increment(ref GameBoyCPUState state) {/// INC A
    
};


void x3D_DEC_decrement(ref GameBoyCPUState state) {/// DEC A
    
};


void x3E_LD_assignValue(ref GameBoyCPUState state) {/// LD A, d8
    
};


void x3F_CCF_invertCarryFlag(ref GameBoyCPUState state) {/// CCF
    
};


void x40_LD_assignValue(ref GameBoyCPUState state) {/// LD B, B
    
};


void x41_LD_assignValue(ref GameBoyCPUState state) {/// LD B, C
    
};


void x42_LD_assignValue(ref GameBoyCPUState state) {/// LD B, D
    
};


void x43_LD_assignValue(ref GameBoyCPUState state) {/// LD B, E
    
};


void x44_LD_assignValue(ref GameBoyCPUState state) {/// LD B, H
    
};


void x45_LD_assignValue(ref GameBoyCPUState state) {/// LD B, L
    
};


void x46_LD_assignValue(ref GameBoyCPUState state) {/// LD B, (HL)
    
};


void x47_LD_assignValue(ref GameBoyCPUState state) {/// LD B, A
    
};


void x48_LD_assignValue(ref GameBoyCPUState state) {/// LD C, B
    
};


void x49_LD_assignValue(ref GameBoyCPUState state) {/// LD C, C
    
};


void x4A_LD_assignValue(ref GameBoyCPUState state) {/// LD C, D
    
};


void x4B_LD_assignValue(ref GameBoyCPUState state) {/// LD C, E
    
};


void x4C_LD_assignValue(ref GameBoyCPUState state) {/// LD C, H
    
};


void x4D_LD_assignValue(ref GameBoyCPUState state) {/// LD C, L
    
};


void x4E_LD_assignValue(ref GameBoyCPUState state) {/// LD C, (HL)
    
};


void x4F_LD_assignValue(ref GameBoyCPUState state) {/// LD C, A
    
};


void x50_LD_assignValue(ref GameBoyCPUState state) {/// LD D, B
    
};


void x51_LD_assignValue(ref GameBoyCPUState state) {/// LD D, C
    
};


void x52_LD_assignValue(ref GameBoyCPUState state) {/// LD D, D
    
};


void x53_LD_assignValue(ref GameBoyCPUState state) {/// LD D, E
    
};


void x54_LD_assignValue(ref GameBoyCPUState state) {/// LD D, H
    
};


void x55_LD_assignValue(ref GameBoyCPUState state) {/// LD D, L
    
};


void x56_LD_assignValue(ref GameBoyCPUState state) {/// LD D, (HL)
    
};


void x57_LD_assignValue(ref GameBoyCPUState state) {/// LD D, A
    
};


void x58_LD_assignValue(ref GameBoyCPUState state) {/// LD E, B
    
};


void x59_LD_assignValue(ref GameBoyCPUState state) {/// LD E, C
    
};


void x5A_LD_assignValue(ref GameBoyCPUState state) {/// LD E, D
    
};


void x5B_LD_assignValue(ref GameBoyCPUState state) {/// LD E, E
    
};


void x5C_LD_assignValue(ref GameBoyCPUState state) {/// LD E, H
    
};


void x5D_LD_assignValue(ref GameBoyCPUState state) {/// LD E, L
    
};


void x5E_LD_assignValue(ref GameBoyCPUState state) {/// LD E, (HL)
    
};


void x5F_LD_assignValue(ref GameBoyCPUState state) {/// LD E, A
    
};


void x60_LD_assignValue(ref GameBoyCPUState state) {/// LD H, B
    
};


void x61_LD_assignValue(ref GameBoyCPUState state) {/// LD H, C
    
};


void x62_LD_assignValue(ref GameBoyCPUState state) {/// LD H, D
    
};


void x63_LD_assignValue(ref GameBoyCPUState state) {/// LD H, E
    
};


void x64_LD_assignValue(ref GameBoyCPUState state) {/// LD H, H
    
};


void x65_LD_assignValue(ref GameBoyCPUState state) {/// LD H, L
    
};


void x66_LD_assignValue(ref GameBoyCPUState state) {/// LD H, (HL)
    
};


void x67_LD_assignValue(ref GameBoyCPUState state) {/// LD H, A
    
};


void x68_LD_assignValue(ref GameBoyCPUState state) {/// LD L, B
    
};


void x69_LD_assignValue(ref GameBoyCPUState state) {/// LD L, C
    
};


void x6A_LD_assignValue(ref GameBoyCPUState state) {/// LD L, D
    
};


void x6B_LD_assignValue(ref GameBoyCPUState state) {/// LD L, E
    
};


void x6C_LD_assignValue(ref GameBoyCPUState state) {/// LD L, H
    
};


void x6D_LD_assignValue(ref GameBoyCPUState state) {/// LD L, L
    
};


void x6E_LD_assignValue(ref GameBoyCPUState state) {/// LD L, (HL)
    
};


void x6F_LD_assignValue(ref GameBoyCPUState state) {/// LD L, A
    
};


void x70_LD_assignValue(ref GameBoyCPUState state) {/// LD (HL), B
    
};


void x71_LD_assignValue(ref GameBoyCPUState state) {/// LD (HL), C
    
};


void x72_LD_assignValue(ref GameBoyCPUState state) {/// LD (HL), D
    
};


void x73_LD_assignValue(ref GameBoyCPUState state) {/// LD (HL), E
    
};


void x74_LD_assignValue(ref GameBoyCPUState state) {/// LD (HL), H
    
};


void x75_LD_assignValue(ref GameBoyCPUState state) {/// LD (HL), L
    
};


void x76_HALT_haltUntilInterrupt(ref GameBoyCPUState state) {/// HALT
    
};


void x77_LD_assignValue(ref GameBoyCPUState state) {/// LD (HL), A
    
};


void x78_LD_assignValue(ref GameBoyCPUState state) {/// LD A, B
    
};


void x79_LD_assignValue(ref GameBoyCPUState state) {/// LD A, C
    
};


void x7A_LD_assignValue(ref GameBoyCPUState state) {/// LD A, D
    
};


void x7B_LD_assignValue(ref GameBoyCPUState state) {/// LD A, E
    
};


void x7C_LD_assignValue(ref GameBoyCPUState state) {/// LD A, H
    
};


void x7D_LD_assignValue(ref GameBoyCPUState state) {/// LD A, L
    
};


void x7E_LD_assignValue(ref GameBoyCPUState state) {/// LD A, (HL)
    
};


void x7F_LD_assignValue(ref GameBoyCPUState state) {/// LD A, A
    
};


void x80_ADD_add(ref GameBoyCPUState state) {/// ADD A, B
    
};


void x81_ADD_add(ref GameBoyCPUState state) {/// ADD A, C
    
};


void x82_ADD_add(ref GameBoyCPUState state) {/// ADD A, D
    
};


void x83_ADD_add(ref GameBoyCPUState state) {/// ADD A, E
    
};


void x84_ADD_add(ref GameBoyCPUState state) {/// ADD A, H
    
};


void x85_ADD_add(ref GameBoyCPUState state) {/// ADD A, L
    
};


void x86_ADD_add(ref GameBoyCPUState state) {/// ADD A, (HL)
    
};


void x87_ADD_add(ref GameBoyCPUState state) {/// ADD A, A
    
};


void x88_ADC_addCarry(ref GameBoyCPUState state) {/// ADC A, B
    
};


void x89_ADC_addCarry(ref GameBoyCPUState state) {/// ADC A, C
    
};


void x8A_ADC_addCarry(ref GameBoyCPUState state) {/// ADC A, D
    
};


void x8B_ADC_addCarry(ref GameBoyCPUState state) {/// ADC A, E
    
};


void x8C_ADC_addCarry(ref GameBoyCPUState state) {/// ADC A, H
    
};


void x8D_ADC_addCarry(ref GameBoyCPUState state) {/// ADC A, L
    
};


void x8E_ADC_addCarry(ref GameBoyCPUState state) {/// ADC A, (HL)
    
};


void x8F_ADC_addCarry(ref GameBoyCPUState state) {/// ADC A, A
    
};


void x90_SUB_subtract(ref GameBoyCPUState state) {/// SUB B
    
};


void x91_SUB_subtract(ref GameBoyCPUState state) {/// SUB C
    
};


void x92_SUB_subtract(ref GameBoyCPUState state) {/// SUB D
    
};


void x93_SUB_subtract(ref GameBoyCPUState state) {/// SUB E
    
};


void x94_SUB_subtract(ref GameBoyCPUState state) {/// SUB H
    
};


void x95_SUB_subtract(ref GameBoyCPUState state) {/// SUB L
    
};


void x96_SUB_subtract(ref GameBoyCPUState state) {/// SUB (HL)
    
};


void x97_SUB_subtract(ref GameBoyCPUState state) {/// SUB A
    
};


void x98_SBC_subtractCarry(ref GameBoyCPUState state) {/// SBC A, B
    
};


void x99_SBC_subtractCarry(ref GameBoyCPUState state) {/// SBC A, C
    
};


void x9A_SBC_subtractCarry(ref GameBoyCPUState state) {/// SBC A, D
    
};


void x9B_SBC_subtractCarry(ref GameBoyCPUState state) {/// SBC A, E
    
};


void x9C_SBC_subtractCarry(ref GameBoyCPUState state) {/// SBC A, H
    
};


void x9D_SBC_subtractCarry(ref GameBoyCPUState state) {/// SBC A, L
    
};


void x9E_SBC_subtractCarry(ref GameBoyCPUState state) {/// SBC A, (HL)
    
};


void x9F_SBC_subtractCarry(ref GameBoyCPUState state) {/// SBC A, A
    
};


void xA0_AND_bitAnd(ref GameBoyCPUState state) {/// AND B
    
};


void xA1_AND_bitAnd(ref GameBoyCPUState state) {/// AND C
    
};


void xA2_AND_bitAnd(ref GameBoyCPUState state) {/// AND D
    
};


void xA3_AND_bitAnd(ref GameBoyCPUState state) {/// AND E
    
};


void xA4_AND_bitAnd(ref GameBoyCPUState state) {/// AND H
    
};


void xA5_AND_bitAnd(ref GameBoyCPUState state) {/// AND L
    
};


void xA6_AND_bitAnd(ref GameBoyCPUState state) {/// AND (HL)
    
};


void xA7_AND_bitAnd(ref GameBoyCPUState state) {/// AND A
    
};


void xA8_XOR_bitXor(ref GameBoyCPUState state) {/// XOR B
    
};


void xA9_XOR_bitXor(ref GameBoyCPUState state) {/// XOR C
    
};


void xAA_XOR_bitXor(ref GameBoyCPUState state) {/// XOR D
    
};


void xAB_XOR_bitXor(ref GameBoyCPUState state) {/// XOR E
    
};


void xAC_XOR_bitXor(ref GameBoyCPUState state) {/// XOR H
    
};


void xAD_XOR_bitXor(ref GameBoyCPUState state) {/// XOR L
    
};


void xAE_XOR_bitXor(ref GameBoyCPUState state) {/// XOR (HL)
    
};


void xAF_XOR_bitXor(ref GameBoyCPUState state) {/// XOR A
    
};


void xB0_OR_bitOr(ref GameBoyCPUState state) {/// OR B
    
};


void xB1_OR_bitOr(ref GameBoyCPUState state) {/// OR C
    
};


void xB2_OR_bitOr(ref GameBoyCPUState state) {/// OR D
    
};


void xB3_OR_bitOr(ref GameBoyCPUState state) {/// OR E
    
};


void xB4_OR_bitOr(ref GameBoyCPUState state) {/// OR H
    
};


void xB5_OR_bitOr(ref GameBoyCPUState state) {/// OR L
    
};


void xB6_OR_bitOr(ref GameBoyCPUState state) {/// OR (HL)
    
};


void xB7_OR_bitOr(ref GameBoyCPUState state) {/// OR A
    
};


void xB8_CP_compare(ref GameBoyCPUState state) {/// CP B
    
};


void xB9_CP_compare(ref GameBoyCPUState state) {/// CP C
    
};


void xBA_CP_compare(ref GameBoyCPUState state) {/// CP D
    
};


void xBB_CP_compare(ref GameBoyCPUState state) {/// CP E
    
};


void xBC_CP_compare(ref GameBoyCPUState state) {/// CP H
    
};


void xBD_CP_compare(ref GameBoyCPUState state) {/// CP L
    
};


void xBE_CP_compare(ref GameBoyCPUState state) {/// CP (HL)
    
};


void xBF_CP_compare(ref GameBoyCPUState state) {/// CP A
    
};


void xC0_RET_returnFromSubroutine(ref GameBoyCPUState state) {/// RET NZ
    
};


void xC1_POP_(ref GameBoyCPUState state) {/// POP BC
    
};


void xC2_JP_jumpToAddress(ref GameBoyCPUState state) {/// JP NZ, a16
    
};


void xC3_JP_jumpToAddress(ref GameBoyCPUState state) {/// JP a16
    
};


void xC4_CALL_callSubroutine(ref GameBoyCPUState state) {/// CALL NZ, a16
    
};


void xC5_PUSH_(ref GameBoyCPUState state) {/// PUSH BC
    
};


void xC6_ADD_add(ref GameBoyCPUState state) {/// ADD A, d8
    
};


void xC7_RST_callStartupSubroutine(ref GameBoyCPUState state) {/// RST 0
    
};


void xC8_RET_returnFromSubroutine(ref GameBoyCPUState state) {/// RET Z
    
};


void xC9_RET_returnFromSubroutine(ref GameBoyCPUState state) {/// RET
    
};


void xCA_JP_jumpToAddress(ref GameBoyCPUState state) {/// JP Z, a16
    
};


void xCB_prefix(ref GameBoyCPUState state) {/// Call prefix
    
};


void xCC_CALL_callSubroutine(ref GameBoyCPUState state) {/// CALL Z, a16
    
};


void xCD_CALL_callSubroutine(ref GameBoyCPUState state) {/// CALL a16
    
};


void xCE_ADC_addCarry(ref GameBoyCPUState state) {/// ADC A, d8
    
};


void xCF_RST_callStartupSubroutine(ref GameBoyCPUState state) {/// RST 1
    
};


void xD0_RET_returnFromSubroutine(ref GameBoyCPUState state) {/// RET NC
    
};


void xD1_POP_(ref GameBoyCPUState state) {/// POP DE
    
};


void xD2_JP_jumpToAddress(ref GameBoyCPUState state) {/// JP NC, a16
    
};


void xD3_INVALID(ref GameBoyCPUState state) {/// #VALUE!
    
};


void xD4_CALL_callSubroutine(ref GameBoyCPUState state) {/// CALL NC, a16
    
};


void xD5_PUSH_(ref GameBoyCPUState state) {/// PUSH DE
    
};


void xD6_SUB_subtract(ref GameBoyCPUState state) {/// SUB d8
    
};


void xD7_RST_callStartupSubroutine(ref GameBoyCPUState state) {/// RST 2
    
};


void xD8_RET_returnFromSubroutine(ref GameBoyCPUState state) {/// RET C
    
};


void xD9_RETI_returnAndEnableInterrupts(ref GameBoyCPUState state) {/// RETI
    
};


void xDA_JP_jumpToAddress(ref GameBoyCPUState state) {/// JP C, a16
    
};


void xDB_INVALID(ref GameBoyCPUState state) {/// #VALUE!
    
};


void xDC_CALL_callSubroutine(ref GameBoyCPUState state) {/// CALL C, a16
    
};


void xDD_INVALID(ref GameBoyCPUState state) {/// #VALUE!
    
};


void xDE_SBC_subtractCarry(ref GameBoyCPUState state) {/// SBC A, d8
    
};


void xDF_RST_callStartupSubroutine(ref GameBoyCPUState state) {/// RST 3
    
};


void xE0_LD_assignValue(ref GameBoyCPUState state) {/// LD (a8), A
    
};


void xE1_POP_(ref GameBoyCPUState state) {/// POP HL
    
};


void xE2_LD_assignValue(ref GameBoyCPUState state) {/// LD (C), A
    
};


void xE3_INVALID(ref GameBoyCPUState state) {/// #VALUE!
    
};


void xE4_INVALID(ref GameBoyCPUState state) {/// #VALUE!
    
};


void xE5_PUSH_(ref GameBoyCPUState state) {/// PUSH HL
    
};


void xE6_AND_bitAnd(ref GameBoyCPUState state) {/// AND d8
    
};


void xE7_RST_callStartupSubroutine(ref GameBoyCPUState state) {/// RST 4
    
};


void xE8_ADD_add(ref GameBoyCPUState state) {/// ADD SP, s8
    
};


void xE9_JP_jumpToAddress(ref GameBoyCPUState state) {/// JP HL
    
};


void xEA_LD_assignValue(ref GameBoyCPUState state) {/// LD (a16), A
    
};


void xEB_INVALID(ref GameBoyCPUState state) {/// #VALUE!
    
};


void xEC_INVALID(ref GameBoyCPUState state) {/// #VALUE!
    
};


void xED_INVALID(ref GameBoyCPUState state) {/// #VALUE!
    
};


void xEE_XOR_bitXor(ref GameBoyCPUState state) {/// XOR d8
    
};


void xEF_RST_callStartupSubroutine(ref GameBoyCPUState state) {/// RST 5
    
};


void xF0_LD_assignValue(ref GameBoyCPUState state) {/// LD A, (a8)
    
};


void xF1_POP_(ref GameBoyCPUState state) {/// POP AF
    
};


void xF2_LD_assignValue(ref GameBoyCPUState state) {/// LD A, (C)
    
};


void xF3_DI_disableInterrupts_clearIME(ref GameBoyCPUState state) {/// DI
    
};


void xF4_INVALID(ref GameBoyCPUState state) {/// #VALUE!
    
};


void xF5_PUSH_(ref GameBoyCPUState state) {/// PUSH AF
    
};


void xF6_OR_bitOr(ref GameBoyCPUState state) {/// OR d8
    
};


void xF7_RST_callStartupSubroutine(ref GameBoyCPUState state) {/// RST 6
    
};


void xF8_LD_assignValue(ref GameBoyCPUState state) {/// LD HL, SP+s8
    
};


void xF9_LD_assignValue(ref GameBoyCPUState state) {/// LD SP, HL
    
};


void xFA_LD_assignValue(ref GameBoyCPUState state) {/// LD A, (a16)
    
};


void xFB_EI_enableInterrupts_setIME(ref GameBoyCPUState state) {/// EI
    
};


void xFC_INVALID(ref GameBoyCPUState state) {/// #VALUE!
    
};


void xFD_INVALID(ref GameBoyCPUState state) {/// #VALUE!
    
};


void xFE_CP_compare(ref GameBoyCPUState state) {/// CP d8
    
};


void xFF_RST_callStartupSubroutine(ref GameBoyCPUState state) {/// RST 7
    
};



} // private