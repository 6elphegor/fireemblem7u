	.include "macro.inc"

	.syntax unified

	thumb_func_start SpellFx_RegisterObjPal
SpellFx_RegisterObjPal: @ 0x080505F0
	push {lr}
	adds r2, r1, #0
	ldr r1, _08050608 @ =0x02022AA0
	lsls r2, r2, #9
	lsrs r2, r2, #0xb
	bl CpuFastSet
	bl EnablePalSync
	pop {r0}
	bx r0
	.align 2, 0
_08050608: .4byte 0x02022AA0
