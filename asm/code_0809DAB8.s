	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809DAB8
sub_0809DAB8: @ 0x0809DAB8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r0, #0
	mov sl, r0
	movs r7, #0
	bl sub_0809D844
	ldr r4, _0809DB50 @ =0x02014404
	ldr r0, [r4]
	ldr r5, _0809DB54 @ =0x02014438
	adds r0, r0, r5
	ldr r1, _0809DB58 @ =0x020144D8
	ldrh r1, [r1, #6]
	bl sub_0809D9A4
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	movs r2, #0
	ldr r0, [r4]
	cmp sl, r0
	bge _0809DB02
	mov r8, r5
	ldr r5, _0809DB5C @ =0x02014400
_0809DAEC:
	mov r1, r8
	adds r0, r2, r1
	ldrb r6, [r0]
	subs r1, r6, r3
	ldrb r6, [r5]
	ands r1, r6
	strb r1, [r0]
	adds r2, #1
	ldr r0, [r4]
	cmp r2, r0
	blt _0809DAEC
_0809DB02:
	ldr r0, _0809DB58 @ =0x020144D8
	movs r1, #0
	strh r1, [r0]
	strh r1, [r0, #2]
	strh r1, [r0, #4]
	ldr r1, _0809DB54 @ =0x02014438
	ldr r2, _0809DB60 @ =0x020143FC
	mov sb, r2
	mov r8, r0
	mov r0, sl
	adds r6, r0, r1
_0809DB18:
	adds r0, r7, #0
	movs r1, #3
	bl __modsi3
	adds r5, r0, #0
	cmp r5, #0
	bne _0809DB64
	ldrb r4, [r6]
	mov r2, sb
	ldr r1, [r2]
	adds r0, r7, #0
	bl __modsi3
	asrs r4, r0
	movs r0, #1
	ands r4, r0
	adds r0, r7, #0
	movs r1, #3
	bl __divsi3
	lsls r4, r0
	mov r0, r8
	ldrh r0, [r0]
	orrs r4, r0
	mov r1, r8
	strh r4, [r1]
	b _0809DBB4
	.align 2, 0
_0809DB50: .4byte 0x02014404
_0809DB54: .4byte 0x02014438
_0809DB58: .4byte 0x020144D8
_0809DB5C: .4byte 0x02014400
_0809DB60: .4byte 0x020143FC
_0809DB64:
	cmp r5, #1
	bne _0809DB8E
	ldrb r4, [r6]
	mov r2, sb
	ldr r1, [r2]
	adds r0, r7, #0
	bl __modsi3
	asrs r4, r0
	ands r4, r5
	adds r0, r7, #0
	movs r1, #3
	bl __divsi3
	lsls r4, r0
	mov r0, r8
	ldrh r0, [r0, #2]
	orrs r4, r0
	mov r1, r8
	strh r4, [r1, #2]
	b _0809DBB4
_0809DB8E:
	ldrb r4, [r6]
	mov r2, sb
	ldr r1, [r2]
	adds r0, r7, #0
	bl __modsi3
	asrs r4, r0
	movs r0, #1
	ands r4, r0
	adds r0, r7, #0
	movs r1, #3
	bl __divsi3
	lsls r4, r0
	mov r0, r8
	ldrh r0, [r0, #4]
	orrs r4, r0
	mov r1, r8
	strh r4, [r1, #4]
_0809DBB4:
	adds r7, #1
	mov r2, sb
	ldr r1, [r2]
	adds r0, r7, #0
	bl __modsi3
	cmp r0, #0
	bne _0809DBC6
	adds r6, #1
_0809DBC6:
	cmp r7, #0x1e
	bne _0809DB18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
