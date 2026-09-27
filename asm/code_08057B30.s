	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08057B30
sub_08057B30: @ 0x08057B30
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, _08057B74 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08057B78 @ =0x08BA18D4
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x70
	strh r0, [r4, #0x2e]
	ldr r0, _08057B7C @ =0x0827AC10
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r2, _08057B80 @ =0x0827C028
	ldr r0, [r4, #0x5c]
	adds r1, r2, #0
	bl SpellFx_WriteBgMap
	bl SpellFx_SetBG1Position
	bl SpellFx_SetSomeColorEffect
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08057B74: .4byte 0x0201774C
_08057B78: .4byte 0x08BA18D4
_08057B7C: .4byte 0x0827AC10
_08057B80: .4byte 0x0827C028
