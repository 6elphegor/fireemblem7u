	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_8090418
sub_8090418: @ 0x08088F3C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	cmp r1, #0
	beq _08088F7E
	bl PrepGetLatestCharId
	b _08088F82
_08088F54:
	adds r0, r4, #0
	adds r0, #0x2c
	strb r3, [r0]
	strh r3, [r4, #0x3e]
	b _0808902C
_08088F5E:
	adds r0, r4, #0
	adds r0, #0x2c
	strb r3, [r0]
	strh r1, [r4, #0x3e]
	b _0808902C
_08088F68:
	subs r1, r3, r1
	adds r0, r4, #0
	adds r0, #0x2c
	strb r1, [r0]
	b _0808902C
_08088F72:
	adds r1, r4, #0
	adds r1, #0x2c
	movs r0, #1
	strb r0, [r1]
	strh r7, [r4, #0x3e]
	b _0808902C
_08088F7E:
	bl GetLastStatScreenUnitId
_08088F82:
	adds r1, r0, #0
	movs r3, #0
	ldr r0, _08088FBC @ =0x0200E668
	ldrb r6, [r0]
	mov sb, r0
	cmp r3, r6
	bge _0808902C
	lsls r0, r5, #0x18
	asrs r0, r0, #0x18
	mov r8, r0
	movs r0, #0x2c
	adds r0, r0, r4
	mov ip, r0
	movs r5, #0x40
	rsbs r5, r5, #0
	movs r7, #0x10
	rsbs r7, r7, #0
	ldr r2, _08088FC0 @ =0x0200CBF0
_08088FA6:
	mov r0, r8
	cmp r0, #0
	beq _08088FC4
	ldr r0, [r2]
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	cmp r0, r1
	beq _08088FD2
	b _08089020
	.align 2, 0
_08088FBC: .4byte 0x0200E668
_08088FC0: .4byte 0x0200CBF0
_08088FC4:
	ldr r0, [r2]
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r1
	bne _08089020
_08088FD2:
	adds r0, r4, #0
	adds r0, #0x30
	movs r1, #0
	strb r3, [r0]
	cmp r3, #0
	beq _08088F54
	mov r0, sb
	ldrb r2, [r0]
	subs r0, r2, #1
	cmp r3, r0
	bne _08088FFE
	cmp r2, #6
	bls _08088F5E
	movs r0, #5
	mov r1, ip
	strb r0, [r1]
	mov r1, sb
	ldrb r0, [r1]
	subs r0, #6
	lsls r0, r0, #4
	strh r0, [r4, #0x3e]
	b _0808902C
_08088FFE:
	ldrh r2, [r4, #0x3e]
	lsrs r1, r2, #4
	adds r0, r1, #0
	cmp r3, r0
	ble _0808900E
	adds r0, #5
	cmp r3, r0
	blt _08088F68
_0808900E:
	cmp r2, r7
	bgt _08088F72
	cmp r2, r5
	bge _0808902C
	movs r0, #4
	mov r1, ip
	strb r0, [r1]
	strh r5, [r4, #0x3e]
	b _0808902C
_08089020:
	adds r5, #0x10
	adds r7, #0x10
	adds r2, #4
	adds r3, #1
	cmp r3, r6
	blt _08088FA6
_0808902C:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
