	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B50C4
sub_080B50C4: @ 0x080B50C4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	adds r0, #0x40
	movs r5, #0
	movs r1, #0
	strh r1, [r0]
	adds r0, #8
	strh r1, [r0]
	adds r0, #0xc
	strb r5, [r0]
	ldr r7, _080B5230 @ =0x03002870
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r7, #1]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	movs r2, #4
	orrs r0, r2
	subs r1, #6
	ands r0, r1
	movs r3, #0x10
	mov sb, r3
	mov r1, sb
	orrs r0, r1
	strb r0, [r7, #1]
	adds r0, r4, #0
	adds r0, #0x4a
	ldrb r0, [r0]
	movs r2, #0x30
	ldrsh r1, [r4, r2]
	movs r3, #0x32
	ldrsh r2, [r4, r3]
	bl sub_080B322C
	movs r0, #0x3c
	adds r0, r0, r7
	mov r8, r0
	movs r6, #0x3f
	adds r0, r6, #0
	mov r1, r8
	ldrb r1, [r1]
	ands r0, r1
	mov r2, r8
	strb r0, [r2]
	movs r0, #0x10
	ldr r3, _080B5234 @ =0x030028B4
	strb r0, [r3]
	ldr r0, _080B5238 @ =0x030028B5
	strb r5, [r0]
	movs r1, #0x46
	adds r1, r1, r7
	mov sl, r1
	strb r5, [r1]
	ldr r0, _080B523C @ =0x084221D4
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080B5240 @ =0x08424CD8
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080B5244 @ =0x0819431C
	movs r1, #0xd8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080B5248 @ =0x084225A8
	movs r1, #0xc8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080B524C @ =0x08421C78
	ldr r1, _080B5250 @ =0x06015000
	bl Decompress
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r2, [r7, #1]
	ands r0, r2
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r7, #1]
	movs r3, #0x36
	adds r3, r3, r7
	mov ip, r3
	movs r0, #1
	ldrb r1, [r3]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r2, #4
	orrs r0, r2
	movs r1, #8
	orrs r0, r1
	mov r3, sb
	orrs r0, r3
	adds r3, r7, #0
	adds r3, #0x34
	movs r2, #0x20
	ldrb r1, [r3]
	orrs r1, r2
	strb r1, [r3]
	adds r3, #1
	ldrb r1, [r3]
	orrs r1, r2
	strb r1, [r3]
	orrs r0, r2
	mov r1, ip
	strb r0, [r1]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBlankBgColor
	mov r2, r8
	ldrb r2, [r2]
	ands r6, r2
	mov r3, r8
	strb r6, [r3]
	ldr r0, _080B5234 @ =0x030028B4
	strb r5, [r0]
	ldr r1, _080B5238 @ =0x030028B5
	strb r5, [r1]
	mov r2, sl
	strb r5, [r2]
	ldr r0, _080B5254 @ =0x0000FFE0
	ldrh r3, [r7, #0x3c]
	ands r0, r3
	ldr r1, _080B5258 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xc0
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r7, #0x3c]
	ldr r0, _080B525C @ =0x02000814
	strb r5, [r0]
	movs r0, #0
	bl SetOnHBlankA
	ldr r0, _080B5260 @ =sub_080B37C4
	bl SetOnHBlankA
	adds r0, r4, #0
	bl sub_080B3C04
	adds r0, r4, #0
	bl sub_080B3DA4
	adds r0, r4, #0
	bl sub_080B4F44
	ldr r1, [r4, #0x2c]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080B526C
	movs r0, #0x40
	ands r1, r0
	cmp r1, #0
	beq _080B5264
	movs r0, #1
	movs r1, #0
	bl NewFadeIn
	b _080B526C
	.align 2, 0
_080B5230: .4byte 0x03002870
_080B5234: .4byte 0x030028B4
_080B5238: .4byte 0x030028B5
_080B523C: .4byte 0x084221D4
_080B5240: .4byte 0x08424CD8
_080B5244: .4byte 0x0819431C
_080B5248: .4byte 0x084225A8
_080B524C: .4byte 0x08421C78
_080B5250: .4byte 0x06015000
_080B5254: .4byte 0x0000FFE0
_080B5258: .4byte 0x0000E0FF
_080B525C: .4byte 0x02000814
_080B5260: .4byte sub_080B37C4
_080B5264:
	movs r0, #2
	movs r1, #0
	bl NewFadeIn
_080B526C:
	movs r0, #0
	bl sub_080B2FC0
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
