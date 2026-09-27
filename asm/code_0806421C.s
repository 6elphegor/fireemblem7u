	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0806421C
sub_0806421C: @ 0x0806421C
	push {r4, lr}
	adds r4, r1, #0
	bl GetMagicEffectBufferFor
	ldrh r0, [r0, #0x10]
	lsls r1, r0, #5
	ldr r0, _08064240 @ =0x02022A60
	adds r1, r1, r0
	adds r0, r4, #0
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08064240: .4byte 0x02022A60
