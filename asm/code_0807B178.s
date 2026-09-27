	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807B178
sub_0807B178: @ 0x0807B178
	push {lr}
	ldr r0, _0807B184 @ =DragonGatefx_LightHBlank
	bl SetOnHBlankA
	pop {r0}
	bx r0
	.align 2, 0
_0807B184: .4byte DragonGatefx_LightHBlank
