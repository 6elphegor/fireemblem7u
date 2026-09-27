	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEfxChillEffectBGCOL
NewEfxChillEffectBGCOL: @ 0x08063ADC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08063B00 @ =0x08BA46C8
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _08063B04 @ =0x081E9748
	str r1, [r0, #0x48]
	ldr r1, _08063B08 @ =0x082B3D7C
	str r1, [r0, #0x4c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08063B00: .4byte 0x08BA46C8
_08063B04: .4byte 0x081E9748
_08063B08: .4byte 0x082B3D7C
