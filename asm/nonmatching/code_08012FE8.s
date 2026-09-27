	.include "macro.inc"

	.syntax unified

	thumb_func_start Interpolate
Interpolate: @ 0x08012FE8
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	ldr r5, [sp, #0x10]
	cmp r5, #0
	bne _08012FF6
	adds r0, r2, #0
	b _080130AA
_08012FF6:
	cmp r0, #5
	bhi _080130A8
	lsls r0, r0, #2
	ldr r1, _08013004 @ =_08013008
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08013004: .4byte _08013008
_08013008: @ jump table
	.4byte _08013020 @ case 0
	.4byte _0801302C @ case 1
	.4byte _0801303C @ case 2
	.4byte _08013050 @ case 3
	.4byte _08013074 @ case 4
	.4byte _08013086 @ case 5
_08013020:
	subs r0, r2, r6
	adds r2, r0, #0
	muls r2, r3, r2
	adds r0, r2, #0
	adds r1, r5, #0
	b _0801306C
_0801302C:
	adds r0, r3, #0
	muls r0, r3, r0
	subs r1, r2, r6
	adds r2, r0, #0
	muls r2, r1, r2
	adds r1, r5, #0
	muls r1, r5, r1
	b _0801306A
_0801303C:
	adds r0, r3, #0
	muls r0, r3, r0
	adds r1, r0, #0
	muls r1, r3, r1
	subs r0, r2, r6
	adds r2, r1, #0
	muls r2, r0, r2
	adds r0, r5, #0
	muls r0, r5, r0
	b _08013066
_08013050:
	adds r0, r3, #0
	muls r0, r3, r0
	muls r0, r3, r0
	adds r1, r0, #0
	muls r1, r3, r1
	subs r0, r2, r6
	adds r2, r1, #0
	muls r2, r0, r2
	adds r0, r5, #0
	muls r0, r5, r0
	muls r0, r5, r0
_08013066:
	adds r1, r0, #0
	muls r1, r5, r1
_0801306A:
	adds r0, r2, #0
_0801306C:
	bl Div
	adds r0, r6, r0
	b _080130AA
_08013074:
	subs r1, r5, r3
	adds r0, r1, #0
	muls r0, r1, r0
	subs r4, r2, r6
	adds r2, r0, #0
	muls r2, r4, r2
	adds r1, r5, #0
	muls r1, r5, r1
	b _0801309C
_08013086:
	subs r1, r5, r3
	adds r0, r1, #0
	muls r0, r1, r0
	muls r0, r1, r0
	subs r4, r2, r6
	adds r2, r0, #0
	muls r2, r4, r2
	adds r0, r5, #0
	muls r0, r5, r0
	adds r1, r0, #0
	muls r1, r5, r1
_0801309C:
	adds r0, r2, #0
	bl Div
	adds r4, r6, r4
	subs r0, r4, r0
	b _080130AA
_080130A8:
	movs r0, #0
_080130AA:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
