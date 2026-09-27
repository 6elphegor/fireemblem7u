	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08038BEC
sub_08038BEC: @ 0x08038BEC
	push {r4, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	ldr r1, _08038C24 @ =0x0202E3E4
	ldr r0, [r1]
	lsls r2, r4, #2
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x77
	bgt _08038C20
	ldr r0, _08038C28 @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r2, [r0]
	cmp r2, #0
	beq _08038C30
	ldr r0, _08038C2C @ =0x0202BD48
	ldrb r0, [r0]
	cmp r2, r0
	beq _08038C30
_08038C20:
	movs r0, #0xff
	b _08038C3C
	.align 2, 0
_08038C24: .4byte 0x0202E3E4
_08038C28: .4byte 0x0202E3DC
_08038C2C: .4byte 0x0202BD48
_08038C30:
	ldr r1, [r1]
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
_08038C3C:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
