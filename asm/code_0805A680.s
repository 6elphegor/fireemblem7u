	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805A680
sub_0805A680: @ 0x0805A680
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _0805A6BE
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	ldr r0, _0805A6EC @ =0x0202349C
	ldr r1, _0805A6F0 @ =0x0000011F
	str r1, [sp]
	movs r1, #2
	movs r2, #0x14
	movs r3, #1
	bl FillBGRect
_0805A6BE:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x30]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _0805A6E4
	bl SpellFx_ClearBG1
	ldr r1, _0805A6F4 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
_0805A6E4:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805A6EC: .4byte 0x0202349C
_0805A6F0: .4byte 0x0000011F
_0805A6F4: .4byte 0x0201774C
