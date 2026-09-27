	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08079704
sub_08079704: @ 0x08079704
	push {lr}
	movs r0, #0x65
	bl SetFlag
	movs r0, #0x2b
	movs r1, #0
	bl StartBgm
	ldr r0, _0807972C @ =0x0202BBF8
	adds r0, #0x41
	movs r1, #1
	ldrb r2, [r0]
	orrs r1, r2
	strb r1, [r0]
	ldr r0, _08079730 @ =0x08CA749C
	bl StartEvent
	pop {r0}
	bx r0
	.align 2, 0
_0807972C: .4byte 0x0202BBF8
_08079730: .4byte 0x08CA749C
