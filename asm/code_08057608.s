	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08057608
sub_08057608: @ 0x08057608
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _08057638 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805763C @ =0x08BA183C
	movs r1, #3
	bl Proc_Start
	adds r6, r0, #0
	str r4, [r6, #0x5c]
	movs r0, #0
	strh r0, [r6, #0x2c]
	strh r5, [r6, #0x2e]
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _08057640
	movs r0, #0xd8
	b _08057644
	.align 2, 0
_08057638: .4byte 0x0201774C
_0805763C: .4byte 0x08BA183C
_08057640:
	movs r0, #0xd8
	rsbs r0, r0, #0
_08057644:
	str r0, [r6, #0x44]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
