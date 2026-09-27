	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08088DC0
sub_08088DC0: @ 0x08088DC0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x28
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x14
	ldr r3, _08088E74 @ =0x0200E668
	movs r2, #0xff
	add r1, sp, #0x1c
_08088DD2:
	str r2, [r1]
	subs r1, #4
	cmp r1, sp
	bge _08088DD2
	cmp r0, #0
	ble _08088DE0
	subs r0, #1
_08088DE0:
	movs r6, #0
	ldrb r3, [r3]
	cmp r0, r3
	bge _08088E26
	ldr r1, _08088E78 @ =0x0200CBF0
	adds r5, r0, #0
	mov r7, sp
	lsls r0, r5, #2
	adds r4, r0, r1
_08088DF2:
	ldr r0, [r4]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08088E12
	ldr r0, [r4]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemIconId
	str r0, [r7]
_08088E12:
	adds r5, #1
	adds r7, #4
	adds r4, #4
	adds r6, #1
	cmp r6, #7
	bgt _08088E26
	ldr r0, _08088E74 @ =0x0200E668
	ldrb r0, [r0]
	cmp r5, r0
	blt _08088DF2
_08088E26:
	movs r6, #0
	ldr r7, _08088E7C @ =0x0200E66C
	mov r8, r7
_08088E2C:
	lsls r1, r6, #2
	mov r2, r8
	adds r0, r1, r2
	ldr r0, [r0]
	adds r4, r1, #0
	adds r6, #1
	cmp r0, #0xff
	beq _08088E64
	movs r5, #0
	adds r1, r0, #0
	mov r2, sp
	movs r3, #7
_08088E44:
	ldr r0, [r2]
	cmp r0, r1
	bne _08088E4C
	movs r5, #1
_08088E4C:
	adds r2, #4
	subs r3, #1
	cmp r3, #0
	bge _08088E44
	cmp r5, #0
	bne _08088E64
	adds r4, r4, r7
	ldr r0, [r4]
	bl ClearIcon
	movs r0, #0xff
	str r0, [r4]
_08088E64:
	cmp r6, #7
	ble _08088E2C
	add sp, #0x28
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08088E74: .4byte 0x0200E668
_08088E78: .4byte 0x0200CBF0
_08088E7C: .4byte 0x0200E66C
