	.include "macro.inc"

	.syntax unified

	thumb_func_start HelpBoxDrawOneLineExt
HelpBoxDrawOneLineExt: @ 0x08082B6C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	bl SetTextFont
	movs r6, #0
_08082B78:
	lsls r1, r6, #2
	adds r0, r4, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldr r5, [r0]
	ldrb r1, [r5, #4]
	lsls r0, r1, #3
	ldr r1, [r4, #0x2c]
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_SetCursor
_08082B94:
	ldr r0, [r4, #0x2c]
	ldrb r1, [r0]
	cmp r1, #1
	beq _08082BB4
	cmp r1, #1
	bgt _08082BA6
	cmp r1, #0
	beq _08082BCC
	b _08082BC0
_08082BA6:
	cmp r1, #5
	bgt _08082BC0
	cmp r1, #4
	blt _08082BC0
	adds r0, #1
	str r0, [r4, #0x2c]
	b _08082B94
_08082BB4:
	adds r0, #1
	str r0, [r4, #0x2c]
	adds r6, #1
	cmp r6, #5
	ble _08082B78
	b _08082BCC
_08082BC0:
	ldr r1, [r4, #0x2c]
	adds r0, r5, #0
	bl Text_DrawCharacter
	str r0, [r4, #0x2c]
	b _08082B94
_08082BCC:
	ldr r0, [r4, #0x30]
	bl SetTextFont
	pop {r4, r5, r6}
	pop {r0}
	bx r0
