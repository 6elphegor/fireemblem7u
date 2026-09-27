	.include "macro.inc"

	.syntax unified

	thumb_func_start StatusHealEffect_OverlayBg_Init
StatusHealEffect_OverlayBg_Init: @ 0x08032A60
	push {r4, r5, r6, lr}
	bl ClearUi
	ldr r0, _08032AB4 @ =0x083FE094
	ldr r1, _08032AB8 @ =0x06005000
	bl Decompress
	ldr r0, _08032ABC @ =0x083FE11C
	movs r1, #0x60
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r4, _08032AC0 @ =0x02022C60
	ldr r1, _08032AC4 @ =0x083FE13C
	movs r2, #0xca
	lsls r2, r2, #6
	adds r0, r4, #0
	bl TmApplyTsa_thm
	adds r6, r4, #0
	movs r0, #0x80
	lsls r0, r0, #1
	adds r5, r6, r0
	movs r4, #6
_08032A90:
	adds r0, r6, #0
	adds r1, r5, #0
	movs r2, #2
	movs r3, #4
	bl TmCopyRect_thm
	movs r0, #0x80
	lsls r0, r0, #1
	adds r5, r5, r0
	subs r4, #1
	cmp r4, #0
	bge _08032A90
	movs r0, #1
	bl EnableBgSync
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08032AB4: .4byte 0x083FE094
_08032AB8: .4byte 0x06005000
_08032ABC: .4byte 0x083FE11C
_08032AC0: .4byte 0x02022C60
_08032AC4: .4byte 0x083FE13C
