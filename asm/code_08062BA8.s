	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08062BA8
sub_08062BA8: @ 0x08062BA8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x60]
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #1
	bne _08062BC0
	ldr r0, _08062BBC @ =0x08BA8894
	b _08062BC2
	.align 2, 0
_08062BBC: .4byte 0x08BA8894
_08062BC0:
	ldr r0, _08062BE8 @ =0x08BA8AF0
_08062BC2:
	str r0, [r4, #0x24]
	str r0, [r4, #0x20]
	movs r0, #0
	strh r0, [r4, #6]
	ldr r0, _08062BEC @ =0x081F02C0
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _08062BF0 @ =0x081EFADC
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r5, #0
	bl Proc_Break
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08062BE8: .4byte 0x08BA8AF0
_08062BEC: .4byte 0x081F02C0
_08062BF0: .4byte 0x081EFADC
