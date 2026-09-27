	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804116C
sub_0804116C: @ 0x0804116C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	mov sb, r0
	bl ClearSioBG
	bl sub_08047B34
	ldr r4, _0804128C @ =0x081C6A18
	movs r0, #1
	bl GetBgChrOffset
	adds r1, r0, #0
	ldr r0, _08041290 @ =0x06000C00
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, _08041294 @ =0x081C7F84
	movs r1, #0xc0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08041298 @ =0x081C5BE0
	ldr r1, _0804129C @ =0x06014800
	bl Decompress
	ldr r0, _080412A0 @ =0x081C7F04
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x80
	bl ApplyPaletteExt
	movs r0, #0
	bl sub_08047C38
	ldr r0, _080412A4 @ =0x0203DA60
	bl SetTextFont
	bl ResetTextFont
	bl sub_0803DCF0
	add r0, sp, #8
	bl sub_08041FD4
	movs r0, #1
	movs r1, #0xfe
	movs r2, #0
	bl SetBgOffset
	movs r5, #0
	movs r7, #0xc0
	lsls r7, r7, #1
	ldr r6, _080412A8 @ =0x081D5358
_080411DE:
	lsls r4, r5, #3
	ldr r1, _080412AC @ =0x0203D918
	mov r8, r1
	add r4, r8
	adds r0, r4, #0
	bl ClearText
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetColor
	ldr r0, [r6]
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_DrawString
	ldr r1, _080412B0 @ =0x02022C6C
	adds r1, r7, r1
	adds r0, r4, #0
	bl PutText
	mov r0, sp
	adds r0, r0, r5
	adds r0, #8
	ldrb r1, [r0]
	adds r0, r5, #0
	bl sub_0804203C
	adds r7, #0xc0
	adds r6, #0x14
	adds r5, #1
	cmp r5, #2
	ble _080411DE
	ldr r5, _080412A8 @ =0x081D5358
	ldr r0, [r5, #0x18]
	lsls r0, r0, #1
	ldr r4, _080412B4 @ =0x0202369C
	adds r0, r0, r4
	movs r1, #0
	bl sub_080417BC
	ldr r0, [r5, #0x1c]
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #1
	bl sub_080417BC
	ldr r0, _080412B8 @ =0x081D5260
	mov r4, r8
	subs r4, #0xc
	ldrb r2, [r4]
	adds r0, r2, r0
	ldrb r1, [r0]
	mov r0, sb
	bl sub_08047D80
	ldr r0, _080412BC @ =0x08B98CA8
	ldrb r3, [r4]
	lsls r1, r3, #2
	adds r0, r1, r0
	ldr r0, [r0]
	ldr r2, _080412C0 @ =0x081D5254
	adds r1, r1, r2
	ldr r1, [r1]
	str r3, [sp]
	mov r2, sb
	str r2, [sp, #4]
	movs r2, #0
	movs r3, #8
	bl sub_08047E84
	ldr r0, _080412C4 @ =0x000003C9
	movs r1, #1
	bl PutSioText
	movs r0, #0xf
	bl EnableBgSync
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804128C: .4byte 0x081C6A18
_08041290: .4byte 0x06000C00
_08041294: .4byte 0x081C7F84
_08041298: .4byte 0x081C5BE0
_0804129C: .4byte 0x06014800
_080412A0: .4byte 0x081C7F04
_080412A4: .4byte 0x0203DA60
_080412A8: .4byte 0x081D5358
_080412AC: .4byte 0x0203D918
_080412B0: .4byte 0x02022C6C
_080412B4: .4byte 0x0202369C
_080412B8: .4byte 0x081D5260
_080412BC: .4byte 0x08B98CA8
_080412C0: .4byte 0x081D5254
_080412C4: .4byte 0x000003C9
