	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080554FC
sub_080554FC: @ 0x080554FC
	push {r4, lr}
	sub sp, #0x10
	asrs r4, r0, #3
	movs r1, #7
	ands r1, r0
	movs r0, #3
	movs r2, #0
	bl SetBgOffset
	lsls r4, r4, #1
	ldr r0, _0805553C @ =0x0201D42C
	adds r4, r4, r0
	ldr r2, _08055540 @ =0x02024460
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x16
	str r0, [sp, #4]
	subs r0, #0x17
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #0x42
	movs r3, #0x20
	bl EfxTmCpyExt
	movs r0, #8
	bl EnableBgSync
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805553C: .4byte 0x0201D42C
_08055540: .4byte 0x02024460
