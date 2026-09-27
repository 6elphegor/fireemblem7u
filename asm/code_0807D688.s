	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807D688
sub_0807D688: @ 0x0807D688
	push {lr}
	ldr r0, _0807D6AC @ =0x08CBB47C
	bl Proc_EndEach
	ldr r2, _0807D6B0 @ =0x0202BBB8
	ldrh r0, [r2, #0xc]
	adds r0, #0xf
	movs r3, #0x10
	rsbs r3, r3, #0
	adds r1, r3, #0
	ands r0, r1
	strh r0, [r2, #0xc]
	movs r0, #4
	bl Sound_FadeOutSE
	pop {r0}
	bx r0
	.align 2, 0
_0807D6AC: .4byte 0x08CBB47C
_0807D6B0: .4byte 0x0202BBB8
