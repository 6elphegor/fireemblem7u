	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805AAD8
sub_0805AAD8: @ 0x0805AAD8
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r0, #0x2c
	adds r1, r6, #0
	adds r1, #0x44
	ldr r2, [r6, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt _0805AB12
	ldr r1, [r6, #0x4c]
	ldr r2, [r6, #0x50]
	ldr r5, [r6, #0x54]
	ldr r0, [r6, #0x5c]
	lsls r4, r4, #2
	adds r1, r4, r1
	ldr r1, [r1]
	adds r2, r4, r2
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	adds r4, r4, r5
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
_0805AB12:
	ldrh r0, [r6, #0x2e]
	adds r0, #1
	strh r0, [r6, #0x2e]
	lsls r0, r0, #0x10
	ldrh r2, [r6, #0x30]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _0805AB38
	bl SpellFx_ClearBG1
	ldr r1, _0805AB40 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r6, #0
	bl Proc_Break
_0805AB38:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805AB40: .4byte 0x0201774C
