	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08051BE4
sub_08051BE4: @ 0x08051BE4
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	ldrh r2, [r1, #0x30]
	cmp r0, r2
	bne _08051BFC
	movs r0, #0
	strh r0, [r1, #0x2c]
	adds r0, r1, #0
	bl Proc_Break
	b _08051C00
_08051BFC:
	adds r0, #1
	strh r0, [r1, #0x2c]
_08051C00:
	pop {r0}
	bx r0
