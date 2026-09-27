	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08062A5C
sub_08062A5C: @ 0x08062A5C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x60]
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #1
	bne _08062A74
	ldr r0, _08062A70 @ =0x08BA8230
	b _08062A76
	.align 2, 0
_08062A70: .4byte 0x08BA8230
_08062A74:
	ldr r0, _08062A9C @ =0x08BA859C
_08062A76:
	str r0, [r4, #0x24]
	str r0, [r4, #0x20]
	movs r0, #0
	strh r0, [r4, #6]
	ldr r0, _08062AA0 @ =0x081F02C0
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _08062AA4 @ =0x081EF23C
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r5, #0
	bl Proc_Break
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08062A9C: .4byte 0x08BA859C
_08062AA0: .4byte 0x081F02C0
_08062AA4: .4byte 0x081EF23C
