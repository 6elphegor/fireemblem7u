	.include "macro.inc"

	.syntax unified

	thumb_func_start WorldFlushInit
WorldFlushInit: @ 0x080B608C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r1, #0
	str r1, [r0, #0x2c]
	bl InitScanlineEffect
	ldr r2, _080B6178 @ =0x030028AC
	mov ip, r2
	ldr r0, _080B617C @ =0x0000FFE0
	ldrh r1, [r2]
	ands r0, r1
	movs r1, #0x1f
	orrs r0, r1
	strh r0, [r2]
	subs r2, #0x3c
	mov r0, ip
	subs r0, #0xf
	movs r1, #0
	strb r1, [r0]
	adds r0, #4
	strb r1, [r0]
	mov r1, ip
	subs r1, #0x10
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	movs r0, #0x20
	mov r8, r0
	mov r0, r8
	ldrb r1, [r2, #1]
	orrs r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	movs r2, #8
	rsbs r2, r2, #0
	add r2, ip
	mov sb, r2
	mov r1, r8
	ldrb r0, [r2]
	orrs r1, r0
	mov r7, ip
	subs r7, #6
	movs r2, #0x21
	rsbs r2, r2, #0
	mov sl, r2
	mov r0, sl
	ldrb r2, [r7]
	ands r0, r2
	movs r6, #1
	orrs r1, r6
	movs r3, #2
	orrs r1, r3
	movs r5, #4
	orrs r1, r5
	movs r4, #8
	orrs r1, r4
	movs r2, #0x10
	orrs r1, r2
	orrs r0, r6
	orrs r0, r3
	orrs r0, r5
	orrs r0, r4
	orrs r0, r2
	mov r2, r8
	orrs r1, r2
	mov r2, sb
	strb r1, [r2]
	mov r1, sl
	ands r0, r1
	strb r0, [r7]
	movs r0, #0x3f
	mov r2, ip
	ldrb r2, [r2]
	ands r0, r2
	movs r1, #0x80
	orrs r0, r1
	mov r1, ip
	strb r0, [r1]
	movs r2, #0
	strb r2, [r1, #8]
	strb r2, [r1, #9]
	strb r2, [r1, #0xa]
	ldr r0, _080B6180 @ =0x02000814
	ldrb r1, [r0]
	orrs r3, r1
	strb r3, [r0]
	movs r0, #0
	bl SetOnHBlankA
	ldr r0, _080B6184 @ =WorldFlushHBlank
	bl SetOnHBlankA
	ldr r0, _080B6188 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080B6168
	ldr r0, _080B618C @ =0x00000269
	bl m4aSongNumStart
_080B6168:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B6178: .4byte 0x030028AC
_080B617C: .4byte 0x0000FFE0
_080B6180: .4byte 0x02000814
_080B6184: .4byte WorldFlushHBlank
_080B6188: .4byte 0x0202BBF8
_080B618C: .4byte 0x00000269
