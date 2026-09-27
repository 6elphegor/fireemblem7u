	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08021F1C
sub_08021F1C: @ 0x08021F1C
	push {r4, lr}
	ldr r0, _08021F6C @ =0x03004690
	ldr r3, [r0]
	ldr r1, [r3, #0xc]
	movs r2, #0x40
	ands r1, r2
	adds r4, r0, #0
	cmp r1, #0
	bne _08021F68
	movs r0, #0x11
	ldrsb r0, [r3, r0]
	ldr r1, _08021F70 @ =0x0202E3E0
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r3, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #3
	beq _08021F54
	cmp r0, #5
	beq _08021F54
	cmp r0, #0x38
	beq _08021F54
	cmp r0, #0x37
	bne _08021F68
_08021F54:
	ldr r1, [r4]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetAvailableTileEventCommand
	cmp r0, #0xe
	beq _08021F74
_08021F68:
	movs r0, #3
	b _08021F86
	.align 2, 0
_08021F6C: .4byte 0x03004690
_08021F70: .4byte 0x0202E3E0
_08021F74:
	ldr r0, [r4]
	bl IsUnitMagicSealed
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08021F84
	movs r0, #1
	b _08021F86
_08021F84:
	movs r0, #2
_08021F86:
	pop {r4}
	pop {r1}
	bx r1
