	.include "macro.inc"

	.syntax unified

	thumb_func_start SaveMenuDrawSubSelBoxExt
SaveMenuDrawSubSelBoxExt: @ 0x080A5F18
	push {r4, r5, lr}
	lsls r1, r1, #0x18
	cmp r1, #0
	beq _080A5F7C
	bl DecodeMsg
	adds r5, r0, #0
	ldr r0, _080A5F6C @ =0x02000044
	bl SetTextFont
	ldr r4, _080A5F70 @ =0x0200005C
	adds r0, r4, #0
	bl ClearText
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetCursor
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetColor
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_DrawString
	adds r0, r4, #0
	movs r1, #0x28
	bl Text_SetCursor
	ldr r0, _080A5F74 @ =0x00001265
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_DrawString
	ldr r1, _080A5F78 @ =0x020238AE
	adds r0, r4, #0
	bl PutText
	b _080A5F88
	.align 2, 0
_080A5F6C: .4byte 0x02000044
_080A5F70: .4byte 0x0200005C
_080A5F74: .4byte 0x00001265
_080A5F78: .4byte 0x020238AE
_080A5F7C:
	ldr r0, _080A5F94 @ =0x020238AE
	movs r1, #0xa
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
_080A5F88:
	movs r0, #2
	bl EnableBgSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A5F94: .4byte 0x020238AE
