	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrLvup_DrawPreLevelValue
EkrLvup_DrawPreLevelValue: @ 0x08068F50
	push {r4, lr}
	ldr r4, _08068F84 @ =0x020176F0
	adds r0, r4, #0
	bl ClearText
	adds r0, r4, #0
	movs r1, #8
	bl Text_SetCursor
	adds r0, r4, #0
	movs r1, #2
	bl Text_SetColor
	ldr r0, _08068F88 @ =0x02020108
	ldrh r1, [r0]
	adds r0, r4, #0
	bl Text_DrawNumber
	ldr r1, _08068F8C @ =0x02023E3A
	adds r0, r4, #0
	bl PutText
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08068F84: .4byte 0x020176F0
_08068F88: .4byte 0x02020108
_08068F8C: .4byte 0x02023E3A
