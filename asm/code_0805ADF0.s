	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805ADF0
sub_0805ADF0: @ 0x0805ADF0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r5, r2, #0
	ldr r1, _0805AE20 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805AE24 @ =0x08BA2990
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	adds r0, r4, #0
	adds r1, r6, #0
	bl NewEfxFlashBgWhite
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805AE20: .4byte 0x0201774C
_0805AE24: .4byte 0x08BA2990
