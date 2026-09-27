	.include "macro.inc"

	.syntax unified

	thumb_func_start StartPikeTrapAnim
StartPikeTrapAnim: @ 0x0801F07C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	ldr r0, _0801F0A0 @ =0x08B938CC
	adds r1, r4, #0
	bl Proc_StartBlocking
	str r5, [r0, #0x2c]
	str r6, [r0, #0x30]
	cmp r7, #1
	beq _0801F0AA
	cmp r7, #1
	bgt _0801F0A4
	cmp r7, #0
	beq _0801F0B2
	b _0801F0C2
	.align 2, 0
_0801F0A0: .4byte 0x08B938CC
_0801F0A4:
	cmp r7, #3
	beq _0801F0BA
	b _0801F0C2
_0801F0AA:
	adds r1, r0, #0
	adds r1, #0x4a
	movs r0, #0
	b _0801F0C0
_0801F0B2:
	adds r1, r0, #0
	adds r1, #0x4a
	movs r0, #1
	b _0801F0C0
_0801F0BA:
	adds r1, r0, #0
	adds r1, #0x4a
	movs r0, #2
_0801F0C0:
	strh r0, [r1]
_0801F0C2:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
