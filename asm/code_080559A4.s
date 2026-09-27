	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEfxTwobaiRST
NewEfxTwobaiRST: @ 0x080559A4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _080559E4 @ =0x08BA1504
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r5, [r0, #0x44]
	ldr r2, _080559E8 @ =0x0201FDB8
_080559BE:
	lsrs r0, r1, #1
	rsbs r0, r0, #0
	strh r0, [r2]
	adds r2, #2
	adds r1, #1
	cmp r1, #0x77
	bls _080559BE
	ldr r2, _080559EC @ =0x0201FEF8
	movs r1, #0
_080559D0:
	lsrs r0, r1, #1
	rsbs r0, r0, #0
	strh r0, [r2]
	adds r2, #2
	adds r1, #1
	cmp r1, #0x77
	bls _080559D0
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080559E4: .4byte 0x08BA1504
_080559E8: .4byte 0x0201FDB8
_080559EC: .4byte 0x0201FEF8
