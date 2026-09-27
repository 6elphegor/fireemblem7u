	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809C49C
sub_0809C49C: @ 0x0809C49C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	movs r0, #0
	ldr r1, _0809C510 @ =0x02023460
	mov sl, r1
	ldr r6, _0809C514 @ =0x02023C60
	mov sb, r6
	ldr r7, _0809C518 @ =0x02012BFC
	ldr r1, _0809C51C @ =0x02022C60
	mov r8, r1
	movs r6, #0x80
	lsls r6, r6, #4
	adds r6, r6, r7
	mov ip, r6
_0809C4C0:
	adds r1, r0, #1
	str r1, [sp]
	lsls r0, r0, #1
	ldr r6, _0809C520 @ =0x02013BFC
	adds r4, r0, r6
	adds r3, r0, r7
	adds r2, r0, #0
	movs r5, #0x13
_0809C4D0:
	mov r1, r8
	adds r0, r2, r1
	ldrh r0, [r0]
	strh r0, [r3]
	mov r6, ip
	adds r1, r2, r6
	mov r6, sl
	adds r0, r2, r6
	ldrh r0, [r0]
	strh r0, [r1]
	mov r1, sb
	adds r0, r2, r1
	ldrh r0, [r0]
	strh r0, [r4]
	adds r4, #0x40
	adds r3, #0x40
	adds r2, #0x40
	subs r5, #1
	cmp r5, #0
	bge _0809C4D0
	ldr r0, [sp]
	cmp r0, #0x1d
	ble _0809C4C0
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809C510: .4byte 0x02023460
_0809C514: .4byte 0x02023C60
_0809C518: .4byte 0x02012BFC
_0809C51C: .4byte 0x02022C60
_0809C520: .4byte 0x02013BFC
