	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08024B98
sub_08024B98: @ 0x08024B98
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08024BE4 @ =0x0202E3DC
	ldr r0, [r0]
	lsls r6, r5, #2
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _08024BDE
	adds r0, r4, #0
	bl GetTrapAt
	cmp r0, #0
	bne _08024BDE
	ldr r1, _08024BE8 @ =0x08BE3C16
	ldr r0, _08024BEC @ =0x0202E3E0
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	adds r1, r0, r1
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	ble _08024BDE
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0
	bl EnlistTarget
_08024BDE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08024BE4: .4byte 0x0202E3DC
_08024BE8: .4byte 0x08BE3C16
_08024BEC: .4byte 0x0202E3E0
