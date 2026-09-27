	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08085ADC
sub_08085ADC: @ 0x08085ADC
	push {r4, r5, lr}
	ldr r5, _08085BDC @ =0x03002870
	movs r4, #0x21
	rsbs r4, r4, #0
	adds r0, r4, #0
	ldrb r1, [r5, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r5, #1]
	adds r2, r5, #0
	adds r2, #0x36
	movs r0, #1
	ldrb r1, [r2]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	adds r2, r5, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r1, r5, #0
	adds r1, #0x44
	movs r3, #0
	movs r0, #0xf
	strb r0, [r1]
	adds r1, #1
	movs r0, #4
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x46
	strb r3, [r0]
	ldr r0, _08085BE0 @ =0x0000FFE0
	ldrh r1, [r5, #0x3c]
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strh r0, [r5, #0x3c]
	ldrb r0, [r2]
	ands r4, r0
	strb r4, [r2]
	ldr r0, _08085BE4 @ =0x0000E0FF
	ldrh r1, [r5, #0x3c]
	ands r0, r1
	movs r2, #0xe0
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r5, #0x3c]
	ldr r0, _08085BE8 @ =0x08403BC4
	ldr r1, _08085BEC @ =0x06002000
	bl Decompress
	ldr r0, _08085BF0 @ =0x06002500
	ldr r1, _08085BF4 @ =0x06015C00
	movs r2, #0x50
	bl CpuFastSet
	ldr r0, _08085BF8 @ =0x06002EA0
	ldr r1, _08085BFC @ =0x06015D40
	movs r2, #8
	bl CpuFastSet
	ldr r0, _08085C00 @ =0x02022860
	movs r1, #0xc0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r0, #1
	movs r1, #2
	bl ApplyIconPalette
	bl ResetTextFont
	ldr r4, _08085C04 @ =0x0202BBF8
	adds r0, r4, #0
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08085BC6
	ldr r0, _08085C08 @ =0x08CC2C00
	movs r1, #3
	bl Proc_Start
_08085BC6:
	ldr r1, _08085C0C @ =0x0202BBB8
	movs r0, #0x10
	ldrb r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	beq _08085C14
	ldr r0, _08085C10 @ =0x08CC2D98
	movs r1, #3
	bl Proc_Start
	b _08085C28
	.align 2, 0
_08085BDC: .4byte 0x03002870
_08085BE0: .4byte 0x0000FFE0
_08085BE4: .4byte 0x0000E0FF
_08085BE8: .4byte 0x08403BC4
_08085BEC: .4byte 0x06002000
_08085BF0: .4byte 0x06002500
_08085BF4: .4byte 0x06015C00
_08085BF8: .4byte 0x06002EA0
_08085BFC: .4byte 0x06015D40
_08085C00: .4byte 0x02022860
_08085C04: .4byte 0x0202BBF8
_08085C08: .4byte 0x08CC2C00
_08085C0C: .4byte 0x0202BBB8
_08085C10: .4byte 0x08CC2D98
_08085C14:
	adds r0, r4, #0
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	cmp r0, #0
	bne _08085C28
	ldr r0, _08085C58 @ =0x08CC2D38
	movs r1, #3
	bl Proc_Start
_08085C28:
	ldr r0, _08085C5C @ =0x0202BBF8
	adds r4, r0, #0
	adds r4, #0x40
	ldrb r1, [r4]
	lsls r0, r1, #0x1c
	lsrs r0, r0, #0x1e
	cmp r0, #0
	bne _08085C40
	ldr r0, _08085C60 @ =0x08CC2C60
	movs r1, #3
	bl Proc_Start
_08085C40:
	ldrb r4, [r4]
	lsls r0, r4, #0x1c
	lsrs r0, r0, #0x1e
	cmp r0, #1
	bne _08085C52
	ldr r0, _08085C64 @ =0x08CC2CE8
	movs r1, #3
	bl Proc_Start
_08085C52:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08085C58: .4byte 0x08CC2D38
_08085C5C: .4byte 0x0202BBF8
_08085C60: .4byte 0x08CC2C60
_08085C64: .4byte 0x08CC2CE8
