	.include "macro.inc"

	.syntax unified

	thumb_func_start ProcUnkTrapAnimFunc
ProcUnkTrapAnimFunc: @ 0x0801EDF0
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r1, [r5, #0x2c]
	lsls r1, r1, #4
	ldr r3, _0801EE4C @ =0x0202BBB8
	movs r2, #0xc
	ldrsh r0, [r3, r2]
	subs r0, #8
	subs r1, r1, r0
	ldr r0, _0801EE50 @ =0x000001FF
	ands r1, r0
	ldr r2, [r5, #0x30]
	lsls r2, r2, #4
	movs r4, #0xe
	ldrsh r0, [r3, r4]
	subs r0, #8
	subs r2, r2, r0
	movs r0, #0xff
	ands r2, r0
	movs r3, #0x99
	lsls r3, r3, #6
	ldr r0, _0801EE54 @ =0x083EDA80
	movs r4, #0
	str r4, [sp]
	str r4, [sp, #4]
	bl StartSpriteAnimProc
	ldr r0, [r5, #0x5c]
	subs r0, #1
	str r0, [r5, #0x5c]
	cmp r0, #0
	bgt _0801EE3A
	adds r0, r5, #0
	movs r1, #0x64
	bl Proc_Goto
_0801EE3A:
	ldr r0, [r5, #0x58]
	cmp r0, #1
	beq _0801EE76
	cmp r0, #1
	bgt _0801EE58
	cmp r0, #0
	beq _0801EE70
	b _0801EE7C
	.align 2, 0
_0801EE4C: .4byte 0x0202BBB8
_0801EE50: .4byte 0x000001FF
_0801EE54: .4byte 0x083EDA80
_0801EE58:
	cmp r0, #2
	beq _0801EE68
	cmp r0, #3
	bne _0801EE7C
	ldr r0, [r5, #0x30]
	subs r0, #1
	str r0, [r5, #0x30]
	b _0801EE7C
_0801EE68:
	ldr r0, [r5, #0x30]
	adds r0, #1
	str r0, [r5, #0x30]
	b _0801EE7C
_0801EE70:
	ldr r0, [r5, #0x2c]
	subs r0, #1
	b _0801EE7A
_0801EE76:
	ldr r0, [r5, #0x2c]
	adds r0, #1
_0801EE7A:
	str r0, [r5, #0x2c]
_0801EE7C:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
