	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809D15C
sub_0809D15C: @ 0x0809D15C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	movs r4, #0
	ldr r0, _0809D1CC @ =0x02023C60
	mov sl, r0
_0809D170:
	ldr r2, [sp]
	adds r1, r4, r2
	cmp r1, #0x1d
	bhi _0809D1E0
	adds r3, r4, #1
	mov sb, r3
	ldr r2, _0809D1D0 @ =0x02012BFC
	lsls r1, r1, #1
	movs r3, #0x80
	lsls r3, r3, #5
	adds r0, r2, r3
	adds r0, r0, r1
	mov ip, r0
	adds r7, r1, r2
	adds r6, r1, #0
	lsls r0, r4, #1
	ldr r4, _0809D1D4 @ =0x02022C60
	adds r5, r0, r4
	adds r3, r0, #0
	ldr r0, _0809D1D8 @ =0x02023460
	mov r8, r0
	movs r4, #0x13
_0809D19C:
	ldrh r0, [r7]
	strh r0, [r5]
	mov r2, r8
	adds r1, r3, r2
	ldr r2, _0809D1DC @ =0x020133FC
	adds r0, r6, r2
	ldrh r0, [r0]
	strh r0, [r1]
	mov r0, sl
	adds r1, r3, r0
	mov r2, ip
	ldrh r0, [r2]
	strh r0, [r1]
	movs r0, #0x40
	add ip, r0
	adds r7, #0x40
	adds r6, #0x40
	adds r5, #0x40
	adds r3, #0x40
	subs r4, #1
	cmp r4, #0
	bge _0809D19C
	b _0809D208
	.align 2, 0
_0809D1CC: .4byte 0x02023C60
_0809D1D0: .4byte 0x02012BFC
_0809D1D4: .4byte 0x02022C60
_0809D1D8: .4byte 0x02023460
_0809D1DC: .4byte 0x020133FC
_0809D1E0:
	adds r1, r4, #1
	mov sb, r1
	movs r3, #0
	lsls r0, r4, #1
	mov r4, sl
	adds r2, r0, r4
	ldr r4, _0809D224 @ =0x02023460
	adds r1, r0, r4
	ldr r4, _0809D228 @ =0x02022C60
	adds r0, r0, r4
	movs r4, #0x13
_0809D1F6:
	strh r3, [r0]
	strh r3, [r1]
	strh r3, [r2]
	adds r2, #0x40
	adds r1, #0x40
	adds r0, #0x40
	subs r4, #1
	cmp r4, #0
	bge _0809D1F6
_0809D208:
	mov r4, sb
	cmp r4, #0x1d
	ble _0809D170
	movs r0, #7
	bl EnableBgSync
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809D224: .4byte 0x02023460
_0809D228: .4byte 0x02022C60
