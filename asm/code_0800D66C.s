	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_GotoIfnFlag
EvtCmd_GotoIfnFlag: @ 0x0800D66C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x2c]
	ldr r0, [r5, #0x30]
	ldr r6, [r0, #4]
	ldr r0, [r0, #8]
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800D6A0
	movs r0, #0
	b _0800D6CA
_0800D686:
	ldr r0, _0800D69C @ =0x08B90E48
	movs r1, #0x89
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r0, [r0]
	lsls r0, r0, #2
	adds r0, r4, r0
	str r0, [r5, #0x30]
	movs r0, #1
	b _0800D6CA
	.align 2, 0
_0800D69C: .4byte 0x08B90E48
_0800D6A0:
	ldr r0, [r4]
	cmp r0, #0
	beq _0800D6C8
	ldr r3, _0800D6D0 @ =0x0000FFFF
	ldr r2, _0800D6D4 @ =0x08B90E4C
_0800D6AA:
	ldr r1, [r4]
	ands r1, r3
	cmp r1, #0x44
	bne _0800D6B8
	ldr r0, [r4, #4]
	cmp r0, r6
	beq _0800D686
_0800D6B8:
	lsls r0, r1, #3
	adds r0, r0, r2
	ldr r0, [r0]
	lsls r0, r0, #2
	adds r4, r4, r0
	ldr r0, [r4]
	cmp r0, #0
	bne _0800D6AA
_0800D6C8:
	movs r0, #2
_0800D6CA:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0800D6D0: .4byte 0x0000FFFF
_0800D6D4: .4byte 0x08B90E4C
