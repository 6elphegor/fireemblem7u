	.include "macro.inc"

	.syntax unified

	thumb_func_start SetBlankBgColor
SetBlankBgColor: @ 0x080AA154
	push {r4, lr}
	movs r3, #0x1f
	ands r1, r3
	ands r2, r3
	ldr r4, _080AA174 @ =0x02022860
	lsls r2, r2, #0xa
	lsls r1, r1, #5
	adds r2, r2, r1
	ands r3, r0
	adds r2, r2, r3
	strh r2, [r4]
	bl EnablePalSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AA174: .4byte 0x02022860
