	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080641EC
sub_080641EC: @ 0x080641EC
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	bl GetMagicEffectBufferFor
	adds r4, r0, #0
	ldrh r0, [r4, #0xe]
	lsls r5, r0, #5
	ldr r0, _08064218 @ =0x06010000
	adds r5, r5, r0
	ldr r1, [r4, #0x20]
	adds r0, r6, #0
	bl LZ77UnCompWram
	ldr r0, [r4, #0x20]
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r5, #0
	bl RegisterDataMove
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08064218: .4byte 0x06010000
