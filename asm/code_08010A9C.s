	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08010A9C
sub_08010A9C: @ 0x08010A9C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, _08010AF0 @ =0x02023C60
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	ldr r3, _08010AF4 @ =0x03002870
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r1, #8
	movs r2, #0
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	ldr r0, [r4, #0x34]
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08010AE8
	bl InitBmBgLayers
_08010AE8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08010AF0: .4byte 0x02023C60
_08010AF4: .4byte 0x03002870
