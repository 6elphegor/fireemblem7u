	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080466C8
sub_080466C8: @ 0x080466C8
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r6, #1
	rsbs r6, r6, #0
	movs r1, #0
	bl sub_08046674
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _08046720
	movs r4, #0
_080466E0:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl sub_0803CD1C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08046714
	ldr r5, _08046728 @ =0x0203DC9C
	adds r0, r5, #0
	adds r0, #0xa
	adds r0, r4, r0
	ldrb r0, [r0]
	cmp r0, #0
	beq _08046714
	ldr r0, _0804672C @ =0x0202BBF8
	ldrb r0, [r0, #0xf]
	cmp r0, r4
	beq _08046714
	lsls r0, r4, #6
	adds r0, #1
	bl sub_08046600
	cmp r6, r0
	bls _08046714
	adds r6, r0, #0
	strb r4, [r5, #2]
_08046714:
	adds r4, #1
	cmp r4, #3
	ble _080466E0
	adds r0, r7, #0
	bl Proc_Break
_08046720:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08046728: .4byte 0x0203DC9C
_0804672C: .4byte 0x0202BBF8
