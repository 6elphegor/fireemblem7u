	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08008F6C
sub_08008F6C: @ 0x08008F6C
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	cmp r1, #0
	beq _08008F7A
	movs r6, #6
	movs r5, #5
	b _08008F7E
_08008F7A:
	movs r6, #5
	movs r5, #6
_08008F7E:
	cmp r3, #0
	blt _08008F8A
	cmp r3, #2
	ble _08008F8A
	cmp r3, #5
	ble _08008F90
_08008F8A:
	movs r1, #0
	movs r4, #2
	b _08008F94
_08008F90:
	movs r1, #3
	movs r4, #5
_08008F94:
	adds r2, r1, #0
	cmp r2, r4
	bgt _08008FC2
	ldr r7, _08008FB4 @ =0x08B909B8
_08008F9C:
	ldr r0, [r7]
	lsls r1, r2, #2
	adds r0, #0x18
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _08008FBC
	cmp r2, r3
	bne _08008FB8
	adds r0, #0x41
	strb r6, [r0]
	b _08008FBC
	.align 2, 0
_08008FB4: .4byte 0x08B909B8
_08008FB8:
	adds r0, #0x41
	strb r5, [r0]
_08008FBC:
	adds r2, #1
	cmp r2, r4
	ble _08008F9C
_08008FC2:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
