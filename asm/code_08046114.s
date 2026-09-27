	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08046114
sub_08046114: @ 0x08046114
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	movs r3, #0
_0804611E:
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	str r3, [sp]
	bl sub_0803CD1C
	lsls r0, r0, #0x18
	ldr r3, [sp]
	adds r1, r3, #1
	mov r8, r1
	cmp r0, #0
	beq _08046184
	movs r6, #0
	movs r7, #0
	ldr r0, _08046198 @ =0x03001400
	adds r4, r3, r0
	movs r5, #4
_0804613E:
	ldrb r0, [r4]
	cmp r0, #0
	beq _0804616C
	adds r7, #1
	str r3, [sp]
	bl GetUnit
	adds r2, r0, #0
	ldr r0, [r2, #0xc]
	ldr r1, _0804619C @ =0x00010004
	ands r0, r1
	ldr r3, [sp]
	cmp r0, #0
	bne _0804616C
	adds r0, r2, #0
	bl sub_080454C0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r3, [sp]
	cmp r0, #1
	bne _0804616C
	adds r6, #1
_0804616C:
	adds r4, #5
	subs r5, #1
	cmp r5, #0
	bge _0804613E
	cmp r6, #0
	bne _08046184
	cmp r7, #0
	beq _08046184
	ldr r0, _080461A0 @ =0x0203DC9C
	adds r0, #0xa
	adds r0, r3, r0
	strb r6, [r0]
_08046184:
	mov r3, r8
	cmp r3, #3
	ble _0804611E
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08046198: .4byte 0x03001400
_0804619C: .4byte 0x00010004
_080461A0: .4byte 0x0203DC9C
