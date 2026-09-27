	.include "macro.inc"

	.syntax unified

	thumb_func_start EfxDragonDeadFallBody_Loop1
EfxDragonDeadFallBody_Loop1: @ 0x080657A8
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x60]
	ldrh r0, [r4, #0x32]
	movs r3, #0
	strh r0, [r2, #2]
	ldrh r0, [r4, #0x3a]
	strh r0, [r2, #4]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	movs r1, #0x86
	lsls r1, r1, #0x11
	cmp r0, r1
	bne _080657EA
	strh r3, [r4, #0x2c]
	ldr r0, _080657F0 @ =0x08BDAC60
	str r0, [r2, #0x24]
	str r0, [r2, #0x20]
	strh r3, [r2, #6]
	ldr r0, _080657F4 @ =0x082E4064
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _080657F8 @ =0x082E2910
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
_080657EA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080657F0: .4byte 0x08BDAC60
_080657F4: .4byte 0x082E4064
_080657F8: .4byte 0x082E2910
