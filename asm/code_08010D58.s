	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08010D58
sub_08010D58: @ 0x08010D58
	push {lr}
	ldr r0, _08010D90 @ =0x02023C60
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	ldr r3, _08010D94 @ =0x03002870
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
	bl InitBmBgLayers
	pop {r0}
	bx r0
	.align 2, 0
_08010D90: .4byte 0x02023C60
_08010D94: .4byte 0x03002870
