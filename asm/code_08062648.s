	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08062648
sub_08062648: @ 0x08062648
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0806266C @ =0x08BA4234
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _08062670 @ =0x081E9650
	str r1, [r0, #0x48]
	ldr r1, _08062674 @ =0x081F2944
	str r1, [r0, #0x4c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806266C: .4byte 0x08BA4234
_08062670: .4byte 0x081E9650
_08062674: .4byte 0x081F2944
