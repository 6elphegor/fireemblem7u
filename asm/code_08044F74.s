	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08044F74
sub_08044F74: @ 0x08044F74
	push {r4, lr}
	ldr r0, _08044FAC @ =0x0203DC9C
	movs r1, #0
	movs r2, #3
	adds r0, #0xd
_08044F7E:
	strb r1, [r0]
	subs r0, #1
	subs r2, #1
	cmp r2, #0
	bge _08044F7E
	movs r2, #0
	ldr r4, _08044FB0 @ =0x03001400
	ldr r3, _08044FB4 @ =0x0203DCA6
_08044F8E:
	adds r0, r2, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq _08044FA0
	lsrs r0, r0, #6
	adds r0, r0, r3
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
_08044FA0:
	adds r2, #1
	cmp r2, #0x13
	ble _08044F8E
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08044FAC: .4byte 0x0203DC9C
_08044FB0: .4byte 0x03001400
_08044FB4: .4byte 0x0203DCA6
