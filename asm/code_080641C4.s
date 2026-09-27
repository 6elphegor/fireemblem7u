	.include "macro.inc"

	.syntax unified

	thumb_func_start CRSpell_RegisterBgPal
CRSpell_RegisterBgPal: @ 0x080641C4
	push {r4, lr}
	adds r4, r1, #0
	bl GetMagicEffectBufferFor
	ldrh r0, [r0, #0xc]
	lsls r1, r0, #5
	ldr r0, _080641E8 @ =0x02022860
	adds r1, r1, r0
	adds r0, r4, #0
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080641E8: .4byte 0x02022860
