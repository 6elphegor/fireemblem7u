	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08011054
sub_08011054: @ 0x08011054
	push {lr}
	ldr r0, _08011094 @ =0x02023C60
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	ldr r3, _08011098 @ =0x03002870
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
	bl ApplySystemGraphics
	bl InitSystemTextFont
	pop {r0}
	bx r0
	.align 2, 0
_08011094: .4byte 0x02023C60
_08011098: .4byte 0x03002870
