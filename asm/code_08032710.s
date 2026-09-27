	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08032710
sub_08032710: @ 0x08032710
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, _08032768 @ =0x08B96A4C
	adds r4, r5, #0
	adds r4, #0x5a
	movs r2, #0
	ldrsh r0, [r4, r2]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl sub_0803261C
	ldrh r1, [r4]
	movs r3, #0
	ldrsh r0, [r4, r3]
	cmp r0, #0
	beq _08032734
	subs r0, r1, #1
	strh r0, [r4]
_08032734:
	adds r1, r5, #0
	adds r1, #0x58
	ldrh r2, [r1]
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0x1d
	bgt _08032746
	adds r0, r2, #1
	strh r0, [r1]
_08032746:
	ldrh r1, [r1]
	cmp r1, #0x1e
	bne _08032760
	ldr r0, _0803276C @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #4
	ldrh r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	bne _08032760
	adds r0, r5, #0
	bl Proc_Break
_08032760:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08032768: .4byte 0x08B96A4C
_0803276C: .4byte 0x08B857F8
