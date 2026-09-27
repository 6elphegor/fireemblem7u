	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080625D0
sub_080625D0: @ 0x080625D0
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0806260C @ =0x08BA421C
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r0, _08062610 @ =0x081F1864
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, _08062614 @ =0x081F2944
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, [r4, #0x5c]
	ldr r1, _08062618 @ =0x081F2B44
	ldr r2, _0806261C @ =0x081F2FE4
	bl SpellFx_WriteBgMap
	bl SpellFx_SetSomeColorEffect
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806260C: .4byte 0x08BA421C
_08062610: .4byte 0x081F1864
_08062614: .4byte 0x081F2944
_08062618: .4byte 0x081F2B44
_0806261C: .4byte 0x081F2FE4
