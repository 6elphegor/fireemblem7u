	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080327C4
sub_080327C4: @ 0x080327C4
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r1, #0
	ldr r5, _080327F8 @ =0x08B96A14
	adds r0, r5, #0
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	bne _080327E2
	adds r0, r5, #0
	adds r1, r6, #0
	bl Proc_Start
	adds r4, r0, #0
_080327E2:
	str r7, [r4, #0x2c]
	adds r0, r4, #0
	bl InitSubtitleHelpText
	adds r1, r4, #0
	adds r1, #0x58
	movs r0, #0x1f
	strh r0, [r1]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080327F8: .4byte 0x08B96A14
