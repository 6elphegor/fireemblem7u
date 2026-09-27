	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08068EC0
sub_08068EC0: @ 0x08068EC0
	push {r4, r5, lr}
	adds r4, r1, #0
	lsls r5, r4, #3
	ldr r0, _08068F08 @ =0x020176A0
	adds r5, r5, r0
	adds r0, r5, #0
	bl ClearText
	adds r0, r5, #0
	movs r1, #8
	bl Text_SetCursor
	adds r0, r5, #0
	movs r1, #2
	bl Text_SetColor
	ldr r0, _08068F0C @ =0x0202010C
	lsls r4, r4, #1
	adds r0, r4, r0
	ldrh r1, [r0]
	adds r0, r5, #0
	bl Text_DrawNumber
	ldr r0, _08068F10 @ =0x082E5BF0
	adds r4, r4, r0
	ldrh r4, [r4]
	lsls r1, r4, #1
	ldr r0, _08068F14 @ =0x02023C66
	adds r1, r1, r0
	adds r0, r5, #0
	bl PutText
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08068F08: .4byte 0x020176A0
_08068F0C: .4byte 0x0202010C
_08068F10: .4byte 0x082E5BF0
_08068F14: .4byte 0x02023C66
