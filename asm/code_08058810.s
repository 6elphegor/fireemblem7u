	.include "macro.inc"

	.syntax unified

	thumb_func_start StartSubSpell_efxElfireBGCOL
StartSubSpell_efxElfireBGCOL: @ 0x08058810
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08058844 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08058848 @ =0x08BA1BD4
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _0805884C @ =0x081E8322
	str r1, [r0, #0x48]
	ldr r1, _08058850 @ =0x0820A4DC
	str r1, [r0, #0x4c]
	adds r0, r1, #0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08058844: .4byte 0x0201774C
_08058848: .4byte 0x08BA1BD4
_0805884C: .4byte 0x081E8322
_08058850: .4byte 0x0820A4DC
