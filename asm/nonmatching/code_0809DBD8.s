	.include "macro.inc"

	.syntax unified

	thumb_func_start ModifyPassword
ModifyPassword: @ 0x0809DBD8
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	ldr r6, _0809DC90 @ =0x02014438
	ldr r5, _0809DC94 @ =0x02014404
	adds r2, r6, #0
	movs r1, #0
	adds r0, r6, #0
	adds r0, #0x9f
_0809DBEE:
	strb r1, [r0]
	subs r0, #1
	cmp r0, r2
	bge _0809DBEE
	ldr r1, [r5]
	adds r1, r1, r6
	mov r0, sp
	bl _call_via_r3
	ldr r0, [sp]
	bl sub_0809D800
	ldr r4, _0809DC98 @ =0x020144D8
	strh r0, [r4, #6]
	ldr r0, [r5]
	adds r0, r0, r6
	ldrh r1, [r4, #6]
	bl sub_0809D9A4
	strh r0, [r4, #2]
	bl GetGameTime
	lsrs r0, r0, #3
	ldrh r1, [r4, #2]
	adds r0, r1, r0
	ldr r5, _0809DC9C @ =0x000003FF
	ands r0, r5
	strh r0, [r4]
	ldr r1, _0809DCA0 @ =0x02014434
	ldrh r0, [r4]
	str r0, [r1]
	bl sub_0809D82C
	ldrh r1, [r4, #2]
	adds r0, r0, r1
	ands r0, r5
	strh r0, [r4, #2]
	movs r5, #0
	ldrh r4, [r4, #6]
	cmp r5, r4
	bge _0809DC64
	adds r4, r6, #0
_0809DC42:
	bl sub_0809D82C
	ldr r1, _0809DC94 @ =0x02014404
	ldr r2, [r1]
	adds r2, r5, r2
	adds r2, r2, r4
	ldrb r1, [r2]
	adds r0, r1, r0
	ldr r1, _0809DCA4 @ =0x02014400
	ldrb r1, [r1]
	ands r0, r1
	strb r0, [r2]
	adds r5, #1
	ldr r0, _0809DC98 @ =0x020144D8
	ldrh r0, [r0, #6]
	cmp r5, r0
	blt _0809DC42
_0809DC64:
	ldr r0, _0809DC94 @ =0x02014404
	ldr r0, [r0]
	ldr r1, _0809DC90 @ =0x02014438
	adds r0, r0, r1
	ldr r5, _0809DC98 @ =0x020144D8
	ldrh r1, [r5, #6]
	bl sub_0809D9A4
	adds r4, r0, #0
	bl sub_0809D82C
	adds r4, r4, r0
	ldr r1, _0809DC9C @ =0x000003FF
	adds r0, r1, #0
	ands r4, r0
	strh r4, [r5, #4]
	bl sub_0809D9E4
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809DC90: .4byte 0x02014438
_0809DC94: .4byte 0x02014404
_0809DC98: .4byte 0x020144D8
_0809DC9C: .4byte 0x000003FF
_0809DCA0: .4byte 0x02014434
_0809DCA4: .4byte 0x02014400
