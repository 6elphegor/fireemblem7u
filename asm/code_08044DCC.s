	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08044DCC
sub_08044DCC: @ 0x08044DCC
	push {r4, lr}
	ldr r0, _08044E24 @ =0x0202E3DC
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r0, _08044E28 @ =0x0202E3EC
	ldr r0, [r0]
	movs r1, #1
	bl BmMapFillg
	movs r4, #1
_08044DE4:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _08044E18
	ldr r0, [r2]
	cmp r0, #0
	beq _08044E18
	ldr r0, [r2, #0xc]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08044E18
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldr r0, _08044E24 @ =0x0202E3DC
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r2, [r2, #0x10]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	ldr r0, [r1]
	adds r0, r0, r2
	strb r4, [r0]
_08044E18:
	adds r4, #1
	cmp r4, #0xc5
	ble _08044DE4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08044E24: .4byte 0x0202E3DC
_08044E28: .4byte 0x0202E3EC
