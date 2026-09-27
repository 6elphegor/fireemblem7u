	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08062B5C
sub_08062B5C: @ 0x08062B5C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x60]
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #1
	bne _08062B74
	ldr r0, _08062B70 @ =0x08BA8278
	b _08062B76
	.align 2, 0
_08062B70: .4byte 0x08BA8278
_08062B74:
	ldr r0, _08062B9C @ =0x08BA85E4
_08062B76:
	str r0, [r4, #0x24]
	str r0, [r4, #0x20]
	movs r0, #0
	strh r0, [r4, #6]
	ldr r0, _08062BA0 @ =0x081F02C0
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _08062BA4 @ =0x081EF23C
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r5, #0
	bl Proc_Break
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08062B9C: .4byte 0x08BA85E4
_08062BA0: .4byte 0x081F02C0
_08062BA4: .4byte 0x081EF23C
