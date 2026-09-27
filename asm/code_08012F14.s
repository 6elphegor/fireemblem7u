	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08012F14
sub_08012F14: @ 0x08012F14
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov sb, r2
	ldr r5, _08012F4C @ =0x0202B3B4
	movs r0, #0x80
	lsls r0, r0, #1
	adds r4, r5, r0
	movs r1, #0x80
	lsls r1, r1, #2
	adds r6, r5, r1
	mov sl, r4
	ldr r0, _08012F50 @ =0xFFFFF200
	adds r1, r5, r0
	adds r0, r5, #0
	bl StringCopy
	b _08012F9A
	.align 2, 0
_08012F4C: .4byte 0x0202B3B4
_08012F50: .4byte 0xFFFFF200
_08012F54:
	adds r0, r1, #0
	cmp r0, #0x1f
	bhi _08012F5E
	strb r1, [r4]
	b _08012F76
_08012F5E:
	cmp r0, #0x80
	beq _08012F66
	strb r1, [r4]
	b _08012F76
_08012F66:
	adds r5, #1
	ldrb r1, [r5]
	cmp r1, #0x20
	beq _08012F7C
	strb r0, [r4]
	adds r4, #1
	ldrb r0, [r5]
	strb r0, [r4]
_08012F76:
	adds r5, #1
	adds r4, #1
	b _08012F9A
_08012F7C:
	bl GetTacticianName
	adds r1, r0, #0
	adds r0, r4, #0
	bl StringCopy
	ldrb r0, [r4]
	adds r1, r5, #1
	cmp r0, #0
	beq _08012F98
_08012F90:
	adds r4, #1
	ldrb r0, [r4]
	cmp r0, #0
	bne _08012F90
_08012F98:
	adds r5, r1, #0
_08012F9A:
	ldrb r1, [r5]
	cmp r1, #0
	bne _08012F54
	movs r0, #0
	strb r0, [r4]
	cmp r7, #0
	bne _08012FB0
	ldr r0, _08012FAC @ =0x0202B4B4
	b _08012FD4
	.align 2, 0
_08012FAC: .4byte 0x0202B4B4
_08012FB0:
	mov r0, r8
	lsls r1, r0, #0x18
	asrs r1, r1, #0x18
	mov r0, sb
	lsls r2, r0, #0x18
	asrs r2, r2, #0x18
	mov r0, sl
	bl GetArticle
	adds r1, r6, #0
	bl sub_08012EFC
	adds r6, r0, #0
	mov r0, sl
	adds r1, r6, #0
	bl sub_08012EFC
	ldr r0, _08012FE4 @ =0x0202B5B4
_08012FD4:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08012FE4: .4byte 0x0202B5B4
