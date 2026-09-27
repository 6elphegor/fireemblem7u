	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809DCA8
sub_0809DCA8: @ 0x0809DCA8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	mov sb, r0
	movs r0, #0
	str r0, [sp, #4]
	bl sub_0809DAB8
	ldr r1, _0809DD54 @ =0x02014434
	ldr r4, _0809DD58 @ =0x020144D8
	ldrh r0, [r4]
	str r0, [r1]
	ldr r0, _0809DD5C @ =0x02014404
	ldr r0, [r0]
	ldr r7, _0809DD60 @ =0x02014438
	adds r0, r0, r7
	ldrh r1, [r4, #6]
	bl sub_0809D9A4
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	bl sub_0809D82C
	mov r1, sp
	strh r0, [r1]
	movs r5, #0
	add r0, sp, #4
	mov r8, r0
	ldrh r4, [r4, #6]
	cmp r5, r4
	bge _0809DD0E
	adds r4, r7, #0
_0809DCEC:
	bl sub_0809D82C
	ldr r1, _0809DD5C @ =0x02014404
	ldr r2, [r1]
	adds r2, r5, r2
	adds r2, r2, r4
	ldrb r1, [r2]
	subs r0, r1, r0
	ldr r1, _0809DD64 @ =0x02014400
	ldrb r1, [r1]
	ands r0, r1
	strb r0, [r2]
	adds r5, #1
	ldr r0, _0809DD58 @ =0x020144D8
	ldrh r0, [r0, #6]
	cmp r5, r0
	blt _0809DCEC
_0809DD0E:
	bl sub_0809D82C
	mov r1, sp
	strh r0, [r1, #2]
	ldr r5, _0809DD5C @ =0x02014404
	ldr r1, [r5]
	ldr r4, _0809DD60 @ =0x02014438
	adds r1, r1, r4
	mov r0, r8
	bl sub_080BFC70
	ldr r0, [r5]
	adds r0, r0, r4
	ldr r4, _0809DD58 @ =0x020144D8
	ldrh r1, [r4, #6]
	bl sub_0809D9A4
	mov r1, sp
	ldrh r1, [r1]
	adds r0, r1, r0
	ldr r1, _0809DD68 @ =0x000003FF
	adds r2, r1, #0
	ands r0, r2
	mov r1, sp
	ldrh r1, [r1, #2]
	adds r6, r6, r1
	ands r6, r2
	ldrh r1, [r4, #2]
	cmp r1, r0
	bne _0809DD50
	ldrh r4, [r4, #4]
	cmp r4, r6
	beq _0809DD6C
_0809DD50:
	movs r0, #0
	b _0809DD6E
	.align 2, 0
_0809DD54: .4byte 0x02014434
_0809DD58: .4byte 0x020144D8
_0809DD5C: .4byte 0x02014404
_0809DD60: .4byte 0x02014438
_0809DD64: .4byte 0x02014400
_0809DD68: .4byte 0x000003FF
_0809DD6C:
	movs r0, #1
_0809DD6E:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
