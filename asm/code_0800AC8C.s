	.include "macro.inc"

	.syntax unified

	thumb_func_start PopupProc_WaitForPress
PopupProc_WaitForPress: @ 0x0800AC8C
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x30]
	cmp r0, #0
	bge _0800ACAC
	ldr r0, _0800ACA8 @ =0x08B857F8
	ldr r0, [r0]
	ldrh r0, [r0, #8]
	cmp r0, #0
	beq _0800ACBE
	adds r0, r1, #0
	bl Proc_Break
	b _0800ACBE
	.align 2, 0
_0800ACA8: .4byte 0x08B857F8
_0800ACAC:
	cmp r0, #0
	beq _0800ACBE
	subs r0, #1
	str r0, [r1, #0x30]
	cmp r0, #0
	bne _0800ACBE
	adds r0, r1, #0
	bl Proc_Break
_0800ACBE:
	pop {r0}
	bx r0
	.align 2, 0
