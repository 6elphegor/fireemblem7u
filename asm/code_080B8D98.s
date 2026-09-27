	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B8D98
sub_080B8D98: @ 0x080B8D98
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080B8DC4 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #8
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080B8DC8
	bl IsGamePlayedThrough
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B8DC8
	adds r0, r4, #0
	bl Proc_Break
	ldr r0, [r4, #0x14]
	movs r1, #0x64
	bl Proc_Goto
	b _080B8E70
	.align 2, 0
_080B8DC4: .4byte 0x08B857F8
_080B8DC8:
	ldr r0, [r4, #0x3c]
	cmp r0, #0
	beq _080B8DD2
	subs r0, #1
	b _080B8E6E
_080B8DD2:
	movs r0, #0
	bl SetTextFont
	ldr r0, [r4, #0x44]
	ldrb r0, [r0]
	cmp r0, #7
	bhi _080B8E62
	lsls r0, r0, #2
	ldr r1, _080B8DEC @ =_080B8DF0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B8DEC: .4byte _080B8DF0
_080B8DF0: @ jump table
	.4byte _080B8E10 @ case 0
	.4byte _080B8E18 @ case 1
	.4byte _080B8E62 @ case 2
	.4byte _080B8E62 @ case 3
	.4byte _080B8E3A @ case 4
	.4byte _080B8E44 @ case 5
	.4byte _080B8E4E @ case 6
	.4byte _080B8E58 @ case 7
_080B8E10:
	adds r0, r4, #0
	bl Proc_Break
	b _080B8E6C
_080B8E18:
	ldr r0, [r4, #0x44]
	adds r0, #1
	str r0, [r4, #0x44]
	ldr r0, [r4, #0x48]
	adds r0, #8
	str r0, [r4, #0x48]
	ldr r1, [r4, #0x3c]
	adds r1, #0x10
	str r1, [r4, #0x3c]
	movs r1, #0
	bl Text_SetCursor
	ldr r0, [r4, #0x48]
	movs r1, #0
	bl Text_SetColor
	b _080B8E6C
_080B8E3A:
	movs r0, #8
	str r0, [r4, #0x3c]
	ldr r0, [r4, #0x44]
	adds r0, #1
	b _080B8E6A
_080B8E44:
	movs r0, #0x10
	str r0, [r4, #0x3c]
	ldr r0, [r4, #0x44]
	adds r0, #1
	b _080B8E6A
_080B8E4E:
	movs r0, #0x20
	str r0, [r4, #0x3c]
	ldr r0, [r4, #0x44]
	adds r0, #1
	b _080B8E6A
_080B8E58:
	movs r0, #0x40
	str r0, [r4, #0x3c]
	ldr r0, [r4, #0x44]
	adds r0, #1
	b _080B8E6A
_080B8E62:
	ldr r0, [r4, #0x48]
	ldr r1, [r4, #0x44]
	bl Text_DrawCharacter
_080B8E6A:
	str r0, [r4, #0x44]
_080B8E6C:
	ldr r0, [r4, #0x40]
_080B8E6E:
	str r0, [r4, #0x3c]
_080B8E70:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
