	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AFDC0
sub_080AFDC0: @ 0x080AFDC0
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xc8
	lsls r0, r0, #1
	ldrh r1, [r4, #0x2c]
	cmp r1, r0
	bne _080AFDF0
	bl sub_080AEE74
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080AFDE8
	movs r0, #0x3c
	bl FadeBgmOut
	adds r0, r4, #0
	movs r1, #7
	bl Proc_Goto
	b _080AFDF0
_080AFDE8:
	adds r0, r4, #0
	movs r1, #4
	bl Proc_Goto
_080AFDF0:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
