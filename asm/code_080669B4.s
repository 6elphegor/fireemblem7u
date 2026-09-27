	.include "macro.inc"

	.syntax unified

	thumb_func_start FillBGRect
FillBGRect: @ 0x080669B4
	push {r4, r5, r6, r7, lr}
	adds r5, r3, #0
	ldr r7, [sp, #0x14]
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	lsls r2, r2, #0x10
	adds r3, r0, #0
	lsrs r2, r2, #0x10
	cmp r2, #0
	beq _080669EC
	movs r0, #0x20
	subs r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r6, r0, #0xf
	lsls r5, r5, #0xc
_080669D2:
	adds r0, r4, #0
	subs r2, #1
	cmp r0, #0
	beq _080669E6
	adds r1, r7, r5
_080669DC:
	strh r1, [r3]
	adds r3, #2
	subs r0, #1
	cmp r0, #0
	bne _080669DC
_080669E6:
	adds r3, r3, r6
	cmp r2, #0
	bne _080669D2
_080669EC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
