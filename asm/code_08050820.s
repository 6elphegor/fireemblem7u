	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEfxspdquake
NewEfxspdquake: @ 0x08050820
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0805083C @ =0x08B9AFE4
	movs r1, #1
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	ldr r1, _08050840 @ =0x081D7F22
	str r1, [r0, #0x44]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805083C: .4byte 0x08B9AFE4
_08050840: .4byte 0x081D7F22
