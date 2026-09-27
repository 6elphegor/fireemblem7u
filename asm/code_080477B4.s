	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080477B4
sub_080477B4: @ 0x080477B4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	ldrb r0, [r0, #1]
	adds r0, #0x10
	lsls r0, r0, #5
	ldr r1, _080477E0 @ =0x02022860
	adds r0, r0, r1
	movs r1, #0x16
	movs r2, #8
	adds r3, r4, #0
	bl StartPalFade
	ldr r0, _080477E4 @ =0x08C9D0BC
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x54]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080477E0: .4byte 0x02022860
_080477E4: .4byte 0x08C9D0BC
