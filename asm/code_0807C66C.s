	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807C66C
sub_0807C66C: @ 0x0807C66C
	push {lr}
	ldr r0, _0807C6A4 @ =0x02022C60
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl EnableBgSync
	movs r0, #0
	bl SetOnHBlankA
	ldr r2, _0807C6A8 @ =0x03002870
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_0807C6A4: .4byte 0x02022C60
_0807C6A8: .4byte 0x03002870
