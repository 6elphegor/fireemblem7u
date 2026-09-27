	.include "macro.inc"

	.syntax unified

	thumb_func_start SpellFx_RegisterBgPal
SpellFx_RegisterBgPal: @ 0x08050634
	push {lr}
	adds r2, r1, #0
	ldr r1, _0805064C @ =0x02022880
	lsls r2, r2, #9
	lsrs r2, r2, #0xb
	bl CpuFastSet
	bl EnablePalSync
	pop {r0}
	bx r0
	.align 2, 0
_0805064C: .4byte 0x02022880
