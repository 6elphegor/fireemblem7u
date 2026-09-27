	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08019D84
sub_08019D84: @ 0x08019D84
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	adds r6, r1, #0
	mov ip, r2
	ldr r5, _08019E48 @ =0x030046A0
	ldr r2, [r5]
	movs r0, #0
	ldrsb r0, [r2, r0]
	adds r6, r6, r0
	movs r0, #1
	ldrsb r0, [r2, r0]
	add ip, r0
	ldr r3, _08019E4C @ =0x030043F0
	ldr r0, _08019E50 @ =0x0202E3E0
	ldr r0, [r0]
	mov r1, ip
	lsls r7, r1, #2
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	adds r0, r0, r3
	mov sb, r0
	ldr r4, _08019E54 @ =0x030041E0
	ldr r1, [r4]
	ldrb r3, [r2, #1]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldrb r2, [r2]
	adds r0, r2, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r2, sb
	ldrb r2, [r2]
	adds r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r7, r1
	ldr r1, [r1]
	adds r1, r1, r6
	ldrb r1, [r1]
	cmp r0, r1
	bge _08019E3C
	movs r0, #8
	ldrsb r0, [r5, r0]
	cmp r0, #0
	beq _08019E0A
	ldr r0, _08019E58 @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0
	beq _08019E0A
	ldrb r3, [r5, #0xa]
	eors r0, r3
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08019E3C
_08019E0A:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	ldrb r1, [r5, #9]
	cmp r0, r1
	bgt _08019E3C
	ldr r0, [r5, #4]
	strb r6, [r0]
	ldr r0, [r5, #4]
	mov r3, ip
	strb r3, [r0, #1]
	ldr r0, [r5, #4]
	mov r1, r8
	strb r1, [r0, #2]
	ldr r0, [r5, #4]
	strb r2, [r0, #3]
	ldr r0, [r5, #4]
	adds r0, #4
	str r0, [r5, #4]
	ldr r1, [r4]
	mov r3, ip
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r6
	strb r2, [r0]
_08019E3C:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08019E48: .4byte 0x030046A0
_08019E4C: .4byte 0x030043F0
_08019E50: .4byte 0x0202E3E0
_08019E54: .4byte 0x030041E0
_08019E58: .4byte 0x0202E3DC
