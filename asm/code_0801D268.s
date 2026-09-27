	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0801D268
sub_0801D268: @ 0x0801D268
	push {lr}
	adds r0, #0x4a
	movs r1, #0x11
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _0801D284
	ldr r0, _0801D298 @ =0x02023C60
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
_0801D284:
	ldr r1, _0801D29C @ =0x0202BBB8
	movs r0, #0xfc
	ldrb r2, [r1, #4]
	ands r0, r2
	strb r0, [r1, #4]
	bl InitBmBgLayers
	pop {r0}
	bx r0
	.align 2, 0
_0801D298: .4byte 0x02023C60
_0801D29C: .4byte 0x0202BBB8
