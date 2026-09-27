	.include "macro.inc"

	.syntax unified

	thumb_func_start efxHurtmutEff00OBJ_806CF10
efxHurtmutEff00OBJ_806CF10: @ 0x08062AA8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x60]
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #1
	bne _08062AC0
	ldr r0, _08062ABC @ =0x08BA8884
	b _08062AC2
	.align 2, 0
_08062ABC: .4byte 0x08BA8884
_08062AC0:
	ldr r0, _08062AE8 @ =0x08BA8AE0
_08062AC2:
	str r0, [r4, #0x24]
	str r0, [r4, #0x20]
	movs r0, #0
	strh r0, [r4, #6]
	ldr r0, _08062AEC @ =0x081F02C0
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _08062AF0 @ =0x081EFADC
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r5, #0
	bl Proc_Break
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08062AE8: .4byte 0x08BA8AE0
_08062AEC: .4byte 0x081F02C0
_08062AF0: .4byte 0x081EFADC
