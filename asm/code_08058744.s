	.include "macro.inc"

	.syntax unified

	thumb_func_start StartSubSpell_efxElfireBG
StartSubSpell_efxElfireBG: @ 0x08058744
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, _080587A0 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080587A4 @ =0x08BA1BBC
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	ldr r0, _080587A8 @ =0x08209520
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, [r5, #0x5c]
	ldr r2, _080587AC @ =0x0820A6DC
	adds r1, r2, #0
	bl SpellFx_WriteBgMap
	bl SpellFx_SetBG1Position
	bl SpellFx_SetSomeColorEffect
	ldr r0, _080587B0 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _080587D0
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _080587B4
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b _080587BE
	.align 2, 0
_080587A0: .4byte 0x0201774C
_080587A4: .4byte 0x08BA1BBC
_080587A8: .4byte 0x08209520
_080587AC: .4byte 0x0820A6DC
_080587B0: .4byte 0x0203E02C
_080587B4:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
_080587BE:
	ldr r0, _080587D8 @ =0x0202349C
	movs r1, #0x80
	lsls r1, r1, #1
	str r1, [sp]
	movs r1, #2
	movs r2, #0x14
	movs r3, #1
	bl sub_080669F4
_080587D0:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080587D8: .4byte 0x0202349C
