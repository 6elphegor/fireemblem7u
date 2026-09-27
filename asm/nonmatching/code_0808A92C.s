	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0808A92C
sub_0808A92C: @ 0x0808A92C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov r8, r0
	mov r2, r8
	adds r2, #0x38
	ldr r0, _0808AA14 @ =0x08CC3432
	mov r1, r8
	ldrh r1, [r1, #0x3c]
	adds r0, r1, r0
	ldrb r3, [r2]
	ldrb r0, [r0]
	adds r0, r3, r0
	strb r0, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x14
	bls _0808A95A
	movs r0, #0x14
	strb r0, [r2]
_0808A95A:
	mov r5, r8
	ldrh r0, [r5, #0x3c]
	adds r0, #1
	strh r0, [r5, #0x3c]
	mov r0, r8
	adds r0, #0x36
	mov r1, r8
	adds r1, #0x37
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bls _0808AA28
	movs r5, #0
	str r2, [sp]
	ldrb r6, [r2]
	cmp r5, r6
	blt _0808A97E
	b _0808AAC0
_0808A97E:
	str r2, [sp, #8]
_0808A980:
	mov r7, r8
	ldrh r7, [r7, #0x3e]
	lsrs r4, r7, #3
	adds r0, r4, #0
	adds r0, #0xc
	adds r6, r5, #0
	adds r6, #0x1c
	movs r1, #8
	adds r1, r1, r5
	mov ip, r1
	adds r5, #1
	mov sl, r5
	cmp r4, r0
	bge _0808A9DA
	str r6, [sp, #4]
	lsls r1, r1, #1
	str r1, [sp, #0xc]
	movs r2, #0x1f
	mov sb, r2
_0808A9A6:
	adds r3, r4, #0
	mov r5, sb
	ands r3, r5
	lsls r1, r3, #5
	ldr r2, [sp, #4]
	ldr r7, [sp, #8]
	ldrb r7, [r7]
	subs r0, r2, r7
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _0808AA18 @ =0x02022C60
	adds r1, r1, r0
	lsls r0, r3, #6
	ldr r2, [sp, #0xc]
	adds r0, r2, r0
	ldr r3, _0808AA1C @ =0x0200CCF0
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	mov r5, r8
	ldrh r5, [r5, #0x3e]
	lsrs r0, r5, #3
	adds r0, #0xc
	cmp r4, r0
	blt _0808A9A6
_0808A9DA:
	ldr r7, _0808AA20 @ =0x02023C60
	mov sb, r7
	adds r5, r6, #0
	mov r1, ip
	lsls r0, r1, #1
	ldr r3, _0808AA24 @ =0x0200D4F0
	adds r2, r0, r3
	movs r3, #0xa0
	movs r4, #1
_0808A9EC:
	ldr r6, [sp, #8]
	ldrb r6, [r6]
	subs r0, r5, r6
	adds r0, r3, r0
	lsls r0, r0, #1
	add r0, sb
	ldrh r1, [r2]
	strh r1, [r0]
	adds r2, #0x40
	adds r3, #0x20
	subs r4, #1
	cmp r4, #0
	bge _0808A9EC
	mov r5, sl
	ldr r7, [sp, #8]
	ldrb r7, [r7]
	cmp r5, r7
	blt _0808A980
	b _0808AAC0
	.align 2, 0
_0808AA14: .4byte 0x08CC3432
_0808AA18: .4byte 0x02022C60
_0808AA1C: .4byte 0x0200CCF0
_0808AA20: .4byte 0x02023C60
_0808AA24: .4byte 0x0200D4F0
_0808AA28:
	movs r5, #0
	str r2, [sp]
	ldrb r0, [r2]
	cmp r5, r0
	bge _0808AAC0
	str r2, [sp, #8]
_0808AA34:
	mov r1, r8
	ldrh r1, [r1, #0x3e]
	lsrs r4, r1, #3
	adds r0, r4, #0
	adds r0, #0xc
	adds r6, r5, #0
	adds r6, #0x1c
	adds r2, r5, #1
	mov sl, r2
	cmp r4, r0
	bge _0808AA8A
	mov ip, r6
	movs r3, #0x1f
	mov sb, r3
_0808AA50:
	adds r3, r4, #0
	mov r7, sb
	ands r3, r7
	lsls r2, r3, #5
	adds r2, #8
	adds r2, r2, r5
	lsls r2, r2, #1
	ldr r0, _0808AAE4 @ =0x02022C60
	adds r2, r2, r0
	str r2, [sp, #0xc]
	mov r2, ip
	ldr r1, [sp, #8]
	ldrb r1, [r1]
	subs r0, r2, r1
	lsls r0, r0, #1
	lsls r1, r3, #6
	adds r0, r0, r1
	ldr r2, _0808AAE8 @ =0x0200CCF0
	adds r0, r0, r2
	ldrh r0, [r0]
	ldr r3, [sp, #0xc]
	strh r0, [r3]
	adds r4, #1
	mov r7, r8
	ldrh r7, [r7, #0x3e]
	lsrs r0, r7, #3
	adds r0, #0xc
	cmp r4, r0
	blt _0808AA50
_0808AA8A:
	movs r4, #0
	ldr r0, _0808AAEC @ =0x0200D4F0
	mov ip, r0
	adds r3, r6, #0
	adds r0, r5, #0
	adds r0, #0xa8
	lsls r0, r0, #1
	ldr r1, _0808AAF0 @ =0x02023C60
	adds r2, r0, r1
_0808AA9C:
	ldr r5, [sp, #8]
	ldrb r5, [r5]
	subs r0, r3, r5
	lsls r0, r0, #1
	lsls r1, r4, #6
	adds r0, r0, r1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r2]
	adds r2, #0x40
	adds r4, #1
	cmp r4, #1
	ble _0808AA9C
	mov r5, sl
	ldr r6, [sp, #8]
	ldrb r6, [r6]
	cmp r5, r6
	blt _0808AA34
_0808AAC0:
	movs r0, #5
	bl EnableBgSync
	ldr r7, [sp]
	ldrb r7, [r7]
	cmp r7, #0x13
	bls _0808AAD4
	mov r0, r8
	bl Proc_Break
_0808AAD4:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808AAE4: .4byte 0x02022C60
_0808AAE8: .4byte 0x0200CCF0
_0808AAEC: .4byte 0x0200D4F0
_0808AAF0: .4byte 0x02023C60
