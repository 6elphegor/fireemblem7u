	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080669F4
sub_080669F4: @ 0x080669F4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r3, #0
	ldr r3, [sp, #0x18]
	mov ip, r3
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r2, r2, #0x10
	adds r1, r0, #0
	lsrs r2, r2, #0x10
	cmp r2, #0
	beq _08066A50
	movs r0, #0x20
	subs r0, r0, r7
	lsls r0, r0, #0x10
	mov r8, r0
_08066A16:
	adds r3, r7, #0
	subs r5, r2, #1
	cmp r3, #0
	beq _08066A44
	movs r2, #1
	rsbs r2, r2, #0
	lsls r4, r6, #0xc
_08066A24:
	ldrh r0, [r1]
	cmp r6, r2
	beq _08066A30
	adds r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_08066A30:
	cmp ip, r2
	beq _08066A3A
	add r0, ip
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_08066A3A:
	strh r0, [r1]
	adds r1, #2
	subs r3, #1
	cmp r3, #0
	bne _08066A24
_08066A44:
	mov r2, r8
	lsrs r0, r2, #0xf
	adds r1, r1, r0
	adds r2, r5, #0
	cmp r2, #0
	bne _08066A16
_08066A50:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
