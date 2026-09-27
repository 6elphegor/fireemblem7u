	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807D4C0
sub_0807D4C0: @ 0x0807D4C0
	push {r4, lr}
	ldr r0, _0807D4DC @ =0x08CB8984
	bl sub_0807D448
	adds r4, r0, #0
	ldr r0, _0807D4E0 @ =0x08CB898E
	bl sub_0807D448
	lsls r4, r4, #0x10
	lsls r0, r0, #0x10
	cmp r4, r0
	bhi _0807D4E4
	movs r0, #0
	b _0807D4E6
	.align 2, 0
_0807D4DC: .4byte 0x08CB8984
_0807D4E0: .4byte 0x08CB898E
_0807D4E4:
	movs r0, #1
_0807D4E6:
	pop {r4}
	pop {r1}
	bx r1
