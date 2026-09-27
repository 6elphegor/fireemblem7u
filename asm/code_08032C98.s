	.include "macro.inc"

	.syntax unified

	thumb_func_start StatusHealEffect_PalSpriteAnim_Init
StatusHealEffect_PalSpriteAnim_Init: @ 0x08032C98
	push {r4, lr}
	adds r4, r0, #0
	movs r2, #0
	ldr r0, _08032CB8 @ =0x03004690
	ldr r0, [r0]
	movs r1, #0xc0
	ldrb r0, [r0, #0xb]
	ands r1, r0
	cmp r1, #0x40
	beq _08032CD4
	cmp r1, #0x40
	bgt _08032CBC
	cmp r1, #0
	beq _08032CC2
	b _08032CD6
	.align 2, 0
_08032CB8: .4byte 0x03004690
_08032CBC:
	cmp r1, #0x80
	beq _08032CCC
	b _08032CD6
_08032CC2:
	ldr r2, _08032CC8 @ =0x02022BE0
	b _08032CD6
	.align 2, 0
_08032CC8: .4byte 0x02022BE0
_08032CCC:
	ldr r2, _08032CD0 @ =0x02022C00
	b _08032CD6
	.align 2, 0
_08032CD0: .4byte 0x02022C00
_08032CD4:
	ldr r2, _08032CF0 @ =0x02022C20
_08032CD6:
	movs r1, #0x90
	lsls r1, r1, #2
	adds r0, r2, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	adds r1, r4, #0
	adds r1, #0x4c
	movs r0, #0
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08032CF0: .4byte 0x02022C20
