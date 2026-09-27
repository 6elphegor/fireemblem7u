	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08094EF4
sub_08094EF4: @ 0x08094EF4
	push {r4, r5, r6, lr}
	sub sp, #0xc
	adds r6, r0, #0
	adds r4, r1, #0
	mov r1, sp
	ldr r0, _08094F70 @ =0x0840F3E4
	ldm r0!, {r2, r3, r5}
	stm r1!, {r2, r3, r5}
	ldr r0, [sp]
	bl ClearText
	ldr r0, [sp, #4]
	bl ClearText
	ldr r0, [sp, #8]
	bl ClearText
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	beq _08094FA2
	lsls r1, r4, #1
	adds r0, r6, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r4, #0
	bl GetItemUseDescId
	adds r5, r0, #0
	cmp r5, #0
	beq _08094FA2
	adds r0, r6, #0
	adds r1, r4, #0
	bl CanUnitUseItemPrepScreen
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08094F78
	ldr r0, [sp]
	movs r1, #0
	bl Text_SetColor
	ldr r0, [sp, #4]
	movs r1, #0
	bl Text_SetColor
	ldr r0, [sp, #8]
	movs r1, #0
	bl Text_SetColor
	adds r0, r5, #0
	bl DecodeMsg
	adds r1, r0, #0
	ldr r2, _08094F74 @ =0x02022FBE
	mov r0, sp
	movs r3, #3
	bl PrintStringToTexts
	b _08094FA2
	.align 2, 0
_08094F70: .4byte 0x0840F3E4
_08094F74: .4byte 0x02022FBE
_08094F78:
	ldr r0, [sp]
	movs r1, #1
	bl Text_SetColor
	ldr r0, [sp, #4]
	movs r1, #1
	bl Text_SetColor
	ldr r0, [sp, #8]
	movs r1, #1
	bl Text_SetColor
	adds r0, r5, #0
	bl DecodeMsg
	adds r1, r0, #0
	ldr r2, _08094FB0 @ =0x02022FBE
	mov r0, sp
	movs r3, #3
	bl PrintStringToTexts
_08094FA2:
	movs r0, #1
	bl EnableBgSync
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08094FB0: .4byte 0x02022FBE
