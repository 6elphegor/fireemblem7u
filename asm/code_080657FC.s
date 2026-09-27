	.include "macro.inc"

	.syntax unified

	thumb_func_start EfxDragonDeadFallBody_Loop2
EfxDragonDeadFallBody_Loop2: @ 0x080657FC
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldrh r0, [r4, #0x32]
	strh r0, [r1, #2]
	ldrh r0, [r4, #0x3a]
	strh r0, [r1, #4]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x2e
	bne _08065830
	ldr r0, _08065838 @ =0x082E4064
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0806583C @ =0x082E1A30
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
_08065830:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08065838: .4byte 0x082E4064
_0806583C: .4byte 0x082E1A30
