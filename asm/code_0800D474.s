	.include "macro.inc"

	.syntax unified

	thumb_func_start EventGotoLabel
EventGotoLabel: @ 0x0800D474
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	adds r6, r1, #0
	ldr r2, [r3, #0x2c]
	ldr r0, [r2]
	cmp r0, #0
	beq _0800D4C6
	ldr r4, _0800D4A8 @ =0x0000FFFF
	ldr r5, _0800D4AC @ =0x08B9106C
	ldr r0, _0800D4B0 @ =0xFFFFFDE0
	adds r7, r5, r0
_0800D48A:
	ldr r1, [r2]
	adds r0, r1, #0
	ands r0, r4
	cmp r0, #0x44
	bne _0800D4B4
	ldr r0, [r2, #4]
	cmp r0, r6
	bne _0800D4B4
	ldr r0, [r5]
	lsls r0, r0, #2
	adds r0, r2, r0
	str r0, [r3, #0x30]
	movs r0, #1
	b _0800D4C8
	.align 2, 0
_0800D4A8: .4byte 0x0000FFFF
_0800D4AC: .4byte 0x08B9106C
_0800D4B0: .4byte 0xFFFFFDE0
_0800D4B4:
	ands r1, r4
	lsls r0, r1, #3
	adds r0, r0, r7
	ldr r0, [r0]
	lsls r0, r0, #2
	adds r2, r2, r0
	ldr r0, [r2]
	cmp r0, #0
	bne _0800D48A
_0800D4C6:
	movs r0, #2
_0800D4C8:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
